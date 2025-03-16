CREATE PROCEDURE SimularCompraOnline 
    @clienteId INT,
    @tipoEnvioId INT,
    @metodoPagoId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el carrito tiene productos
    IF NOT EXISTS (SELECT 1 FROM Carrito WHERE clienteId = @clienteId)
    BEGIN
        PRINT 'El carrito esta vacio.';
        RETURN;
    END;

    -- Declaracion de variables
    DECLARE @fechaAgregado DATETIME,
            @subTotal DECIMAL(10,2),
            @facturaId INT,
            @ordenId INT,
            @nroOrden INT,
            @montoDescuentoTotal DECIMAL(10,2) = 0,
            @promoId INT = NULL,
            @valorDescuento DECIMAL(10,2),
            @tipoDescuento VARCHAR(20),
            @montoIVA DECIMAL(10,2),
            @costoEnvio DECIMAL(10,2),
            @montoTotal DECIMAL(10,2);

    -- Obtener el subtotal del carrito y la fecha de agregado mas antigua
    SELECT @subTotal = SUM(dbo.SubTotal(c.cantidad, c.precioPor)), 
           @fechaAgregado = MIN(c.fechaAgregado)
    FROM Carrito c
    WHERE c.clienteId = @clienteId;

    -- Crear la factura inicialmente sin descuento
    INSERT INTO Factura (fechaEmision, clienteId, subTotal, montoDescuentoTotal, porcentajeIVA, montoIVA, montoTotal)
    VALUES (@fechaAgregado, @clienteId, @subTotal, 0, 3, 0, 0);

    SET @facturaId = SCOPE_IDENTITY();

    -- Generar un numero de orden aleatorio
    SET @nroOrden = ABS(CHECKSUM(NEWID())) % 1000000;

    -- Insertar la orden online
    INSERT INTO OrdenOnline (clienteId, nroOrden, fechaCreacion, tipoEnvioId, facturaId)
    VALUES (@clienteId, @nroOrden, @fechaAgregado, @tipoEnvioId, @facturaId);

    SET @ordenId = SCOPE_IDENTITY();

    -- Insertar los detalles de la orden
    INSERT INTO OrdenDetalle (ordenId, productoId, cantidad, precioPor)
    SELECT @ordenId, c.productoId, c.cantidad, c.precioPor
    FROM Carrito c
    WHERE c.clienteId = @clienteId;

    -- Calcular IVA
    SET @montoIVA = dbo.montoIVA(@facturaId);

    -- Calcular promocion vaida
    DECLARE @Promocion TABLE (promoId INT, valorDescuento DECIMAL(10,2), tipoDescuento VARCHAR(20));
    INSERT INTO @Promocion
    SELECT * FROM dbo.promoValidaOnline(@fechaAgregado);

    SELECT @promoId = promoId, 
           @valorDescuento = valorDescuento, 
           @tipoDescuento = tipoDescuento
    FROM @Promocion;

    IF @promoId IS NOT NULL
    BEGIN
        IF @tipoDescuento = 'Porcentaje'
            SET @montoDescuentoTotal = (@subTotal * @valorDescuento) / 100;
        ELSE
            SET @montoDescuentoTotal = @valorDescuento;

        IF @montoDescuentoTotal > @subTotal
            SET @montoDescuentoTotal = @subTotal;

        INSERT INTO FacturaPromo (facturaId, promoId)
        VALUES (@facturaId, @promoId);
    END;

    -- Obtener costo de envio
    SET @costoEnvio = dbo.costoEnvio(@ordenId);

    -- Calcular monto total
    SET @montoTotal = (@subTotal - @montoDescuentoTotal) + @montoIVA + @costoEnvio;

    -- Actualizar factura con valores finales
    UPDATE Factura
    SET montoDescuentoTotal = @montoDescuentoTotal,
        montoIVA = @montoIVA,
        montoTotal = @montoTotal
    WHERE id = @facturaId;

    -- Simular el pago
    INSERT INTO Pago (facturaId, nroTransaccion, metodoPagoId)
    VALUES (@facturaId, ABS(CHECKSUM(NEWID())), @metodoPagoId);

    -- Vaciar el carrito despues de la compra
    DELETE FROM Carrito WHERE clienteId = @clienteId;

    PRINT 'Compra completada exitosamente.';
END;
