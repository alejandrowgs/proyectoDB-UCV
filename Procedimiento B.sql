CREATE PROCEDURE SimularCompraProveedor
    @proveedorId INT,
    @productoId INT,
    @precioPor DECIMAL(10,2),
    @cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el proveedor y el producto existen
    IF NOT EXISTS (SELECT 1 FROM Proveedor WHERE id = @proveedorId)
    BEGIN
        PRINT 'El proveedor especificado no existe.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Producto WHERE id = @productoId)
    BEGIN
        PRINT 'El producto especificado no existe.';
        RETURN;
    END

    -- Insertar la compra en la tabla ProveedorProducto
    INSERT INTO ProveedorProducto (proveedorId, productoId, fechaCompra, precioPor, cantidad)
    VALUES (@proveedorId, @productoId, GETDATE(), @precioPor, @cantidad);

    -- Verificar si el producto ya está en el inventario
    IF EXISTS (SELECT 1 FROM Inventario WHERE productoId = @productoId)
    BEGIN
        -- Si el producto ya está en el inventario, actualizar la cantidad
        UPDATE Inventario
        SET cantidad = cantidad + @cantidad
        WHERE productoId = @productoId;
    END
    ELSE
    BEGIN
        -- Si el producto no está en el inventario, insertarlo
        INSERT INTO Inventario (productoId, cantidad)
        VALUES (@productoId, @cantidad);
    END

    PRINT 'Compra a proveedor registrada exitosamente.';
END;
