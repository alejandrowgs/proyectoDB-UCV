--c. Crear factura física dado un cliente y un empleado (esto creará también la relación VentaFisica)  

CREATE PROCEDURE RegistrarVentaFisica
    @ClienteId INT,
    @EmpleadoId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @FacturaId INT;
    DECLARE @SucursalId INT;
    
    -- Obtener la ultima factura del cliente
    SELECT TOP 1 @FacturaId = id
    FROM Factura
    WHERE clienteId = @ClienteId
    ORDER BY fechaEmision DESC;
    
    -- Verificar si se encontro una factura
    IF @FacturaId IS NULL
    BEGIN
        PRINT 'No se encontro una factura para el cliente especificado';
        RETURN;
    END
    
    -- Obtener la sucursal del empleado
    SELECT @SucursalId = sucursalId
    FROM Empleado
    WHERE id = @EmpleadoId;
    
    IF @SucursalId IS NULL
    BEGIN
        PRINT 'No se encontro una sucursal para el empleado especificado';
        RETURN;
    END
    
    -- Insertar en VentaFisica
    INSERT INTO VentaFisica (facturaId, sucursalId, empleadoId)
    VALUES (@FacturaId, @SucursalId, @EmpleadoId);
    
    PRINT 'Venta fisica registrada con exito';
END;


--d. Agregar producto a factura física dada una factura, producto, cantidad y precio

CREATE PROC agregaProductoAFactura(@facturaId INT, @productoId INT, @cantidad INT, @precioPor DECIMAL(10,2))
AS
BEGIN

     IF NOT EXISTS (SELECT 1 FROM VentaFisica WHERE facturaId = @facturaId)      --Quiere decir que si fue de VF
    BEGIN
        RAISERROR ('No existe la factura indicada', @facturaId);
    END;
    --Valido si existe o no por separado, por errores de anidamiento al validar eso

    IF NOT EXISTS (SELECT 1 FROM Producto WHERE id = @productoId)   
    BEGIN
        RAISERROR ('El producto no existe', @productoId);
        RETURN;
    END;

    --No valido si existe, porque con que no entre al no existe quiere decir que si hay factura existente
        --So agrego producto para crear la factura fisica
        -- A cada parametro de la tabla Factura detalle, le asignare los pasados por parametro
    INSERT INTO FacturaDetalle(facturaId, productoId, cantidad, precioPor) 
    VALUES (@facturaId, @productoId, @cantidad, @precioPor)
    
END;

--EXEC
