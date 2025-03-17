/*A.  Es  necesario  eliminar  uno  de  los  tipos  de  envío  para simplificar las opciones a nuestros clientes, 
para  ello:
-necesitamos  tener  un  reporte  sobre  los  tipos  de  envío  actuales  que  detalle  la 
información  de cada uno 
-y además calcule lo siguiente: Cantidad de veces usado, Proporción de uso en relación al total de envíos, 
ingresos totales por ese tipo de envío, proporción de ingresos en relación al total de ingreso por envíos. 
Las proporciones deben ser expresadas en porcentajes.*/


-- Hare uso de: OrdenOnline(id, clienteId, nroOrden, fechaCreacion, tipoEnviold, facturaId) para los calculos
SELECT TE.id, TE.nombreEnvio, TE.tiempoEstimadoEntrega, TE.costoEnvio, T1.cantidadVecesUsado, T2.proporcionDeUso, T3.ingresoTotalPorTipoEnvio, T5.IngresoEnRelacionAlTotalDeIngresoPorEnvio
FROM  TipoEnvio TE, (SELECT COUNT(OO.tipoEnvioId) AS cantidadVecesUsado
                     FROM TipoEnvio TE, OrdenOnline OO
                     WHERE OO.tipoEnvioId IN (SELECT id FROM TipoEnvio)
                                              --No uso directo el alias asociado porque no se transfiera su uso entre consultas en el mismo nivel 
                    ) AS T1, (SELECT ((COUNT(OO.tipoEnvioId) * 100.0) / (SELECT COUNT(*) FROM OrdenOnline)) AS proporcionDeUso
                              FROM tipoEnvio TE
                              JOIN OrdenOnline OO ON TE.id = OO.tipoEnvioId           --Por temas de rendimiento uso Join
                              GROUP BY TE.id
                                              
                             ) AS T2, (SELECT (SUM(TE.costoEnvio)) AS ingresoTotalPorTipoEnvio              --Puedo agrupar sin indicar en el select, porque aplicaria la misma nocion que para la funcion COUNT
                                       FROM tipoEnvio TE
                                       JOIN OrdenOnline OO ON TE.id = OO.tipoEnvioId
                                       GROUP BY TE.id     --Agrupo por envio para sumar su monto en filas de cada grupo
                                      
                                      ) AS T3, (SELECT (SUM(T4.ingresoTotalPorTipoEnvio)) AS IngresoEnRelacionAlTotalDeIngresoPorEnvio 
                                                FROM (SELECT (SUM(TE.costoEnvio)) AS ingresoTotalPorTipoEnvio
                                                      FROM tipoEnvio TE
                                                      JOIN OrdenOnline OO ON TE.id = OO.tipoEnvioId
                                                      GROUP BY TE.id 
                                                     ) AS T4          -- Recalculando T3, ya que el Scope por usar Ti no permite reutilizar
                                                
                                               ) AS T5    --Suma del costo por cada tipo de envio/ suma de la suma del costo por tipo de envio x.x

--CONSULTA B.
WITH TotalGastos AS ( --Tabla temporal
    -- Total en compras online
    SELECT 
        c.id AS clienteId,
        SUM(f.montoTotal) AS TotalOnline,
        0 AS TotalFisica
    FROM Cliente c
    INNER JOIN Factura f ON c.id = f.clienteId
    INNER JOIN OrdenOnline oo ON f.id = oo.facturaId
    WHERE f.fechaEmision >= DATEADD(YEAR, -1, GETDATE()) -- ultimo año
    GROUP BY c.id

    UNION ALL

    -- Total en compras fisicas
    SELECT 
        c.id AS clienteId,
        0 AS TotalOnline,
        SUM(f.montoTotal) AS TotalFisica
    FROM Cliente c
    INNER JOIN Factura f ON c.id = f.clienteId
    INNER JOIN VentaFisica vf ON f.id = vf.facturaId
    WHERE f.fechaEmision >= DATEADD(YEAR, -1, GETDATE()) 
    GROUP BY c.id
),
GastoTotal AS (
    SELECT 
        tg.clienteId,
        SUM(tg.TotalOnline) AS TotalGastadoOnline,
        SUM(tg.TotalFisica) AS TotalGastadoFisica
    FROM TotalGastos tg
    GROUP BY tg.clienteId
),
MetodoPagoPredilecto AS (
    -- Metodo de pago predilecto
    SELECT 
        p.facturaId,
        c.id AS clienteId,
        fp.nombre AS MetodoPago,
        COUNT(*) AS Frecuencia
    FROM Cliente c
    INNER JOIN Factura f ON c.id = f.clienteId
    INNER JOIN Pago p ON f.id = p.facturaId
    INNER JOIN FormaPago fp ON p.metodoPagoId = fp.id
    WHERE f.fechaEmision >= DATEADD(YEAR, -1, GETDATE()) -- ultimo año
    GROUP BY c.id, fp.nombre, p.facturaId
),
MetodoPagoCliente AS (
    -- Metodo de pago mas frecuente
    SELECT 
        clienteId,
        MetodoPago,
        MAX(Frecuencia) AS MaxFrecuencia
    FROM MetodoPagoPredilecto
    GROUP BY clienteId, MetodoPago
)

-- Consultamos las tablas temporales
SELECT 
    c.nombre AS NombreCliente,
    c.apellido AS ApellidoCliente,
    gt.TotalGastadoOnline,
    gt.TotalGastadoFisica,
    mpc.MetodoPago AS MetodoPagoPredilecto
FROM Cliente c
INNER JOIN GastoTotal gt ON c.id = gt.clienteId
LEFT JOIN MetodoPagoCliente mpc ON c.id = mpc.clienteId;


/*C.  Obtener  el  nombre  del  producto,  la  categoría  y  la  marca  de  los  productos  que
han  sido recomendados para clientes que han comprado al menos una vez en el último mes, 
y que además están en el carrito de compras de algún otro cliente.
*/

SELECT P.nombre, Cat.nombre, M.nombre
FROM Producto P, Categoria Cat, Marca M, ProductoRecomendadoParaCliente PRC, HistorialClienteProducto HCP, Cliente Clie  

WHERE P.categoriaId = Cat.id
AND P.marcaId = M.id

WHERE Clie.id = HCP.clienteId
AND HCP.fecha = MONTH(curDate())
AND HCP.productoId = PE.productoRecomendadoId       --Prod de todos los clientes que han comprando en el ultimo mes
AND HCP.productoId IN (SELECT Carr.productoId
                       FROM Carrito Carr, Cliente Cl
                       WHERE Clie.id != Cl.id         --Clie el que compró y cl el cliente del carrito
                       AND HCP.productoId = Carr.productoId
                      )


/*D. 
Queremos  un  reporte  completo  de  empleados  que  cumplen  con  al  menos  una  de  estas 
características: 
Han vendido productos en más de 1 sucursal, 
trabajan en la misma sucursal que su supervisor  
y  tienen  un  cargo  que  se  encuentra  entre  los  mejores  5  pagados  de  la  empresa.  

El reporte debe tener: información de empleado (CI, nombre completo, sexo), información del cargo 
(nombre), e información de su sueldo detallada (salario base por su cargo por hora, bono fijo que 
obtiene  mensualmente, el  total  por  mes  que  obtiene  el  empleado  dadas  sus  horas  y  días 
trabajados 
** y el monto total que ha recibido desde que empezó su contrato).*/

SELECT T1.*
FROM(SELECT E.CI, E.nombre, E.apellido, E.sexo, C.nombre, C.salarioBasePorHora, E.bonoFijoMensual, 
      (E.bonoFijoMensual + C.salarioBasePorHora) as totalObtenidoPorMes, 
      (DATEDIFF(month, E.fechaContrato, curDate())/30.4)* T1.totalObtenidoPorMes as montoTotalDesdeSuInicio    --** Asumiendoo que desde que inicio, su sueldo no ha variado
    FROM Empleado E, Cargo C 
    ) as T1

WHERE E.id IN( SELECT E.id   
                FROM Empleado E, VentaFisica VF
                WHERE E.id = VF.empleadoId
                GROUP BY E.id
                HAVING COUNT(DISTINC(VF.sucursalId)) > 1   --Num de sucursales donde los empleados han vendido
                                                                                            
                UNION   

                SELECT E.id
                FROM Empleado E, Empleado Emp                  --Aplicando la de '2 instancias de una misma tabla... trabajarian de forma independiente'
                WHERE E.id != Emp.empleadoSupervisorId                --Para evitar que sea el mismo que se supervisa jkskjs
                AND E.sucursalId = (SELECT id FROM Sucursal)                     --Puede ser un join natural =   Pero considero que por sia, lo compare contra todas las sucursales
                AND Emp.sucursalId = (SELECT id FROM Sucursal)
                AND E.sucursalId = Emp.sucursalId

                UNION 

                SELECT E.id
                FROM Empleado E
                WHERE E.cargoId IN (SELECT TOP 5 C.id 
                                    FROM Cargo C
                                    ORDER BY C.salarioBasePorHora DESC)
                        
            )

--CONSULTA E 
WITH ProductosAdquiridos AS (
    -- Obtener productos adquiridos por clientes
    SELECT
        f.clienteId,
        fd.productoId,
        f.fechaEmision AS fechaCompra,
        c.CI,
        c.nombre AS NombreCliente,
        c.sexo,
        p.nombre AS NombreProducto,
        cat.nombre AS Categoria,
        m.nombre AS Marca
    FROM Factura f
    INNER JOIN FacturaDetalle fd ON f.id = fd.facturaId
    INNER JOIN Cliente c ON f.clienteId = c.id
    INNER JOIN Producto p ON fd.productoId = p.id
    INNER JOIN Categoria cat ON p.categoriaId = cat.id
    INNER JOIN Marca m ON p.marcaId = m.id
),
ProductosPorRecomendacion AS (
    SELECT 
        pac.clienteId,
        pac.productoRecomendadoId AS productoId,
        pac.fechaRecomendacion
    FROM ProductoRecomendadoParaCliente pac
),
ClasificacionProductos AS (
    -- Clasificar productos
    SELECT 
        pa.clienteId,
        pa.CI,
        pa.NombreCliente,
        pa.sexo,
        pa.NombreProducto,
        pa.Categoria,
        pa.Marca,
        CASE 
            WHEN pr.fechaRecomendacion IS NOT NULL AND pa.fechaCompra > pr.fechaRecomendacion THEN 1
            ELSE 0
        END AS EsPorRecomendacion
    FROM ProductosAdquiridos pa
    LEFT JOIN ProductosPorRecomendacion pr 
        ON pa.clienteId = pr.clienteId AND pa.productoId = pr.productoId
),
ConteoPorCliente AS (
    -- Contar productos recomendados y no recomendados
    SELECT 
        clienteId,
        CI,
        NombreCliente,
        sexo,
        SUM(CASE WHEN EsPorRecomendacion = 1 THEN 1 ELSE 0 END) AS ProductosRecomendados,
        SUM(CASE WHEN EsPorRecomendacion = 0 THEN 1 ELSE 0 END) AS ProductosNoRecomendados,
        COUNT(*) AS TotalProductos
    FROM ClasificacionProductos
    GROUP BY clienteId, CI, NombreCliente, sexo
),
ProporcionPorCliente AS (
    -- Calcular proporciones manualmente
    SELECT 
        clienteId,
        CI,
        NombreCliente,
        sexo,
        ProductosRecomendados,
        ProductosNoRecomendados,
        CONCAT(CAST((CAST(ProductosRecomendados AS FLOAT) / NULLIF(TotalProductos, 0)) * 100 AS VARCHAR), '%') AS ProporcionRecomendados,
        CONCAT(CAST((CAST(ProductosNoRecomendados AS FLOAT) / NULLIF(TotalProductos, 0)) * 100 AS VARCHAR), '%') AS ProporcionNoRecomendados
    FROM ConteoPorCliente
)
-- Resultados
SELECT 
    CI,
    NombreCliente,
    sexo,
    ProductosRecomendados,
    ProductosNoRecomendados,
    ProporcionRecomendados,
    ProporcionNoRecomendados
FROM ProporcionPorCliente
ORDER BY NombreCliente;


/*F.  Los  directivos  desean  saber  cuáles  productos  marca  Gama  fueron  comprados  en  los  meses  
que hacen rebajas para ellos en la tienda (junio y agosto). Imprima los productos además de la promo 
“Verano  EN  GaMa”  y promos especializadas de esos productos, si no tienen promos igualmente 
debe imprimir el producto.*/

--    ** Asumiendo que solo los nombres y no toda su informacion?
SELECT P.nombre, 'Verano EN GaMa' as tipoPromo, T1.*                       -- Imprima los productos    
FROM Producto P, Marca M, Promo Pr, (SELECT 
                                     FROM Promo Pr LEFT JOIN PromoEspecializada PE    --Promo especializada 
                                     ON PE.id = Pr.id                                 
                                     JOIN Producto P 
                                     ON PE.productoId = P.id          --de esos productos
                                     JOIN Marca M ON P.marcaId = M.id
                                     JOIN FacturaPromo ON FP.promoId = Pr.id
                                     JOIN Factura ON FP.facturaId = F.id
                                     WHERE M.nombre = "Gama"                            
                                    --Debo hacer lo mismo para que sean las Promos especializ de esos productos especificos
                                     AND MONTH(Pr1.fechaInicio) = 06 AND MONTH(Pr1.fechaInicio) = 08      --(junio y agosto)  Serian los dos a la vez
                                    ) as T1
WHERE P.marcaId = M.id
AND M.nombre = "Gama"
AND FP.facturaId IN (SELECT F.id FROM Factura)        --FacturaPromo es donde se asocia una promo a cualquier compra
AND FP.promoId IN (SELECT Pr.id FROM Promo)
AND MONTH(Pr1.fechaInicio) = 06 AND MONTH(Pr1.fechaFin) = 08          

/*
DECLARE @PrintMessage NVARCHAR(50);
SET @PrintMessage = 'Verano EN GaMa';
PRINT @PrintMessage;
GO
*/

/*H. Calcular el porcentaje de clientes que han realizado una segunda compra dentro de los 30 días 
posteriores a su primera compra.*/

--Relacion entre cliente y factura (por tener la fecha)
--Factura(id, fechaEmisión, clienteId, subTotal, montoDescuentoTotal, porcentajeIVA, montoIVA, montoTotal)

SELECT ((COUNT(DISTINC(C.id)) * 100) / SELECT (DISTINCT(F.clienteId)) FROM Factura F) AS CantidadClientesQueRealizaron2daCompra
FROM Factura F, (SELECT MIN(F1.fechaEmision) AS primeraCompra           --Misma nocion que para el Count y el uso de Gruop By
                 FROM Factura F1
                 WHERE F1.clienteId IN (SELECT id FROM Cliente)
                 GROUP BY F1.clienteId;              --**

                ) AS T1, (SELECT MIN(F2.fechaEmision) AS segundaCompra
                          FROM Factura F2
                          WHERE F2.clienteId IN (SELECT id FROM Cliente)
                          AND F2.clienteId = F1.clienteId
                          AND F2.segundaCompra > F1.primeraCompra
                          GROUP BY F1.clienteId;
                         ) AS T2
JOIN Cliente C ON F.clienteId = C.id
WHERE DATEDIFF(day, T1.primeraCompra, T2.segundaCompra) <= 30
GROUP BY C.id
HAVING COUNT(*) > 1           --Me aseguro que el cliente tiene al menos 2 compras para poder calcular todo
 

/*J.  Un  cliente  desea  comprar  productos  al  mayor  y  solicitó  un  presupuesto. Los productos a mostrar 
deben  ser  de  categoría  Chucherías.  Listar  nombre,  precio  actual,  precio con descuento del 10% 
por ser al mayor y para el stock se debe imprimir “Últimos disponibles” si es menor de 10, “Pocos 
disponibles” si es menor de 20 y “Disponible” de caso contrario. */

                                                                      --Si el precio con descuento resultó alguno de estos
SELECT P.nombre,  P.precioPor as precioActual, T1.precioConDescuento, (CASE 
                                                                       WHEN T1.precioConDescuento < 10 'Últimos disponibles'
                                                                       WHEN T1.precioConDescuento < 20 'Pocos disponibles'
                                                                       ELSE 'Disponible'  
                                                                      ) AS stock
--Preferi hacer una consulta en el From para no llenar tanto la externa para filtrar el descuento
FROM Producto P, Categoria Cat, PromoEspecializada PE, (SELECT P.precioPor AS precioConDescuento
                                                        FROM PromoEspecializada PE, Promo Pro, Categoria Cat
                                                        --Comencé a relacionar con promoEspecializada para poder llegar hasta promo 
                                                        --y filtrar los que cumplan con ese descuento 
                                                        WHERE PE.productoId IN (SELECT id FROM Producto)      
                                                        AND PE.promoId IN (SELECT id FROM Promo)
                                                        AND PE.categoriaId IN (SELECT id FROM Categoría)
                                                        AND Pro.tipoDescuento = 'Porcentaje'
                                                        AND Pro.valorDescuento = 10
                                                        --Agregue la cat a cumplir, porque sino traeria todos los productos sin importar la cat 
                                                        AND Cat.nombre = 'Chucherías'   
                                                      ) as T1
WHERE P.categoriaId IN (SELECT id FROM Categoria)
--La cat aqui sera para filtrar el nombre y el precio actual
AND Cat.nombre = 'Chucherías'


  -- Este es el G, lo hice como varias consultas así porque no se como hacerlo como un solo select con demasiadas subconsultas anidadas :p



WITH OrdenesRecientes AS (SELECT id AS ordenId, clienteId
    FROM OrdenOnline
    WHERE fechaCreacion >= DATEADD(MONTH, -6, GETDATE())), --Viendolo paso por paso este es el a del enunciado

ProductosOrden AS (SELECT orre.ordenId, orre.clienteId, p.id AS productoId, c.nombre AS categoria
    FROM OrdenesRecientes orre
    INNER JOIN OrdenDetalle od ON orre.ordenId = od.ordenId
    INNER JOIN Producto p ON od.productoId = p.id
    INNER JOIN Categoria c ON p.categoriaId = c.id), --Revisar si esto de verdad da los productos y sus categorias

OrdenesValidas AS (SELECT ordenId, clienteId
    FROM ProductosOrden
    WHERE categoria IN ('Electrónica', 'Hogar')  --Las categorías del enunciado, revisar si en los insert están. EDIT: Faltaba electrónica xd
    GROUP BY ordenId, clienteId
    HAVING 
        COUNT(DISTINCT CASE WHEN categoria = 'Electrónica' THEN productoId END) >= 1
        AND COUNT(DISTINCT CASE WHEN categoria = 'Hogar' THEN productoId END) >= 1), --Estos having estan cheveres porque nos asegura que hay al menos 1 item


OrdenesConTarjeta AS (SELECT orre.ordenId, orre.clienteId
    FROM OrdenesRecientes orre
    INNER JOIN Pago p ON orre.ordenId = p.facturaId
    INNER JOIN FormaPago fp ON p.metodoPagoId = fp.id
    WHERE fp.nombre = 'Tarjeta de credito'), -- El tipo de pago, verificar si está en el insert

MontoCliente AS (SELECT ov.clienteId, SUM(od.cantidad * od.precioPor) AS monto_total
    FROM OrdenesValidas ov
    INNER JOIN OrdenDetalle od ON ov.ordenId = od.ordenId
    GROUP BY ov.clienteId) --Monto total gastado por cliente y toma en cuenta las ordenes validas


SELECT mc.clienteId, mc.monto_total
FROM MontoCliente mc
WHERE mc.monto_total > (SELECT AVG(monto_total) AS promedio_gasto
        FROM (SELECT orre.clienteId, SUM(od.cantidad * od.precioPor) AS monto_total
            FROM OrdenesRecientes orre
            INNER JOIN OrdenDetalle od ON orre.ordenId = od.ordenId
            GROUP BY orre.clienteId) AS gasto_clientes)
    AND mc.clienteId IN (SELECT ov.clienteId
        FROM OrdenesValidas ov
        INNER JOIN OrdenesConTarjeta oct ON ov.ordenId = oct.ordenId
        GROUP BY ov.clienteId
        HAVING 
            COUNT(DISTINCT ov.ordenId) >= 3); --Sufrí con esto anidado más de lo que quiero admitir, parece que ya funciona



-- Aquí agrego el I


SELECT TOP 10 p.nombre AS Producto, SUM(fd.cantidad) AS Vendidos_Totales, SUM(fd.cantidad * fd.precioPor) AS Ingresos_Generados,
    (SUM(fd.cantidad * fd.precioPor) / (SELECT SUM(fdsub.cantidad * fdsub.precioPor) 
                                         FROM FacturaDetalle fdsub)) * 100 AS Contribucion_total --Con esta subconsulta tenemos el total de ingresos general
FROM 
    FacturaDetalle fd
INNER JOIN  -- Si es INNER
    Producto p ON fd.productoId = p.id 
GROUP BY 
    p.id, p.nombre
ORDER BY 
    Contribucion_total DESC; -- Creo que sale mejor ordenarlo así para verlo en base a quien contribuyó más



