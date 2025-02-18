/*Drop TABLE IF EXISTS Cliente;
Drop TABLE IF EXISTS Categoria;
Drop TABLE IF EXISTS Marca;
Drop TABLE IF EXISTS Producto;
Drop TABLE IF EXISTS ProductoRecomendadoParaProducto;
Drop TABLE IF EXISTS ProductoRecomendadoParaCliente;
Drop TaBLE IF EXISTS Ciudad;
Drop TaBLE IF EXISTS ClienteDireccion
Drop TaBLE IF EXISTS HistorialClienteProducto
Drop TaBLE IF EXISTS Carrito
*/

CREATE TABLE Cliente 
  ( id INTEGER NOT NULL IDENTITY(1,1) 
  , CI INTEGER
  , nombre TEXT
  , apellido TEXT
  , correo TEXT
  , sexo CHAR CHECK (sexo IN ('M','F'))
  , fechaNacimiento DATE
  , fechaRegistro DATE
  , PRIMARY KEY (id)
  );
 
CREATE TABLE Categoria
  ( id INTEGER
  , nombre TEXT
  , descripcion TEXT
  , PRIMARY KEY (id)
  );
  
CREATE TABLE Marca
  ( id INTEGER
  , nombre TEXT
  , descripcion TEXT
  , PRIMARY KEY (id)
  );
  
CREATE TABLE Producto 
  ( id INTEGER
  , nombre TEXT
  , codigoBarra INTEGER
  , descripcion TEXT
  , tipoPrecio CHAR CHECK (tipoPrecio IN ('PorUnidad', 'PorPesoKg'))                        
  /*, precioPor                            --**/
  , esExentoIVA BIT                  
  , categoriaId INTEGER
  , marcaId INTEGER
  , PRIMARY KEY (id)
  , FOREIGN KEY(categoriaId) REFERENCES Categoria(id)
  , FOREIGN KEY(marcaId) REFERENCES Marca(id)        
  );
  
CREATE TABLE ProductoRecomendadoParaProducto 
  ( productoId INTEGER
  , productoRecomendadoId INTEGER
  , mensaje TEXT
  , PRIMARY KEY (productoId, productoRecomendadoId)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  , FOREIGN KEY(productoRecomendadoId) REFERENCES Producto(id)        
  );
  
CREATE TABLE ProductoRecomendadoParaCliente
  ( clienteId INTEGER
  , productoRecomendadoId INTEGER
  , fechaRecomendacion DATE
  , mensaje TEXT
  , PRIMARY KEY (clienteId, productoRecomendadoId, fechaRecomendacion)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoRecomendadoId) REFERENCES Producto(id)        
  );
  
CREATE TABLE Ciudad
	( id INTEGER
	, nombre TEXT
	, PRIMARY KEY (id)
	); 
	
/*Relaciones*/

CREATE TABLE ClienteDireccion 
  ( id INTEGER
  , clienteId INTEGER
  , tipoDireccion CHAR CHECK (tipoDireccion IN ( 'Facturacion', 'Envio'))
  , dirLinea1 TEXT
  , ciudadId INTEGER
  , PRIMARY KEY (id)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(ciudadId) REFERENCES ciudad(id)         
  );
  
CREATE TABLE HistorialClienteProducto
  ( clienteId INTEGER
  , productoId INTEGER
  , fecha DATE
  , tipoAccion CHAR CHECK (tipoAccion IN ('Busqueda', 'Carrito', 'Compra'))
  , PRIMARY KEY (clienteId, productoId, fecha)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  );
  
CREATE TABLE Carrito
  ( clienteId INTEGER
  , productoId INTEGER
  , fechaAgregado DATE
  , cantidad INTEGER
  , precioPor FLOAT
  , PRIMARY KEY (clienteId, productoId)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  );
 