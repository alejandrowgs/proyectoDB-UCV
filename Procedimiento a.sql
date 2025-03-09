CREATE PROCEDURE SimularCompraOnline 
    @clienteId INT,
    @tipoEnvioId INT,
    @metodoPagoId INT,
    @promoId INT = NULL  -- Se mantiene en caso de promociones específicas
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Verificar si el carrito tiene productos
    IF NOT EXISTS (SELECT 1 FROM Carrito WHERE clienteId = @clienteId)
    BEGIN
        PRINT 'El carrito está vacío.';
        RETURN;
    END
    
    DECLARE @fechaAgregado DATETIME,
            @subTotal DECIMAL(10,2) = 0,
            @montoIVA DECIMAL(10,2) = 0,
            @montoTotal DECIMAL(10,2) = 0,
            @montoDescuentoTotal DECIMAL(10,2) = 0,
            @porcentajeIVA INT = 5,
            @facturaId INT,
            @ordenId INT,
            @nroOrden INT,
            @valorDescuento DECIMAL(10,2) = 0,
            @tipoDescuento VARCHAR(20);

    -- Obtener el subtotal del carrito y la fecha de agregado más antigua
    SELECT @subTotal = SUM(c.cantidad * c.precioPor),
           @fechaAgregado = MIN(c.fechaAgregado)
    FROM Carrito c
    WHERE c.clienteId = @clienteId;
    
    -- Crear la factura inicialmente sin descuento
    INSERT INTO Factura (fechaEmision, clienteId, subTotal, montoDescuentoTotal, porcentajeIVA, montoIVA, montoTotal)
    VALUES (@fechaAgregado, @clienteId, @subTotal, 0, @porcentajeIVA, 0, 0);
    
    SET @facturaId = SCOPE_IDENTITY();
    
    -- Buscar automáticamente una promoción válida según la fecha del carrito
    SELECT TOP 1 @promoId = p.id, 
                 @valorDescuento = p.valorDescuento, 
                 @tipoDescuento = p.tipoDescuento
    FROM Promo p
    WHERE @fechaAgregado BETWEEN p.fechaInicio AND p.fechaFin
          AND p.tipoPromocion IN ('Online', 'Ambos')
    ORDER BY p.valorDescuento DESC;  -- Se elige la promoción con mayor descuento
    
    -- Si se encontró una promoción, calcular el descuento
    IF @promoId IS NOT NULL BEGIN
        IF @tipoDescuento = 'Porcentaje' BEGIN
            SET @montoDescuentoTotal = (@subTotal * @valorDescuento) / 100;
        END ELSE BEGIN
            SET @montoDescuentoTotal = @valorDescuento;
        END

        -- Asegurar que el descuento no exceda el subtotal
        IF @montoDescuentoTotal > @subTotal BEGIN
            SET @montoDescuentoTotal = @subTotal;
        END

        -- Registrar la promoción aplicada
        INSERT INTO FacturaPromo (facturaId, promoId)
        VALUES (@facturaId, @promoId);
        
        PRINT 'Descuento aplicado: ' + CAST(@montoDescuentoTotal AS VARCHAR(20));
    END ELSE BEGIN
        PRINT 'No se encontró ninguna promoción aplicable.';
    END
    
    -- Calcular el IVA y el total con el descuento aplicado
    SET @montoIVA = ((@subTotal - @montoDescuentoTotal) * @porcentajeIVA) / 100;
    SET @montoTotal = (@subTotal - @montoDescuentoTotal) + @montoIVA;
    
    -- Actualizar la factura con los valores finales
    UPDATE Factura
    SET montoDescuentoTotal = @montoDescuentoTotal,
        montoIVA = @montoIVA,
        montoTotal = @montoTotal
    WHERE id = @facturaId;
    
    -- Generar un número de orden aleatorio
    SET @nroOrden = ABS(CHECKSUM(NEWID())) % 1000000;
    
    -- Insertar la orden online
    INSERT INTO OrdenOnline (clienteId, nroOrden, fechaCreacion, tipoEnvioId, facturaId)
    VALUES (@clienteId, @nroOrden, @fechaAgregado, @tipoEnvioId, @facturaId);
    
    SET @ordenId = SCOPE_IDENTITY();
    
    -- Insertar los detalles de la orden y la factura
    INSERT INTO OrdenDetalle (ordenId, productoId, cantidad, precioPor)
    SELECT @ordenId, c.productoId, c.cantidad, c.precioPor
    FROM Carrito c
    WHERE c.clienteId = @clienteId;
    
    INSERT INTO FacturaDetalle (facturaId, productoId, cantidad, precioPor)
    SELECT @facturaId, c.productoId, c.cantidad, c.precioPor
    FROM Carrito c
    WHERE c.clienteId = @clienteId;
    
    -- Simular el pago
    INSERT INTO Pago (facturaId, nroTransaccion, metodoPagoId)
    VALUES (@facturaId, ABS(CHECKSUM(NEWID())), @metodoPagoId);
    
    -- Vaciar el carrito después de la compra
    DELETE FROM Carrito WHERE clienteId = @clienteId;
    
    PRINT 'Compra completada exitosamente. Número de orden: ' + CAST(@nroOrden AS VARCHAR(10));
END;
