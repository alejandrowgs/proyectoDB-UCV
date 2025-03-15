/*a. Funciones individuales para obtener cada uno de los valores numéricos de Factura: */

--costoEnvio (dada  una  orden,  obtener  el  costo  del  envío),  
--a.1
CREATE FUNCTION costoEnvio(@ordenId INT)      
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @costoEnvio DECIMAL(10,2);

    SELECT @costoEnvio = TE.costoEnvio
    FROM TipoEnvio TE
    INNER JOIN OrdenOnline OO ON TE.id = OO.tipoEnvioId 
    WHERE OO.id = @ordenId; -- Filtro especifico para la orden

    RETURN @costoEnvio;       
END;


--a.5

--SubTotal
CREATE FUNCTION SubTotal (
    @cantidad INT,
    @precio DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN @cantidad * @precio;
END;


--MontoTotal
CREATE FUNCTION montoTotal(@facturaId INT)      
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @montoTotal DECIMAL(10,2)
    SELECT @montoTotal = ((F.subTotal - F.montoDescuentoTotal) + F.montoIVA + TE.costoEnvio) 
    FROM Factura F
    INNER JOIN OrdenOnline OO ON OO.facturaId = F.id
    INNER JOIN TipoEnvio TE ON OO.tipoEnvioId = TE.id
    WHERE F.id = @facturaId; -- Se filtra por factura especifica
    
    RETURN @montoTotal;       
END;


--MontoIVA
CREATE FUNCTION montoIVA (
    @facturaId INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @montoIVA DECIMAL(10, 2) = 0;

    -- Calcular el total de IVA para productos no exentos en la factura
    SELECT @montoIVA = SUM(
        CASE 
            WHEN p.esExentoIVA = 0 THEN (fd.cantidad * fd.precioPor * 0.03) 
            ELSE 0 -- Exentos de IVA no se agrega
        END
    )
    FROM FacturaDetalle fd
    INNER JOIN Producto p ON fd.productoId = p.Id
    WHERE fd.facturaId = @facturaId;

    RETURN @montoIVA;
END;



--B. Calcular si una promocion es valida o no 

--Para venta Online
CREATE FUNCTION promoValidaOnline (
    @fechaAgregado DATE
)
RETURNS @Promocion TABLE (
    promoId INT,
    valorDescuento DECIMAL(10, 2),
    tipoDescuento VARCHAR(20)
)
AS
BEGIN
    INSERT INTO @Promocion (promoId, valorDescuento, tipoDescuento)
    SELECT TOP 1
        p.id AS promoId,
        p.valorDescuento,
        p.tipoDescuento
    FROM Promo p
    WHERE @fechaAgregado BETWEEN p.fechaInicio AND p.fechaFin
      AND p.tipoPromocion IN ('Online', 'Ambos')
    ORDER BY p.valorDescuento DESC;

    RETURN;
END;


--Para venta Fisica
CREATE FUNCTION promoValidaFisica (
    @fechaAgregado DATETIME
)
RETURNS @Promocion TABLE (
    promoId INT,
    valorDescuento DECIMAL(10, 2),
    tipoDescuento VARCHAR(20)
)
AS
BEGIN
    INSERT INTO @Promocion (promoId, valorDescuento, tipoDescuento)
    SELECT TOP 1
        p.id AS promoId,
        p.valorDescuento,
        p.tipoDescuento
    FROM Promo p
    WHERE @fechaAgregado BETWEEN p.fechaInicio AND p.fechaFin
      AND p.tipoPromocion IN ('Fisica', 'Ambos')
    ORDER BY p.valorDescuento DESC;

    RETURN;
END;
