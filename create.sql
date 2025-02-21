

/*Drop TABLE IF EXISTS ProductoRecomendadoParaProducto;
Drop TABLE IF EXISTS ProductoRecomendadoParaCliente;
Drop TaBLE IF EXISTS Ciudad;
Drop TaBLE IF EXISTS Estado;
Drop TaBLE IF EXISTS ClienteDireccion
Drop TaBLE IF EXISTS HistorialClienteProducto
Drop TaBLE IF EXISTS Carrito
Drop TaBLE IF EXISTS PromoEspecializada;
Drop TaBLE IF EXISTS FacturaPromo;
Drop TaBLE IF EXISTS Sucursal;
Drop TaBLE IF EXISTS Empleado;
Drop TaBLE IF EXISTS Cargo;
Drop TaBLE IF EXISTS Pais;
Drop TaBLE IF EXISTS Proveedor;
Drop TaBLE IF EXISTS Inventario;
Drop TaBLE IF EXISTS ProveedorProducto;
Drop TABLE IF EXISTS Cliente;
Drop TABLE IF EXISTS Categoria;
Drop TABLE IF EXISTS Marca;
Drop TABLE IF EXISTS Producto;
--Drop TaBLE IF EXISTS */

CREATE TABLE Pais 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    nombre VARCHAR(100) NOT NULL
  );

CREATE TABLE Cliente 
  ( id INTEGER NOT NULL IDENTITY(1,1) 
  , CI INTEGER
  , nombre TEXT
  , apellido TEXT
  , correo TEXT
  , sexo VARCHAR CHECK (sexo IN ('M','F'))
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
  , precioPor DECIMAL(10, 2)                           
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
  
CREATE TABLE Estado 
  (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    paisId INT FOREIGN KEY REFERENCES Pais(id)
  );

CREATE TABLE Ciudad
	( id INTEGER
	, nombre TEXT
	, PRIMARY KEY (id)
	, estadoId INT FOREIGN KEY REFERENCES Estado(id)
	); 

		  CREATE TABLE Promo(
	id INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(50),
	slogan VARCHAR(200),
	codigo INT,
	tipoDescuento CHAR CHECK (tipoDescuento IN ('Porcentaje', 'Fijo')),
	valorDescuento DECIMAL (10,2),
	fechaInicio DATE,
	fechaFin DATE,
	tipoPromocion CHAR CHECK (tipoPromocion IN ('Online', 'Fisica', 'Ambos'))
	);

CREATE TABLE PromoEspecializada 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    promoId INT FOREIGN KEY REFERENCES Promo(id),
    productoId INT FOREIGN KEY REFERENCES Producto(id),
    categoriaId INT FOREIGN KEY REFERENCES Categoria(id),
    marcaId INT FOREIGN KEY REFERENCES marca(id)
  );

CREATE TABLE Sucursal 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15),
    horaAbrir TIME,
    horaCerrar TIME,
    ciudadId INT FOREIGN KEY REFERENCES Ciudad(id)
  );
  
CREATE TABLE Cargo 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    salarioBasePorHora DECIMAL(10, 2) NOT NULL
  );

CREATE TABLE Empleado 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    CI VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    direccionCorta VARCHAR(255),
    cargoId INT FOREIGN KEY REFERENCES Cargo(id),
    empleadoSupervisorId INT FOREIGN KEY REFERENCES Empleado(id),
    sucursalId INT FOREIGN KEY REFERENCES Sucursal(id),
    fechaContrato DATE NOT NULL,
    bonoFijoMensual DECIMAL(10, 2),
    horaInicio TIME,
    horaFin TIME,
    cantidadDiasTrabajoPorSemana INT
  );



CREATE TABLE Proveedor 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    RIF VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    ciudadId INT FOREIGN KEY REFERENCES Ciudad(id)
  );

CREATE TABLE Inventario 
  (
    id INT PRIMARY KEY IDENTITY,
    productoId INT FOREIGN KEY REFERENCES Producto(id),
    cantidad INT NOT NULL
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

  CREATE TABLE Factura(
id INT PRIMARY KEY IDENTITY,
fechaEmicion DATE,
subTotal DECIMAL (10,2),
montoDescuentoTotal DECIMAL (10,2),
porcentajeIVA DECIMAL (10,2),                 /* Se han tratado los porcentajes como decimales */
montoIVA DECIMAL (10,2),                          
montoTotal DECIMAL (10,2),
clienteId  INT FOREIGN KEY REFERENCES Cliente(id)
);

CREATE TABLE FacturaPromo 
  (
    facturaId INT FOREIGN KEY REFERENCES Factura(id),
    promoId INT FOREIGN KEY REFERENCES Promo(id),
    PRIMARY KEY (facturaId, promoId)
  );

CREATE TABLE ProveedorProducto 
  (
    id INT PRIMARY KEY NOT NULL IDENTITY,
    proveedorId INT FOREIGN KEY REFERENCES Proveedor(id),
    productoId INT FOREIGN KEY REFERENCES Producto(id),
    fechaCompra DATE NOT NULL,
    precioPor DECIMAL(10, 2) NOT NULL,
    cantidad INT NOT NULL
  );


 CREATE TABLE TipoEnvio(
id INT PRIMARY KEY IDENTITY,
nombre VARCHAR(100) NOT NULL,
TiempoEstimadoEntrega TIME,
CostoEnvio DECIMAL (10,2)
);



CREATE TABLE OrdenOnline(
id INT PRIMARY KEY IDENTITY,
nroOrden INT NOT NULL,
FechaCreacion DATE,
clienteId  INT FOREIGN KEY REFERENCES Cliente(id),
tipoEnvioId INT FOREIGN KEY REFERENCES TipoEnvio(id),
facturaId INT FOREIGN KEY REFERENCES Factura(id)
);

CREATE TABLE OrdenDetalle (
id INT PRIMARY KEY IDENTITY,
cantidad INT,
/* precioPor       ---*/
ordenId INT FOREIGN KEY REFERENCES OrdenOnline(id),
productoId INT FOREIGN KEY REFERENCES Producto (id)
);

CREATE TABLE VentaFisica(
facturaId INT FOREIGN KEY REFERENCES Factura (id),
sucursalId INT FOREIGN KEY REFERENCES Sucursal (id),
empleadoId INT FOREIGN KEY REFERENCES Empleado (id)
PRIMARY KEY (facturaId, sucursalId, empleadoId)
);

CREATE TABLE FacturaDetalle (
id INT PRIMARY KEY IDENTITY,
cantidad INT,
/* PrecioPor        -----*/
facturaId INT FOREIGN KEY REFERENCES Factura (id),
productoId INT FOREIGN KEY REFERENCES Producto (id)
);

CREATE TABLE FormaPago(
id INT PRIMARY KEY IDENTITY,
nombre VARCHAR(50),
descripcion VARCHAR(500)
);

CREATE TABLE Pago(
facturaId INT FOREIGN KEY REFERENCES Factura (id),
nroTransaccion INT,
metodoPagoId INT FOREIGN KEY REFERENCES FormaPago(id),
PRIMARY KEY (facturaId)
);

