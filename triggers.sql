--a. Inventario (al tener datos nuevos en ProveedorProducto, crea el registro si el producto no existe 
--y en caso contrario sólo actualiza la cantidad)

CREATE TRIGGER Inventario_Triggger
ON ProveedorProducto
AFTER INSERT
AS
BEGIN 
    -- Insertar nuevos productos en la tabla Inventario si no existen
    INSERT INTO Inventario (productoId, cantidad)
    SELECT i.productoId, i.cantidad 
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Inventario inv 
        WHERE inv.productoId = i.productoId
    );--El procedimiento se encarga de sumar la cantidad en el inventario, asi que no es necesario 
END;

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

           
--Trigger extra para que cada vez que se compre un producto se le reste al inventario 
--Revisar que no de conflicto con el ultimo trigger 

CREATE TRIGGER ActualizarInventario
On FacturaDetalle
AFTER INSERT
AS 
BEGIN 
	UPDATE Inteventario
	SET cantidad = cantidad -inserted.cantidad
	FROM Inventario
	INNER JOIN inserted ON inventario.productoId=inserted.productoId;
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

CREATE FUNCTION validarP(@facturaId INT, @promoId INT) 
RETURNS BIT AS 
BEGIN
  DECLARE @promoValida BIT; 
  DECLARE @tipoFactura VARCHAR(10);

  IF EXISTS (SELECT 1 
             FROM OrdenOnline
             WHERE facturaId = @facturaId)
    SET @tipoFactura = 'O'
  ELSE IF EXISTS (SELECT 1 
             FROM VentaFisica
             WHERE facturaId = @facturaId)
    SET @tipoFactura = 'F'
  ELSE RETURN 0;      --Ya que no la factura no puede estar en los dos tipos de compra, no existe

  IF EXISTS (
    SELECT 1
    FROM Promo Pro, Factura F, FacturaDetalle FD, PromoEspecializada PE
   
    WHERE @facturaId IN (SELECT id FROM Factura)
    AND @promoId IN (SELECT id FROM Promo)
    --Esta activa la promocion?
    AND F.fechaEmision BETWEEN Pro.fechaInicio AND Pro.fechaFin
    --AND F.id IN (SELECT facturaId FROM OrdenOnline) OR F.id IN (SELECT facturaId FROM VentaFisica)
    AND Pro.tipoPromocion IN ('Ambas', @tipoFactura)

    --Verifico si posee promociones especializadas    ¿? Tienen que coincidir los id, y los productos en Promo espec. 
                                                      -- Pero no estoy segura de que esta parte estoy verificandola bien
    AND PE.promoId IN (SELECT id FROM Promo)
    AND FD.productoId IN (SELECT id FROM Producto)
    AND FD.id IN (SELECT id FROM Factura)
    AND FD.productoId IN (SELECT productoId FROM PromoEspecializada)
  ) 
    SET @promoValida = 1;
  --END IF
  ELSE SET @promoValida = 0;
  RETURN @promoValida;
END;

--Creo la funcion que valide al anadir un dato de factura promo, y luego llamo al trigger para que valide si se puede agregar
CREATE TRIGGER promoValida 
ON FacturaPromo
INSTEAD OF INSERT
AS
BEGIN
  --FOR EACH ROW   
    DECLARE @facturaId INT;
    DECLARE @promoId INT;

    SELECT @facturaId = facturaId, @promoId = promoId 
    FROM inserted;      --Tabla de la nueva insercion

  IF dbo.validarP(@facturaId, @promoId) = 1       
    BEGIN 
      INSERT FacturaPromo(facturaId, promoId) 
      SELECT facturaId, promoId FROM inserted;    --Selecciono los nuevos valores insertados
    END 
  ELSE 

  BEGIN
    RAISERROR ('La promoción no es válida', @facturaId, @promoId);
  END;
END;
--EXECUTE FUNCTION validarP();

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
