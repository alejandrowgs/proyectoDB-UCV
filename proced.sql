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
    IF EXISTS (SELECT 1 FROM VentaFisica WHERE facturaId = @facturaId)
    BEGIN
        -- A cada parametro de la tabla Factura detalle, le asignare los pasados por parametro
        INSERT INTO FacturaDetalle(facturaId, productoId, cantidad, precioPor) 
        VALUES (@facturaId, @productoId, @cantidad, @precioPor)
    END
    ELSE RETURN;        --Aunque no es la mejor practica para atacar el error de sino llega a ser factura fisica.
                        --No quise mostrar mensaje de error porque no lo piden
END;

--EXEC Para no añadir los valores de los parametros manual, como podria hacer? 
