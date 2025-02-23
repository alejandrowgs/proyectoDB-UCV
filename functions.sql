/*a. Funciones individuales para obtener cada uno de los valores numéricos de Factura: */

--costoEnvio (dada  una  orden,  obtener  el  costo  del  envío),  
--a.1
CREATE FUNCTION costoEnvio(@ordenId INT)      --Dada un orden
RETURNS DECIMAL(10,2)
AS
BEGIN
    
    SELECT TE.costoEnvio
    FROM TipoEnvio TE LEFT JOIN OrdenOnline OO ON TE.id = OO.tipoEnvioId 
    INNER JOIN OrdenDetalle OD ON OD.ordenId = OO.id

    RETURN costoEnvio;       --Suponiendo que no habra costos de envios NULL
END;


--montoTotal ((subTotal - montoDescuentoTotal) + montoIVA + costoEnvio). 
--a.4 

CREATE FUNCTION montoTotal()      
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @montoTotal DECIMAL(10,2)
    SELECT montoTotal = ((F.subTotal - F.montoDescuentoTotal) + F.montoIVA + TE.costoEnvio ) 
    FROM Factura F, OrdenOnline OO, TipoEnvio TE
    WHERE OO.facturaId = F.id
    AND OO.tipoEnvioId = TE.id
   
    RETURN montoTotal;       
END;
