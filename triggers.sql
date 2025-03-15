/*b. Al comprar un producto al proveedor, actualizar el precioPor del Producto tomando como base 
el precio por el que se le compró al proveedor y sumarle un 30%.  */

-- Se realizara esta actualizacion al ingresar una compra nueva 
CREATE TRIGGER precioProvProd
ON ProveedorProducto
AFTER INSERT  
AS
BEGIN

    DECLARE @proveedorId INT;
    DECLARE @prodProvId INT;
    DECLARE @fechaCompra DATE;
    DECLARE @precioCompraProv DECIMAL(10,2);
    DECLARE @precioNuevo DECIMAL(10,2);
    
    --Datos de la compra luego de insertado los datos
    SELECT @proveedorId = proveedorId, @prodProvId = productoId, @fechaCompra = fechaCompra, @precioCompraProv = precioPor        --Id de provProd
    FROM inserted;        --Filas que se insertaron
    
    SET @precioNuevo = @precioCompraProv + ((@precioCompraProv * 30) / 100);		--Error de punto y coma ¿?

    UPDATE Producto
    SET precioPor = @precioNuevo
    WHERE id = @prodProvId            --Id de la tabla prod comparo con el id del producto en la tabla ProvProd


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
