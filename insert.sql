-- Insert

INSERT INTO cliente(CI, nombre, apellido, correo, sexo, fechaNacimiento, fechaRegistro) VALUES
(25567845,'Luisa','Carmona','lc@gmail.com','F','1996/05/03','2024/08/03'),
(5579825,'Pedro','Perez','pp@gmail.com','M','1962/06/02','2023/10/09'),
(5487769,'Jose','Paez','jp@gmail.com','M','1962/05/03','2020/07/02'),
(12456782,'Josefa','Guitierrez','jg@gmail.com','F','1970/04/10','2024/03/01'),
(10213576,'Emma','Libardo','emma245@gmail.com','F','1968/05/03','2024/08/03'),

(20413679,'Alma','Jarabillo','almaj578@gmail.com','F','1990/11/01','2021/08/03'),
(7546821,'Carlos','Garcia','cg878@gmail.com','M','1965/08/23','2022/09/28'),
(25646991,'Estuart','Rodriguez','er@gmail.com','M','1996/03/12','2020/10/03'),
(12333465,'Eduardo','Gutierrez','eg202@gmail.com','M','1972/03/31','2019/07/15'),
(17458946,'Carmen','Diaz','cd314@gmail.com','F','1985/05/24','2024/08/03'),

(3965481,'Luis','Fernandez','lf@hotmail.com','M','1950/04/18','2016/04/26'),
(25221031,'Miguel','Fernandes','mf@hotmail.com','M','1995/08/12','2024/09/13'),
(19876324,'Jose','Lopez','jl@hotmail.com','M','1980/04/22','2023/09/07'),
(26546128,'Paul','Moreno','paul1.0@hotmail.com','M','1998/06/14','2025/10/01'),
(30111714,'Miranda','Perez','mperez@hotmail.com','F','2003/05/04','2023/11/21'),

(14578991,'Maria','Martin','maria.martin@hotmail.com','F','1976/11/30','2019/02/02'),
(13524165,'Alondra','Diaz','ad@hotmail.com','F','1974/04/28','2020/09/03'),
(21475896,'Andres','Lopez','al310@hotmail.com','M','1992/06/08','2015/07/02'),
(21256485,'Casandra','Torres','cass@hotmail.com','F','1992/11/04','2022/10/05'),
(32102456,'Amber','Paez','ambp@hotmail.com','F','2005/07/23','2023/06/13'),

(6561123,'Gabriel','Lopez','gbrlp@yahoo.es','M','1968/02/01','2022/11/05'),
(8756412,'Jose','Gil','jg@yahoo.es','M','1983/04/03','2021/12/25'),
(28896451,'Ricardo','Carmona','rc@yahoo.es','M','2000/01/01','2020/01/04'),
(14754123,'Mateo','Serrano','serrano@yahoo.es','M','1980/06/01','2022/04/03'),
(1024585,'Carol','Molina','molina13@yahoo.es','F','1970/06/14','2021/09/03'),

(13264458,'Alvaro','Carmona','alv@yahoo.es','M','1975/02/27','2022/09/06'),
(14442135,'Sofia','Medida','sm@yahoo.es','F','1976/02/12','2024/08/03'),
(26854456,'Marcela','Ortiz','m.ortiz@yahoo.es','F','1996/04/03','2022/11/18'),
(7546851,'Isabel','Morales','isam@yahoo.es','F','1969/04/19','2019/11/09'),
(12324530,'Braulio','Carmona','brauc@yahoo.es','M','2002/05/03','2024/08/03');

INSERT INTO Promo(nombre, slogan, codigo, tipoDescuento, valorDescuento, fechaInicio, fechaFin, tipoPromocion) VALUES
--tipoDescuento : %
('Black Friday sales','Promociones alocadas' , 1001, 'Porcentaje', 75, '2024/11/05', '2024/11/20', 'Ambos'),
('Deporte EXtremo', 'Equípate para la aventura con descuentos que te impulsarán', 2002, 'Porcentaje', 25, '2024/05/15', '2024/08/15', 'Fisica'),
('Precio especial','Precios Especiales', 3003, 'Porcentaje', 15, '2024/02/20', '2024/02/21', 'Fisica'),
('2x1', 'Compra dos, por el precio de uno', 4004, 'Porcentaje', 50, '2025/01/30', '2025/01/30', 'Fisica'),
('Regalo sorpresa', 'Compra y descubre tu regalo', 5005, 'Porcentaje', 10, '2024/12/21', '2024/12/24', 'Fisica'),
('Rebajas Explosivas', '¡Precios que hacen boom en tu bolsillo!', 6006, 'Porcentaje', 60, '2024/02/07', '2024/02/09', 'Fisica'),
('Precio de Remate', 'Precios que no volveran.', 7007, 'Porcentaje', 25, '2023/03/21', '2023/03/22', 'Fisica'),
('Precio de Locura', '"¡Precios tan bajos que te harán dudar!', 8008, 'Porcentaje', 75, '2025/01/01', '2025/01/06','Ambos'),
('Saving Pack', 'Todo lo que necesitas en un solo paquete, ¡y al mejor precio!', 9009, 'Porcentaje', 40, '2024/07/01', '2025/09/01', 'Fisica'),
('Oferta Relámpago', '¡Solo por hoy!', 1010, 'Porcentaje', 30, '2025/01/15', '2025/01/17', 'Fisica'),
('Promoción Exclusiva', 'Una oferta solo para ti, ¡no la dejes escapar!', 1111, 'Porcentaje', 15, '2024/10/30', '2024/10/31', 'Online'),
('Oferta del Día', '¡No te la pierdas!', 1212, 'Porcentaje', 10, '2025/03/03', '2025/03/03', 'Ambos'),
('Oferta Nocturna', 'Descuentos para los noctámbulos', 1313, 'Porcentaje', 20, '2025/01/01', '2025/03/01', 'Fisica'),
('Precio de Fin De', 'Para quienes disfrutan el fin de semana al extremo', 1414, 'Porcentaje', 20, '2024/11/01', '2024/11/03', 'Fisica'),
('Verano EN GaMa', '¡Llegó el Verano!', 1515, 'Porcentaje', 35, '2025/06/01', '2025/08/31', 'Fisica'),
('Solo en GaMa', 'Productos exclusivos', 1616, 'Porcentaje', 15, '2025/04/01', '2025/04/19', 'Online'),
('Belleza Radiante', 'Luce radiante sin gastar una fortuna',1717, 'Porcentaje', 15, '2025/06/01', '2025/06/08', 'Ambos'),
('Promoción de Aniversario', 'Descuentos especiales por nuestro aniversario.', 1818, 'Porcentaje', 15, '2025/05/15', '2025/05/20', 'Fisica'),
('Cumpleaños AlOcaDo', 'Celebra tu cumpleaños, con tu supermercado de confianza', 1919, 'Porcentaje', 15, '2025/07/25', '2025/08/25', 'Fisica'),
('Club Ahorro', 'Únete y descubre un mundo de descuentos y promociones especiales.', 2020, 'Porcentaje', 10, '2024/10/01', '2025/10/01', 'Online'),

--tipoDescuento : Fijo
('Gold Membresy', 'Beneficios exclusivos para miembros dorados', 2121, 'Fijo', 25, '2025/09/15', '2025/09/30', 'Fisica'),
('Navidad en GaMa', 'Rebajas de fin de año', 2222, 'Fijo', 30, '2024/12/21', '2025/01/06', 'Fisica'),
('Salud y Bienestar', '¡Descuentos para cuidar de ti!', 2323, 'Fijo', 15, '2025/03/01', '2025/04/01', 'Fisica'),
('Juguetes Felices', 'La alegría de los niños al mejor precio', 2424, 'Fijo', 20, '2025/07/01', '2025/07/31', 'Fisica'),
('Libros y Cultura', 'Enriquece tu mente; Nosotros hacemos el resto', 2525, 'Fijo', 10, '2024/05/25', '2025/05/30', 'Fisica'),
('Descuento Virtual', '¡Ahorra desde la comodidad de tu hogar!', 2626, 'Fijo', 10, '2024/11/15', '2024/11/17', 'Online'),
('Descuento Inverso', '¡El precio baja cada hora! Cuanto más esperas, más ahorras.', 2727, 'Fijo', 15, '2025/04/07', '2025/04/09', 'Fisica'),
('Tech Week', '¡Conéctate con el ahorro!', 2828, 'Fijo', 30, '2025/03/03', '2025/03/09','Online'),
('App Descuento', 'Descarga nuestra app y accede a promociones exclusivas', 2929, 'Fijo', 15, '2025/05/20', '2025/05/22','Online'),
('Social Sale', 'Síguenos en redes y descubre descuentos exclusivos.', 3030, 'Fijo', 10, '2024/12/01', '2025/12/31','Online'),
('GaMeR Weekend', 'Fin de semana perfecto para gamers', 3131, 'Fijo', 15, '2024/07/13', '2024/07/14', 'Ambos'),
('Cyber Weekend', 'Rebajas en tecnologia, solo por fin de semana', 3232, 'Fijo', 10, '2025/03/15', '2025/03/16','Ambos'),
('Experiencia VIP', 'Disfruta de beneficios exclusivos y descuentos premium', 3333, 'Fijo', 25, '2025/02/15', '2025/02/17','Ambos'),
('Selección Gourmet', '¡Un festín para los sentidos!', 3434, 'Fijo', 25, '2024/05/23', '2024/05/25','Ambos'),
('Artisan Savings', 'Productos artesanales únicos con descuentos especiales', 3535, 'Fijo', 15, '2025/03/13', '2025/03/14','Ambos'),
('Luxury Offers', '¡El lujo al alcance de tu mano!', 3636, 'Fijo', 20, '2023/01/03', '2023/01/03','Ambos'),
('Personal Shopper', 'Un asesor personal para que encuntres los mejores descuentos', 3737, 'Fijo', 5, '2023/04/01', '2023/04/05','Ambos'),
('Ahorro Verdes', 'Un lugar donde hallaras el precio justo', 3838, 'Fijo', 30, '2025/10/10', '2025/10/12','Ambos'),
('Charity Offers', '¡Ahorra y ayuda!', 3939, 'Fijo', 30, '2025/01/20', '2025/01/23','Ambos'),
('De compras x el GamA', 'Visitanos y descubre', 4040, 'Fijo', 10, '2024/09/01', '2025/09/10','Ambos');

--SELECT * FROM Promo;

INSERT INTO Sucursal (nombre, direccion, telefono, horaAbrir, horaCerrar, ciudadId) VALUES
('Los Palos Grandes', '3ra. Av. de Los Palos Grandes entre 2da. y 3ra. Transversal. Edf. Versalles.', 02122457876, 00, 23, 47),
('La India', 'Urbanización La Paz. Cruce de la Av. O"Higgins con Calle Junín.',02123145678, 00, 23, 47),
('Express Santa Eduvigis','Av. Rómulo Gallegos 2da Av. Santa Eduvigis, detrás de la estación del metro miranda.', 02127544661, 00, 23, 47),
('Macaracuay','Av Mara con Calle San Jose, C.C. Macaracuay Plaza, Nivel PB.', 02121457531, 00, 23, 47),
('Express Boleita Norte','Av. Principal Boleíta Norte. Centro Comercial Parque Residencial del Este Nivel Comercio 2. Municipio Sucre – Estado Miranda.', 02129841322, 00, 23, 47),
('Express Los Ruices','Avenida Francisco de Miranda con Calle A y B, Torre Cinética (antiguo Centro Boleíta), Locales A y D, Urb. Los Ruices.', 02124451221, 00, 23, 47),
('Express Caurimare','Av. Principal de Caurimare con Calle “D”. Parcela J 1B, Urbanizacion Caurimare. El Cafetal, Municipio Baruta.', 02126648571, 00, 23, 47),
('Express Chuao','Av. Araure con calle Las Lomas, C.C. Chuao, locales del 1 al 5, Urb. Chuao.', 02123124559,00, 23 ,47),
('Express El Paraiso','Urbanización El Paraíso. Av. José Antonio Paez con Av. "H".', 02122168853 ,00 ,23 ,47),
('Express La Urbina', 'Calle 5 con Calle 7.Parcela B2-15-16. La Urbina Sur.', 02123511783, 00 ,23 , 49); 

--SELECT * FROM Sucursal;

--TipoEnvio      tiempoEstimadoEntrega*
SET IDENTITY_INSERT TipoEnvio ON;
INSERT INTO TipoEnvio (id, nombreEnvio, tiempoEstimadoEntrega, costoEnvio) VALUES
(1, 'Envio inmediato', 1, 50.00),
(2, 'Mismo dia', 4, 30.00),
(3, 'Al dia siguiente', 23, 20.00),
(4, 'Semana siguiente', 168, 6.00),
(5, 'Envio estandar', 72, 15.00);
SET IDENTITY_INSERT TipoEnvio OFF;

--FormaPago
SET IDENTITY_INSERT FormaPago ON;
INSERT INTO FormaPago (id, nombre, descripcion) VALUES
(1, 'Tarjeta de credito', 'Pago con tarjeta de credito Visa, Mastercard o Amex'),
(2, 'Tarjeta de debito', 'Pago con tarjeta de debito vinculada a una cuenta bancaria'),
(3, 'PayPal', 'Pago a traves de la plataforma PayPal'),
(4, 'Transferencia bancaria', 'Pago mediante transferencia electronica'),
(5, 'Efectivo', 'Pago en efectivo al momento de la entrega'),
(6, 'Cheque', 'Pago mediante cheque bancario'),
(7, 'Criptomonedas', 'Pago con Bitcoin, Ethereum u otras criptomonedas'),
(8, 'Pago movil', 'Pago a traves de aplicaciones moviles de cada banco'),
(9, 'Cashea', 'Pago fraccionado en varias cuotas mensuales'),
(10, 'Zelle', 'Pago a traves de aplicaciones moviles de bancos americanos');
SET IDENTITY_INSERT FormaPago OFF;

--Cargo
SET IDENTITY_INSERT Cargo ON;
INSERT INTO Cargo (id, nombre, descripcion, salarioBasePorHora) VALUES
(1, 'Cajero', 'Atencion al cliente en caja y cobro de productos', 12.00),
(2, 'Reponedor', 'Encargado de reponer productos en estanterias', 10.00),
(3, 'Gerente de Tienda', 'Responsable de la gestion general del supermercado', 25.00),
(4, 'Auxiliar de Limpieza', 'Mantenimiento y limpieza de las instalaciones', 9.00),
(5, 'Encargado de Almacen', 'Gestiona el inventario y almacen de productos', 15.00),
(6, 'Carnicero', 'Preparacion y venta de productos carnicos', 14.00),
(7, 'Panadero', 'Elaboracion y venta de productos de panaderia', 13.00),
(8, 'Fruteria', 'Encargado de la seccion de frutas y verduras', 12.00),
(9, 'Seguridad', 'Vigilancia y control de acceso en el supermercado', 11.00),
(10, 'Atencion al Cliente', 'Resuelve dudas y quejas de los clientes', 12.00),
(11, 'Promotor', 'Encargado de promociones y degustaciones', 10.00),
(12, 'Operario de Montacargas', 'Maneja montacargas para mover mercancia', 13.00),
(13, 'Tecnico de Refrigeracion', 'Mantenimiento de equipos de refrigeracion', 16.00),
(14, 'Dependiente de Farmacia', 'Atencion en la seccion de farmacia', 14.00),
(15, 'Analista de Inventarios', 'Control y gestion de inventarios', 18.00);
SET IDENTITY_INSERT Cargo OFF;

-- Marca
SET IDENTITY_INSERT Marca ON;
INSERT INTO Marca (id, nombre, descripcion) VALUES
(1, 'Coca-Cola', 'Bebidas gaseosas y refrescos'),
(2, 'Pepsi', 'Bebidas y snacks'),
(3, 'Nestle', 'Productos alimenticios y bebidas'),
(4, 'Unilever', 'Productos de cuidado personal y alimentos'),
(5, 'Kelloggs', 'Cereales y snacks'),
(6, 'Danone', 'Productos lacteos y yogures'),
(7, 'Heinz', 'Salsas y conservas'),
(8, 'Colgate', 'Productos de higiene bucal'),
(9, 'P&G', 'Productos de limpieza y cuidado personal'),
(10, 'Lays', 'Snacks y papas fritas'),
(11, 'Bimbo', 'Pan y productos de panaderia'),
(12, 'La Serenisima', 'Productos lacteos y derivados'),
(13, 'Quilmes', 'Bebidas alcoholicas y cervezas'),
(14, 'Arcor', 'Golosinas y productos alimenticios'),
(15, 'Molinos', 'Harinas y productos alimenticios'),
(16, 'Mondelez', 'Galletas y snacks'),
(17, 'Knorr', 'Sopas y condimentos'),
(18, 'Natura', 'Productos de belleza y cuidado personal'),
(19, 'Fanta', 'Bebidas gaseosas'),
(20, 'Sprite', 'Bebidas gaseosas');
SET IDENTITY_INSERT Marca OFF;

-- Categoria
SET IDENTITY_INSERT Categoria ON;
INSERT INTO Categoria (id, nombre, descripcion) VALUES
(1, 'Bebidas', 'Refrescos, aguas, jugos y bebidas alcoholicas'),
(2, 'Lacteos', 'Leche, yogures, quesos y derivados'),
(3, 'Carnes', 'Carnes frescas y procesadas'),
(4, 'Frutas y Verduras', 'Productos frescos de frutas y verduras'),
(5, 'Panaderia', 'Pan, bollos y productos de reposteria'),
(6, 'Snacks', 'Papas fritas, frutos secos y golosinas'),
(7, 'Congelados', 'Alimentos congelados y listos para cocinar'),
(8, 'Limpieza', 'Productos de limpieza para el hogar'),
(9, 'Cuidado Personal', 'Jabones, champus y productos de higiene'),
(10, 'Despensa', 'Arroz, pasta, legumbres y conservas'),
(11, 'Bebidas Alcoholicas', 'Cervezas, vinos y licores'),
(12, 'Mascotas', 'Alimentos y accesorios para mascotas'),
(13, 'Farmacia', 'Medicamentos y productos de salud'),
(14, 'Hogar', 'Utensilios y articulos para el hogar'),
(15, 'Electrodomesticos', 'Pequenos electrodomesticos'),
(16, 'Bebes', 'Panales, leches y productos para bebes'),
(17, 'Helados', 'Helados y postres congelados'),
(18, 'Cafe e Infusiones', 'Cafe, te y bebidas calientes'),
(19, 'Aceites y Vinagres', 'Aceites, vinagres y aderezos'),
(20, 'Especias y Condimentos', 'Especias, sal y condimentos'),
(21, 'Dulces y Chocolates', 'Chocolates, caramelos y dulces'),
(22, 'Conservas', 'Conservas de pescado, carne y vegetales'),
(23, 'Pastas Frescas', 'Pastas frescas y listas para cocinar'),
(24, 'Salsas y Aderezos', 'Salsas, mayonesas y ketchup'),
(25, 'Cereales', 'Cereales para el desayuno'),
(26, 'Galletas', 'Galletas dulces y saladas'),
(27, 'Enlatados', 'Productos enlatados y conservados'),
(28, 'Huevos', 'Huevos frescos y derivados'),
(29, 'Pescados y Mariscos', 'Pescados y mariscos frescos'),
(30, 'Comida Preparada', 'Platos preparados y listos para consumir');
SET IDENTITY_INSERT Categoria OFF;

--Pais
SET IDENTITY_INSERT Pais ON;
INSERT INTO Pais (id, nombre) VALUES
(1, 'Mexico'),
(2, 'Estados Unidos'),
(3, 'Colombia'),
(4, 'Argentina'),
(5, 'Espana'),
(6, 'Brasil'),
(7, 'Chile'),
(8, 'Peru'),
(9, 'Francia'),
(10, 'Venezuela');
SET IDENTITY_INSERT Pais OFF;

--Estado
SET IDENTITY_INSERT Estado ON;
INSERT INTO Estado (id, nombre, paisId) VALUES
-- Mexico (id=1)
(1, 'Ciudad de Mexico', 1),
(2, 'Jalisco', 1),
(3, 'Nuevo Leon', 1),
(4, 'Puebla', 1),
(5, 'Veracruz', 1),

-- Estados Unidos (id=2)
(6, 'California', 2),
(7, 'Texas', 2),
(8, 'Nueva York', 2),
(9, 'Florida', 2),
(10, 'Illinois', 2),

-- Colombia (id=3)
(11, 'Bogota D.C.', 3),
(12, 'Antioquia', 3),
(13, 'Valle del Cauca', 3),
(14, 'Santander', 3),
(15, 'Cundinamarca', 3),

-- Argentina (id=4)
(16, 'Buenos Aires', 4),
(17, 'Cordoba', 4),
(18, 'Santa Fe', 4),
(19, 'Mendoza', 4),
(20, 'Tucuman', 4),

-- Venezuela (id=10)
(21, 'Distrito Capital', 10),    
(22, 'Miranda', 10),               
(23, 'Zulia', 10),                 
(24, 'Carabobo', 10),               
(25, 'Lara', 10);
SET IDENTITY_INSERT Estado OFF;

--Ciudad
SET IDENTITY_INSERT Ciudad ON;
INSERT INTO Ciudad (id, nombre, estadoId) VALUES
-- Ciudad de Mexico (id=1)
(1, 'Ciudad de Mexico', 1),
(2, 'Iztapalapa', 1),
(3, 'Gustavo A. Madero', 1),

-- Jalisco (id=2)
(4, 'Guadalajara', 2),
(5, 'Zapopan', 2),
(6, 'Tlaquepaque', 2),

-- Nuevo Leon (id=3)
(7, 'Monterrey', 3),
(8, 'San Pedro Garza Garcia', 3),
(9, 'Guadalupe', 3),

-- Puebla (id=4)
(10, 'Puebla', 4),
(11, 'Tehuacan', 4),
(12, 'Cholula', 4),

-- Veracruz (id=5)
(13, 'Veracruz', 5),
(14, 'Xalapa', 5),
(15, 'Cordoba', 5),

-- California (id=6)
(16, 'Los Angeles', 6),
(17, 'San Francisco', 6),
(18, 'San Diego', 6),

-- Texas (id=7)
(19, 'Houston', 7),
(20, 'Dallas', 7),
(21, 'Austin', 7),

-- Nueva York (id=8)
(22, 'Nueva York', 8),
(23, 'Buffalo', 8),
(24, 'Rochester', 8),

-- Florida (id=9)
(25, 'Miami', 9),
(26, 'Orlando', 9),
(27, 'Tampa', 9),

-- Illinois (id=10)
(28, 'Chicago', 10),
(29, 'Springfield', 10),
(30, 'Peoria', 10),

-- Bogota D.C. (id=11)
(31, 'Bogota', 11),

-- Antioquia (id=12)
(32, 'Medellin', 12),
(33, 'Envigado', 12),
(34, 'Bello', 12),

-- Valle del Cauca (id=13)
(35, 'Cali', 13),
(36, 'Palmira', 13),
(37, 'Buenaventura', 13),

-- Santander (id=14)
(38, 'Bucaramanga', 14),
(39, 'Floridablanca', 14),
(40, 'Barrancabermeja', 14),

-- Cundinamarca (id=15)
(41, 'Soacha', 15),
(42, 'Girardot', 15),
(43, 'Facatativa', 15),

-- Buenos Aires (id=16)
(44, 'Buenos Aires', 16),
(45, 'La Plata', 16),
(46, 'Mar del Plata', 16),

-- Venezuela: Distrito Capital (id=21)
(47, 'Caracas', 21),

-- Venezuela: Miranda (id=22)
(48, 'Los Teques', 22),
(49, 'Petare', 22),

-- Venezuela: Zulia (id=23)
(50, 'Maracaibo', 23),

-- Venezuela: Distrito Capital (id=21)
(51, 'El Junquito', 21),

-- Venezuela: Miranda (id=22)
(52, 'Charallave', 22),
(53, 'Cua', 22),
(54, 'Guarenas', 22),

-- Venezuela: Zulia (id=23)
(55, 'Cabimas', 23),
(56, 'Santa Barbara del Zulia', 23),
(57, 'Ciudad Ojeda', 23),

-- Venezuela: Carabobo (id=24)
(58, 'San Joaquin', 24),
(59, 'Bejuma', 24),
(60, 'Tocuyito', 24),

-- Venezuela: Lara (id=25)
(61, 'Quibor', 25),
(62, 'El Tocuyo', 25),
(63, 'Carora', 25),
(64, 'Sanare', 25),
(65, 'Cubiro', 25);
SET IDENTITY_INSERT Ciudad OFF;

--SELECT * From Cliente;
--SELECT * From TipoEnvio;
--SELECT * From FormaPago;
--SELECT * From Cargo;
--SELECT * From Marca;
--SELECT * From Categoria;
--SELECT * From Pais;
--SELECT * From Ciudad;
