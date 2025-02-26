/*C.  Obtener  el  nombre  del  producto,  la  categoría  y  la  marca  de  los  productos  que
han  sido recomendados para clientes que han comprado al menos una vez en el último mes, 
y que además están en el carrito de compras de algún otro cliente.
*/

SELECT P.nombre, Cat.nombre, M.nombre
FROM Producto P, Categoria Cat, Marca M, ProductoRecomendadoParaCliente PRC, HistorialClienteProducto HCP, Cliente Clie  
--** Clie sera el que compró productos - Cli sera el cliente con el carrito - Cl sera la tabla general

WHERE P.categoriaId = Cat.id
AND P.marcaId = M.id

WHERE Clie.id = HCP.clienteId
AND HCP.fecha = MONTH(curDate())
AND HCP.productoId = PE.productoRecomendadoId       --Prod de todos los clientes que han comprando en el ultimo mes
AND HCP.productoId IN (SELECT Carr.productoId
                       FROM Carrito Carr, Cliente Cl
                       WHERE Clie.id != Cl.id
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
      (DATEDIFF(month, E.fechaContrato, curDate())/30.4)* T1.totalObtenidoPorMes as montoTotalDesdeSuInicio    --**
    FROM Empleado E, Cargo C 
    ) as T1

WHERE E.id IN( SELECT E.id   
                FROM Empleado E, VentaFisica VF
                WHERE E.id = VF.empleadoId
                GROUP BY E.id
                HAVING COUNT(DISTINC(VF.sucursalId)) > 1   --Num de sucursales donde los empleados han vendido
                                                                                            
                UNION   

                SELECT E.id
                FROM Empleado E, Empleado Emp, Sucursal S
                WHERE E.id != Emp.empleadoSupervisorId      --Para evitar que sea el mismo que se supervisa jkskjs
                AND E.sucursalId = S.id
                AND Emp.sucursalId = S.id
                AND E.sucursalId = Emp.sucursalId

                UNION 

                SELECT E.id
                FROM Empleado E
                WHERE E.cargoId IN (SELECT TOP 5 C.id 
                                    FROM Cargo C
                                    ORDER BY C.salarioBasePorHora DESC)
                        
            )


