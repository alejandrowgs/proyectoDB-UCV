*Querys*

A - B - C - D - E - F -G -H - I - J 


*Functions Por hacer*

a. Funciones individuales para obtener cada uno de los valores numéricos de Factura: 
-subTotal  (antes  de  promos  e  impuestos)
-montoDescuentoTotal (todo lo que se descontará en caso de que haya promos)
-montoIVA (total de impuestos  a  pagar  por  productos  no  exentos,  luego  de  aplicar  promo,  no  se  incluyen  envíos)   

b. Verifica si una promo es válida o no dada una factura (la fechaFin no ha pasado y el 
tipoPromoción coincide con el tipo de compra online o física).  

*HECHAS*

a1. costoEnvio (dada  una  orden,  obtener  el  costo  del  envío)  
a2. montoTotal ( (subTotal - montoDescuentoTotal) + montoIVA + costoEnvio).  


*Procedures Por hacer*

-a. Simular toda una compra online de lo que esté en el carrito dado un cliente
-b. Simular compra a proveedor dados un proveedor, producto, precio y cantidad
-c. Crear factura física dado un cliente y un empleado (esto creará también la relación VentaFisica)  
-d. Agregar producto a factura física dada una factura, producto, cantidad y precio 
-e. Reporte de efectividad de promos: Dada una promo imprimir la media de cantidad de ventas y monto de 
ingreso desde 3 meses antes del inicio de la promo y también imprimir los mismos datos durante el 
período de duración de la promo, junto con el porcentaje de incremento o decremento al 
compararlos.  


*Triggers Por hacer*
