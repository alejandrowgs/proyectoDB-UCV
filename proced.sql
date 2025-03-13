--c. Crear factura física dado un cliente y un empleado (esto creará también la relación VentaFisica)  






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