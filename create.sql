DROP TABLE IF EXISTS FacturaPromo;
DROP TABLE IF EXISTS FacturaDetalle;
DROP TABLE IF EXISTS VentaFisica;
DROP TABLE IF EXISTS OrdenDetalle;
DROP TABLE IF EXISTS OrdenOnline;
DROP TABLE IF EXISTS Pago;
DROP TABLE IF EXISTS ProveedorProducto;
DROP TABLE IF EXISTS Inventario;
DROP TABLE IF EXISTS HistorialClienteProducto;
DROP TABLE IF EXISTS Carrito;
DROP TABLE IF EXISTS ClienteDireccion;
DROP TABLE IF EXISTS PromoEspecializada;
DROP TABLE IF EXISTS ProductoRecomendadoParaCliente;
DROP TABLE IF EXISTS ProductoRecomendadoParaProducto;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Marca;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Cargo;
DROP TABLE IF EXISTS Sucursal;
DROP TABLE IF EXISTS Ciudad;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS Pais;
DROP TABLE IF EXISTS FormaPago;
DROP TABLE IF EXISTS Factura;
DROP TABLE IF EXISTS Promo;
DROP TABLE IF EXISTS TipoEnvio;
DROP TABLE IF EXISTS Cliente;

CREATE TABLE Pais 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(100) NOT NULL
  );

CREATE TABLE Cliente 
  ( id INT NOT NULL IDENTITY(1,1) 
  , CI INT
  , nombre VARCHAR (100) NOT NULL
  , apellido VARCHAR (100) NOT NULL 
  , correo VARCHAR (100) NOT NULL
  , sexo VARCHAR(1) CHECK (sexo IN ('M','F'))
  , fechaNacimiento DATE
  , fechaRegistro DATE
  , PRIMARY KEY (id)
  );

CREATE TABLE Categoria
  ( id INT NOT NULL IDENTITY(1,1)
  , nombre VARCHAR (100) NOT NULL
  , descripcion VARCHAR (100) NOT NULL
  , PRIMARY KEY (id)
  );

CREATE TABLE Marca
  ( id INT NOT NULL IDENTITY(1,1)
  , nombre VARCHAR (100) NOT NULL
  , descripcion VARCHAR (100) NOT NULL
  , PRIMARY KEY (id)
  );

CREATE TABLE Producto 
  ( id INT NOT NULL IDENTITY(1,1)
  , nombre VARCHAR (100) NOT NULL
  , codigoBarra BIGINT UNIQUE                                                                 --Cambiado a BIGINT y UNIQUE agregado
  , descripcion VARCHAR (100) NOT NULL
  , tipoPrecio VARCHAR(20) CHECK (tipoPrecio IN ('PorUnidad', 'PorPesoKg'))                        
  , precioPor DECIMAL(10, 2)                           
  , esExentoIVA BIT                  
  , categoriaId INT
  , marcaId INT
  , PRIMARY KEY (id)
  , FOREIGN KEY(categoriaId) REFERENCES Categoria(id)
  , FOREIGN KEY(marcaId) REFERENCES Marca(id)        
  );

CREATE TABLE ProductoRecomendadoParaProducto 
  ( productoId INT
  , productoRecomendadoId INT
  , mensaje VARCHAR (100) NOT NULL
  , PRIMARY KEY (productoId, productoRecomendadoId)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  , FOREIGN KEY(productoRecomendadoId) REFERENCES Producto(id)        
  );

CREATE TABLE ProductoRecomendadoParaCliente
  ( clienteId INT
  , productoRecomendadoId INT
  , fechaRecomendacion DATE
  , mensaje VARCHAR (100) NOT NULL
  , PRIMARY KEY (clienteId, productoRecomendadoId, fechaRecomendacion)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoRecomendadoId) REFERENCES Producto(id)        
  );

CREATE TABLE Estado 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(100) NOT NULL
  , paisId INT FOREIGN KEY REFERENCES Pais(id)
  );

CREATE TABLE Ciudad
  ( id INT NOT NULL IDENTITY
  , nombre VARCHAR (100) NOT NULL
  , PRIMARY KEY (id)
  , estadoId INT FOREIGN KEY REFERENCES Estado(id)
  ); 

CREATE TABLE Promo
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(50)
  , slogan VARCHAR(200)
  , codigo INT
  , tipoDescuento VARCHAR(20) CHECK (tipoDescuento IN ('Porcentaje', 'Fijo'))
  , valorDescuento DECIMAL (10,2)
  , fechaInicio DATE
  , fechaFin DATE
  , tipoPromocion VARCHAR(20) CHECK (tipoPromocion IN ('Online', 'Fisica', 'Ambos'))
  );

CREATE TABLE PromoEspecializada 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , promoId INT FOREIGN KEY REFERENCES Promo(id)
  , productoId INT FOREIGN KEY REFERENCES Producto(id)
  , categoriaId INT FOREIGN KEY REFERENCES Categoria(id)
  , marcaId INT FOREIGN KEY REFERENCES Marca(id)
  );

CREATE TABLE Sucursal 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(100) NOT NULL
  , direccion VARCHAR(255) NOT NULL
  , telefono VARCHAR(20)
  , horaAbrir INT
  , horaCerrar INT
  , ciudadId INT FOREIGN KEY REFERENCES Ciudad(id)
  );

CREATE TABLE Cargo 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(100) NOT NULL
  , descripcion VARCHAR(255)
  , salarioBasePorHora DECIMAL(10, 2) NOT NULL
  );

CREATE TABLE Empleado 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , CI VARCHAR(20) NOT NULL
  , nombre VARCHAR(100) NOT NULL
  , apellido VARCHAR(100) NOT NULL
  , sexo VARCHAR(1) CHECK (sexo IN ('M', 'F'))
  , direccionCorta VARCHAR(255)
  , cargoId INT FOREIGN KEY REFERENCES Cargo(id)
  , empleadoSupervisorId INT FOREIGN KEY REFERENCES Empleado(id)
  , sucursalId INT FOREIGN KEY REFERENCES Sucursal(id)
  , fechaContrato DATE NOT NULL
  , bonoFijoMensual DECIMAL(10, 2)
  , horaInicio INT
  , horaFin INT
  , cantidadDiasTrabajoPorSemana INT
  );

CREATE TABLE Proveedor 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , RIF VARCHAR(20) NOT NULL
  , nombre VARCHAR(100) NOT NULL
  , contacto VARCHAR(100)
  , telefono VARCHAR(20)
  , correo VARCHAR(100)
  , ciudadId INT FOREIGN KEY REFERENCES Ciudad(id)
  );

CREATE TABLE Inventario 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , productoId INT FOREIGN KEY REFERENCES Producto(id)
  , cantidad INT NOT NULL
  );

CREATE TABLE ClienteDireccion 
  ( id INT
  , clienteId INT
  , tipoDireccion VARCHAR(20) CHECK (tipoDireccion IN ( 'Facturacion', 'Envio'))
  , dirLinea1 VARCHAR(100) NOT NULL
  , ciudadId INT
  , PRIMARY KEY (id)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(ciudadId) REFERENCES Ciudad(id)         
  );

CREATE TABLE HistorialClienteProducto
  ( clienteId INT
  , productoId INT
  , fecha DATE
  , tipoAccion VARCHAR(20) CHECK (tipoAccion IN ('Busqueda', 'Carrito', 'Compra'))
  , PRIMARY KEY (clienteId, productoId, fecha)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  );

CREATE TABLE Carrito
  ( clienteId INT
  , productoId INT
  , fechaAgregado DATE
  , cantidad INT
  , precioPor DECIMAL(10,2)
  , PRIMARY KEY (clienteId, productoId)
  , FOREIGN KEY(clienteId) REFERENCES Cliente(id)
  , FOREIGN KEY(productoId) REFERENCES Producto(id)
  );

CREATE TABLE Factura
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , fechaEmision DATE
  , clienteId INT FOREIGN KEY REFERENCES Cliente(id)
  , subTotal DECIMAL (10,2)
  , montoDescuentoTotal DECIMAL (10,2)
  , porcentajeIVA INT                 /* Se tratan los porcentajes como enteros >> 30 representa 30% */
  , montoIVA DECIMAL (10,2)                        
  , montoTotal DECIMAL (10,2)
  );

CREATE TABLE FacturaPromo 
  ( facturaId INT FOREIGN KEY REFERENCES Factura(id)
  , promoId INT FOREIGN KEY REFERENCES Promo(id)
  , PRIMARY KEY (facturaId, promoId)
  );

CREATE TABLE ProveedorProducto 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , proveedorId INT FOREIGN KEY REFERENCES Proveedor(id)
  , productoId INT FOREIGN KEY REFERENCES Producto(id)
  , fechaCompra DATE NOT NULL
  , precioPor DECIMAL(10, 2) NOT NULL
  , cantidad INT NOT NULL
  );

CREATE TABLE TipoEnvio
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombreEnvio VARCHAR(100) NOT NULL
  , tiempoEstimadoEntrega INT
  , costoEnvio DECIMAL (10,2)
  );

CREATE TABLE OrdenOnline
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , clienteId  INT FOREIGN KEY REFERENCES Cliente(id)
  , nroOrden INT NOT NULL
  , fechaCreacion DATE
  , tipoEnvioId INT FOREIGN KEY REFERENCES TipoEnvio(id)
  , facturaId INT FOREIGN KEY REFERENCES Factura(id)
  );

CREATE TABLE OrdenDetalle 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , ordenId INT FOREIGN KEY REFERENCES OrdenOnline(id)
  , productoId INT FOREIGN KEY REFERENCES Producto (id)
  , cantidad INT
  , precioPor DECIMAL(10, 2) NOT NULL
  );

CREATE TABLE VentaFisica
  ( facturaId INT FOREIGN KEY REFERENCES Factura(id)
  , sucursalId INT FOREIGN KEY REFERENCES Sucursal(id)
  , empleadoId INT FOREIGN KEY REFERENCES Empleado(id)
  , PRIMARY KEY (facturaId, sucursalId, empleadoId)
  );

CREATE TABLE FacturaDetalle 
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , facturaId INT FOREIGN KEY REFERENCES Factura (id)
  , productoId INT FOREIGN KEY REFERENCES Producto (id)
  , cantidad INT
  , precioPor DECIMAL(10, 2) NOT NULL	
  );

CREATE TABLE FormaPago
  ( id INT PRIMARY KEY NOT NULL IDENTITY
  , nombre VARCHAR(100)
  , descripcion VARCHAR(100)
  );

CREATE TABLE Pago
  ( facturaId INT PRIMARY KEY
  , nroTransaccion INT
  , metodoPagoId INT
  , FOREIGN KEY (facturaId) REFERENCES Factura(id)
  , FOREIGN KEY (metodoPagoId) REFERENCES FormaPago(id)
  );
