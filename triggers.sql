--a. Inventario (al tener datos nuevos en ProveedorProducto, crea el registro si el producto no existe 
--y en caso contrario sólo actualiza la cantidad)

CREATE TRIGGER Inventario_Trigger
ON Producto
AFTER INSERT
AS
BEGIN 
    -- Insertar 5 unidades de nuevos productos en la tabla Inventario si no existen, de esa manera tenemos un Stock "Prueba"
    INSERT INTO Inventario (productoId, cantidad)
    SELECT i.Id, 5 -- Agrega 5 unidades por producto
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Inventario inv 
        WHERE inv.productoId = i.Id -- Verifica si el producto ya existe
    );
END;                --El procedimiento se encarga de sumar los productos al inventario cuando se haga compra a proveedores


/*Factura y FacturaDetalle (en caso de ser orden online, orden detalle se copia por
completo a factura detalle),
*/

CREATE TRIGGER FacturaDetalle_Trigger
ON Factura
AFTER INSERT
AS
BEGIN
    -- Llenar FacturaDetalle con los detalles de los productos del carrito relacionados con la factura, ya que este tiene de una vez el IDCliente
    INSERT INTO FacturaDetalle (facturaId, productoId, cantidad, precioPor)
    SELECT 
        i.id AS facturaId, 
        c.productoId, 
        c.cantidad, 
        c.precioPor
    FROM 
        inserted i
    INNER JOIN 
        Carrito c ON c.clienteId = i.clienteId;
END;


-- HistorialClienteProducto (al comprar y agregar al carrito un producto),
CREATE TRIGGER HistorialClienteProducto_Trigger
ON Carrito
AFTER INSERT
AS
BEGIN
    INSERT INTO HistorialClienteProducto (clienteId, productoId, fecha, tipoAccion)
    SELECT 
        i.clienteId, 
        i.productoId, 
        i.fechaAgregado, 
		    'Carrito' AS tipoAccion
    FROM 
        inserted i
END;

CREATE TRIGGER RegistrarCompra_Trigger
ON VentaFisica
AFTER INSERT
AS
BEGIN
    DECLARE @facturaId INT, @clienteId INT, @fecha DATE, @productoId INT;

    -- Obtener el facturaId de la fila insertada
    SELECT @facturaId = facturaId
    FROM inserted;

    -- Obtener el clienteId y la fecha de la factura
    SELECT @clienteId = clienteId, @fecha = fechaEmision
    FROM Factura
    WHERE id = @facturaId;

    -- Insertar registros en HistorialClienteProducto para cada producto comprado
    INSERT INTO HistorialClienteProducto (clienteId, productoId, fecha, tipoAccion)
    SELECT @clienteId, productoId, @fecha, 'Compra'
    FROM FacturaDetalle
    WHERE facturaId = @facturaId;
END;

--ProductoRecomendadoParaCliente (si el cliente compra o busca más de 3 veces un producto en especifico.

CREATE TRIGGER RecomendarProducto_Trigger
ON HistorialClienteProducto
AFTER INSERT
AS
BEGIN
    -- Asegurarse de manejar múltiples filas en `inserted`
    INSERT INTO ProductoRecomendadoParaCliente (clienteId, productoRecomendadoId, fechaRecomendacion, mensaje)
    SELECT 
        i.clienteId,
        prpp.productoRecomendadoId,
        MIN(h.fecha) AS fechaRecomendacion, -- Fecha de la tercera interacción
        prpp.mensaje
    FROM inserted i
    INNER JOIN HistorialClienteProducto h 
        ON i.clienteId = h.clienteId AND i.productoId = h.productoId
    INNER JOIN ProductoRecomendadoParaProducto prpp 
        ON h.productoId = prpp.productoId
    WHERE (
        SELECT COUNT(*)
        FROM HistorialClienteProducto 
        WHERE clienteId = i.clienteId AND productoId = i.productoId
    ) = 3 -- Exactamente 3 interacciones
    AND NOT EXISTS (
        SELECT 1 
        FROM ProductoRecomendadoParaCliente prc
        WHERE prc.clienteId = i.clienteId
          AND prc.productoRecomendadoId = prpp.productoRecomendadoId
    ) -- Evitar duplicados
    GROUP BY i.clienteId, prpp.productoRecomendadoId, prpp.mensaje;
END;

           
--Trigger extra para que cada vez que se compre un producto se le reste al inventario 
--Revisar que no de conflicto con el ultimo trigger 

CREATE TRIGGER ActualizarInventario
ON FacturaDetalle
AFTER INSERT
AS 
BEGIN 
    UPDATE inv
    SET inv.cantidad = inv.cantidad - i.cantidad
    FROM Inventario inv
    INNER JOIN inserted i ON inv.productoId = i.productoId;
END;

/*b. Al comprar un producto al proveedor, actualizar el precioPor del Producto tomando como base 
el precio por el que se le compró al proveedor y sumarle un 30%.  */

-- Se realizara esta actualizacion al ingresar una compra nueva 
CREATE TRIGGER precioProvProd
ON ProveedorProducto
AFTER INSERT  
AS
BEGIN
   UPDATE Producto
   SET precioPor = i.precioPor + (i.precioPor * 30) / 100
   FROM Producto p
   INNER JOIN inserted i ON p.Id = i.productoId;
END;

--c. Al insertar datos en FacturaPromo: llama al verificador de promo válida y aceptar el registro o no.  



--Creo la funcion que valide al anadir un dato de factura promo, y luego llamo al trigger para que valide si se puede agregar
--Ya tenemos un validador para las compras online, asi que solo faltan las fisicas 


--trigger d


CREATE TRIGGER trg_ValidarStockOrdenDetalle
ON OrdenDetalle -- FacturaDetalle
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Variables para control de errores
    DECLARE @StockCero BIT = 0,
            @StockInsuficiente BIT = 0;
    
    -- Aquí verifico si hay productos que no tienen stock disponible
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN Inventario inv 
            ON i.ProductoID = inv.ProductoID 
        WHERE COALESCE(inv.cantidad, 0) = 0  -- Parece que con esto convertimos el inventario nulo a 0 en caso de que no exista
    )
    BEGIN
        SET @StockCero = 1;
    END
    
    -- Aquí verifico si la cantidad solicitada es mayor que la disponible en inventario
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Inventario inv 
            ON i.ProductoID = inv.ProductoID 
        WHERE inv.cantidad < i.cantidad 
        AND inv.cantidad > 0  -- Excluimos los que ya están en 0
    )
    BEGIN
        SET @StockInsuficiente = 1;
    END
    
    -- Si no hay stock disponible, lanzo un error y detengo la inserción
    IF @StockCero = 1
    BEGIN
        RAISERROR('El producto no está disponible por los momentos', 16, 1);
        RETURN;
    END
    -- Si hay stock insuficiente, lanzo un error y detengo la inserción
    ELSE IF @StockInsuficiente = 1
    BEGIN
        RAISERROR('No hay unidades suficientes del producto para esta compra', 16, 1);
        RETURN;
    END
    
    -- Si todas las validaciones pasan, procedo con la inserción original en la tabla OrdenDetalle
    INSERT INTO OrdenDetalle (ordenId, productoId, cantidad, precioPor)
    SELECT ordenId, productoId, cantidad, precioPor
    FROM inserted;
END;
GO

-- trigger E



CREATE TRIGGER trg_devolucion
ON FacturaDetalle
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Registramos la devolucion
        INSERT INTO FacturaDetalle (facturaId,productoId,cantidad,precioPor)
		SELECT d.facturaId,d.productoId,d.cantidad,d.precioPor  
        FROM deleted d
        INNER JOIN inventario i 
            ON d.productoId = i.productoId;
        
        -- Actualizamos el inventario
        UPDATE i
        SET cantidad = i.cantidad + d.Cantidad
        FROM Inventario i
        INNER JOIN deleted d 
            ON i.ProductoId = d.ProductoId
		WHERE i.productoId = d.productoId
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;  -- Propaga el error al cliente
    END CATCH
END;

