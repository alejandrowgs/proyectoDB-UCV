--c. Crear factura física dado un cliente y un empleado (esto creará también la relación VentaFisica)  

CREATE PROC facturaFisica(@clienteId INT, @empleadoId INT)
AS
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM Cliente C WHERE @clienteId = C.id)
    BEGIN
        RAISERROR ('El cliente no fue encontrado', @clienteId);
    END;

    IF NOT EXISTS (SELECT 1 FROM Empleado E WHERE @empleadoId = E.id)
    BEGIN
        RAISERROR ('El empleado no fue encontrado', @empleadoId);
    END;

    DECLARE @sucursalId;
    SELECT @sucursalId = E.sucursalId FROM Empleado E WHERE E.id = @empleadoId;

    --Insertar los valores para la tabla factura
    DECLARE @fechaEmision
    DECLARE @subTotal
    DECLARE @montoDescuentoTotal
    DECLARE @porcentajeIVA
    DECLARE @montoIVA
    DECLARE @montoTotal

    INSERT INTO Factura(fechaEmision, clienteId, subTotal, montoDescuentoTotal, porcentajeIVA, montoIVA, montoTotal)
    VALUES(GETDATE(), @clienteId, 0, 0, 0, 0, 0);

    --Extraigo el id de la factura que se crea para usarlo en VF
    DECLARE @facturaId INT;
    SET @facturaId = SCOPE_IDENTITY();        --Obtengo asi el valor id insertado de ultimo

    --Relacion VF
    INSERT INTO VentaFisica(facturaId, sucursalId, empleadoId)
    VALUES(@facturaId, @sucursalId, @empleadoId);

    --Dado que ya creé la factura y la relacion. Puedo mostrar el id de esa Factura Fisica creada
    SELECT @facturaId as idFacturaFisica;
END;

--EXEC facturaFisica       *Agregar el dato de empleado cliente*

--Para agregar valor al insert de 'factura' que tiene puros 0´s         Es necesario colocarlo valores reales? (Los calculos)
--(Hariamos uso de los calculos que hicimos en la funcion A, para cada dato de factura)
/*CREATE PROC datosDeFactura()
AS
BEGIN
*/


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
