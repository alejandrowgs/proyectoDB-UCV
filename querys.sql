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


