*Querys*      D - E - G poseen subquerys

A - B - E -G -H - I - J   

*HECHAS*

C - D - F

*Functions*
*HECHAS*

a1. costoEnvio (dada  una  orden,  obtener  el  costo  del  envío)  
a2. montoTotal ( (subTotal - montoDescuentoTotal) + montoIVA + costoEnvio).  
a.2 subTotal  (antes  de  promos  e  impuestos)
a.3 montoDescuentoTotal (todo lo que se descontará en caso de que haya promos)
a.4 montoIVA (total de impuestos  a  pagar  por  productos  no  exentos,  luego  de  aplicar  promo,  no  se  incluyen  envíos)   
b. Verifica si una promo es válida o no dada una factura (la fechaFin no ha pasado y el 
tipoPromoción coincide con el tipo de compra online o física).  

*Procedures*

-c. Crear factura física dado un cliente y un empleado (esto creará también la relación VentaFisica)  

-e. Reporte de efectividad de promos: Dada una promo imprimir la media de cantidad de ventas y monto de 
ingreso desde 3 meses antes del inicio de la promo y también imprimir los mismos datos durante el 
período de duración de la promo, junto con el porcentaje de incremento o decremento al 
compararlos.  

*HECHOS*
A - B -D

*Triggers*
D - E

*HECHOS*
A - B -C

