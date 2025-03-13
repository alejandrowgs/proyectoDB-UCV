
/*b. Al comprar un producto al proveedor, actualizar el precioPor del Producto tomando como base 
el precio por el que se le compró al proveedor y sumarle un 30%.  */

-- Se realizara esta actualizacion al ingresar una compra nueva 
CREATE TRIGGER precioProvProd
ON ProveedorProducto
AFTER INSERT  
AS
BEGIN

    DECLARE @proveedorId INT, 
    DECLARE @prodProvId INT, 
    DECLARE @fechaCompra DATE
    DECLARE @precioCompraProv DECIMAL(10,2),
    DECLARE @precioNuevo DECIMAL(10,2),
    --DECLARE @id INT
    
    --Datos de la compra luego de insertado los datos
    SELECT @proveedorId = proveedorId, @prodProvId = productoId, @fechaCompra = fechaCompra, @precioCompraProv = precioPor        --Id de provProd
    FROM inserted;        --Filas que se insertaron
    
    SET @precioNuevo = @precioCompraProv + ((@precioCompraProv * 30) / 100)

    UPDATE Producto
    SET precioPor = @precioNuevo
    WHERE id = @prodProvId            --Id de la tabla prod comparo con el id del producto en la tabla ProvProd


/*c. Al insertar datos en FacturaPromo: llama al verificador de promo válida y aceptar el registro o 
no.  */