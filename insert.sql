-- Insert
--Cliente
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
(20, 'Sprite', 'Bebidas gaseosas'),
('GAMA', 'Marca propia de Supermercados GAMA.'),
('Empresas Polar', 'Conglomerado de empresas que incluye alimentos, bebidas y otros productos.'),
('Los Andes', 'Bebidas naturales a base de frutas.'),
('La Castellana', 'Salsas y condimentos típicos venezolanos.'),
('La Moderna', 'Pastas alimenticias de alta calidad.'),
('Santa Teresa', 'Ron venezolano de renombre internacional.'),
('Cacique', 'Uno de los rones más populares de Venezuela.'),
('Venezuela', 'Café producido en las regiones montañosas de Venezuela.'),
('El Rey', 'Chocolate venezolano de alta calidad.'),
('Savoy', 'Chocolates y dulces tradicionales.'),
('Puig', 'Galletas y productos de panadería.'),
('La Caroreña', 'Marca lider en venta de sangría y vinos.'),
('La Fama', 'Productos de panadería y pastelería.'),
('La Lucha', 'Café y productos de cafetería.'),
('La Vaquita', 'Leche y productos lácteos.'),
('La Campiña', 'Quesos y productos lácteos.'),
('La Montaña', 'Agua mineral y bebidas refrescantes.'),
('La Sierra', 'Agua purificada y bebidas.'),
('La Costa', 'Pescados y mariscos frescos.'),
('La Selva', 'Frutas y verduras frescas.'),
('Leche Táchira', 'Leche y derivados lácteos.'),
('Parmalat', 'Leche UHT y productos lácteos.'),
('Minalba', 'Agua mineral de la mejor calidad.'),
('Agua Manantial', 'Agua purificada y mineral.'),
('Diana', 'Aceites comestibles y productos alimenticios.'),
('Mazola', 'Aceite de maíz y otros productos.'),
('Pomarrosa', 'Salsas y condimentos típicos.'),
('La Sibarita', 'Productos gourmet y delicatessen.'),
('La Giralda', 'Productos de panadería y pastelería.'),
('Ace', 'Productos de limpieza para el hogar.'),
('Foca', 'Detergente en polvo y líquido.'),
('Jabón Rey', 'Jabón de lavar tradicional.'),
('Scott', 'Productos de higiene personal.'),
('Toallas Nova', 'Toallas de papel y servilletas.'),
('Kraft', 'Productos alimenticios y snacks.'),
('PepsiCo', 'Bebidas y snacks.'),
('Palmolive', 'Productos de higiene y cuidado personal.'),
('General Mills', 'Productos alimenticios variados.'),
('Marlboro', 'Cigarrilos de distintos tipos.'),
('Camel', 'Cigarrillos de alta calidad.'),
('Lucky Strike', 'Cigarrillos de tabaco rubio.'),
('Duracell', 'Baterías y pilas de larga duración.'),
('Energizer', 'Pilas y baterías de calidad.');
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


--Productos
INSERT INTO Producto(nombre, codigoBarra, descripcion, tipoPrecio, precioPor, esExentoIVA, categoriaId,
marcaId) VALUES
('Coca-Cola Regular', '123456789', 'Refresco sabor cola', 'PorUnidad', 1.50, 0, 1, 1),
('Pepsi Light', '234567890', 'Refresco sin azúcar', 'PorUnidad', 1.40, 0, 1, 2),
('Nestlé Chocolate', '789012345', 'Barra de chocolate con leche', 'PorUnidad', 0.80, 0, 10, 3),
('Yogur Griego', '567890123', 'Yogur natural sin azúcar', 'PorUnidad', 0.90, 0, 2, 6),
('Bimbo Pan Integral', '678901234', 'Pan de molde integral', 'PorUnidad', 2.50, 0, 5, 11),
('Lays Papas Fritas', '789012345', 'Papas fritas sabor original', 'PorUnidad', 1.20, 0, 6, 10),
('Colgate Pasta Dental', '901234561', 'Pasta dental con flúor', 'PorUnidad', 3.00, 0, 9, 8),
('Unilever Jabón Dove', '012345012', 'Jabón en barra para cuidado de la piel', 'PorUnidad', 2.20, 0, 9,4),
('Sprite Zero', '112233445', 'Refresco sin azúcar', 'PorUnidad', 1.30, 0, 1, 20),
('Fanta Naranja', '223344778', 'Refresco sabor naranja', 'PorUnidad', 1.30, 0, 1, 19),
('Bimbo Tostadas', '778899001', 'Tostadas de pan', 'PorUnidad', 1.70, 0, 5, 11),
('Knorr Sopa Instantánea', '990011223', 'Sopa en polvo de verduras', 'PorUnidad', 1.50, 0, 10, 17),
('Arcor Bon o Bon', '001144556', 'Bombón relleno de dulce de leche', 'PorUnidad', 0.50, 0, 6, 14),
('Oreo', '112455668', 'Galletas rellenas de crema', 'PorUnidad', 1.80, 0, 26, 16),
('Kelloggs Corn Flakes', '223366779', 'Cereal de maíz clásico', 'PorUnidad', 2.50, 0, 25, 5),
('Pampero Salsa de Tomate', '356677880', 'Salsa de tomate clásica', 'PorUnidad', 2.30, 0, 24, 7),
('Colgate Enjuague Bucal', '445566771', 'Enjuague bucal refrescante', 'PorUnidad', 4.00, 0, 9, 8),
('Natura Crema Facial', '556899002', 'Crema hidratante facial', 'PorUnidad', 5.50, 0, 9, 18),
('La Lechera Leche Entera', '669900113', 'Leche entera pasteurizada', 'PorUnidad', 1.00, 0, 2, 12),
('Lays Papas Onduladas', '778899024', 'Papas fritas con ondulaciones', 'PorUnidad', 1.50, 0, 6, 10),
('P&G Ariel Líquido', '889922335', 'Detergente líquido para ropa', 'PorUnidad', 3.80, 0, 8, 9),
('Coca-Cola Zero', '990011226', 'Refresco sin azúcar', 'PorUnidad', 1.40, 0, 1, 1),
('Pepsi Black', '003344557', 'Refresco sin azúcar', 'PorUnidad', 1.40, 0, 1, 2),
('Galletas Maria', '000111220123','Galletas Maria de 6 unidades','PorUnidad', 1.70,0,26, 16),
('Pulpa Negra', '111111111', 'Carne de res sin hueso', 'PorPesoKg', 10.00, 0, 3, 15),
('Salmón', '222222222', 'Pescado fresco', 'PorPesoKg', 20.00, 0, 29, 15),
('Muslo de Pollo', '333333333', 'Parte del pollo', 'PorPesoKg', 5.00, 0, 3, 15),
('Pollo Entero', '444444444', 'Pollo completo', 'PorPesoKg', 4.00, 0, 3, 15),
('Alas de Pollo', '555555555', 'Alas de pollo frescas', 'PorPesoKg', 3.50, 0, 3, 15),
('Patas de Cerdo', '666666666', 'Patas de cerdo frescas', 'PorPesoKg', 4.50, 0, 3, 15),
('Huesito Ahumado', '777777777', 'Hueso ahumado para caldo', 'PorPesoKg', 2.50, 0, 3, 15),
('Tocineta', '888888888', 'Tiras de tocino', 'PorPesoKg', 8.00, 0, 3, 15),
('Paquete de 20 Salchichas', '999999999', 'Paquete de 20 salchichas', 'PorUnidad', 5.00, 0, 3, 15),
('Salchicha Polaca', '121212121', 'Salchicha individual', 'PorPesoKg', 1.00, 0, 3, 15),
('Salchicha de Pollo', '141414141', 'Salchicha hecha de pollo', 'PorPesoKg', 6.00, 0, 3, 15),
('Jamón de Pavo', '151515151', 'Jamón de pavo', 'PorPesoKg', 9.00, 0, 3, 15),
('Mortadela de Pollo', '161616161', 'Mortadela hecha de pollo', 'PorPesoKg', 4.00, 0, 3, 15),
('Jamón de Pierna', '171717171', 'Jamón de pierna de cerdo', 'PorPesoKg', 8.50, 0, 3, 15),
('Queso Paisa', '181818181', 'Queso tipo paisa', 'PorPesoKg', 3.00, 0, 2, 12),
('Queso Llanero', '191919191', 'Queso fresco llanero', 'PorPesoKg', 3.50, 0, 2, 12),
('Queso de Mano', '202020202', 'Queso artesanal de mano', 'PorPesoKg', 4.00, 0, 2, 12),
('Queso Merideño', '212121212', 'Queso merideño', 'PorPesoKg', 4.50, 0, 2, 12),
('Queso Mozzarella', '222222222', 'Queso mozzarella', 'PorPesoKg', 5.00, 0, 2, 12),
('Queso Amarillo', '232323232', 'Queso amarillo', 'PorPesoKg', 4.00, 0, 2, 12),
('Queso Azul', '242424242', 'Queso azul', 'PorPesoKg', 6.00, 0, 2, 12),
('Papas', '25252522', 'Tubérculo fresco', 'PorPesoKg', 1.00, 0, 4, 15),
('Zanahorias', '262626262', 'Raíz vegetal fresca', 'PorPesoKg', 1.20, 0, 4, 15),
('Apio', '272727272', 'Vegetal fresco', 'PorPesoKg', 1.50, 0, 4, 15),
('Ocumo', '282828282', 'Tubérculo fresco', 'PorPesoKg', 1.30, 0, 4, 15),
('Manzana', '292929292', 'Fruta fresca', 'PorPesoKg', 2.00, 0, 4, 15),
('Cambur', '303030303', 'Banana fresca', 'PorPesoKg', 1.80, 0, 4, 15),
('Pera', '313131313', 'Fruta fresca', 'PorPesoKg', 2.20, 0, 4, 15),
('Naranja', '323232323', 'Fruta cítrica fresca', 'PorPesoKg', 1.50, 0, 4, 15),
('Mandarina', '333334333', 'Fruta cítrica fresca', 'PorPesoKg', 1.60, 0, 4, 15),
('Sandía', '343434344', 'Fruta fresca', 'PorPesoKg', 1.00, 0, 4, 15),
('Fresas', '353535753', 'Fruta fresca', 'PorPesoKg', 2.50, 0, 4, 15),
('Doritos', '368636363', 'Snack de tortilla', 'PorUnidad', 1.50, 0, 6, 10),
('Tequeños Pre-Preparados', '33737373', 'Tequeños congelados', 'PorUnidad', 5.00, 0, 7, 11),
('Masa para Pastelitos', '383838383', 'Masa congelada para pastelitos', 'PorUnidad', 3.00, 0, 7, 11),
('Arroz Amarillo', '393939393', 'Arroz tipo amarillo', 'PorUnidad', 1.20, 0, 10, 15),
('Pasta Larga', '404040404', 'Pasta de trigo larga', 'PorUnidad', 1.50, 0, 10, 15),
('Pasta Tornillos', '414141414', 'Pasta de trigo corta en forma de tornillo', 'PorUnidad', 1.40, 0, 10, 15),
('Arroz Blanco', '424242424', 'Arroz tipo blanco', 'PorUnidad', 1.00, 0, 10, 15),
('Harina Precocida', '434343434', 'Harina de maíz precocida', 'PorUnidad', 1.10, 0, 10, 15),
('Oreo Rellena de Chocolate', '444454444', 'Galletas rellenas de chocolate', 'PorUnidad', 2.00, 0, 26, 16),
('Cloro', '454545454', 'Producto de limpieza', 'PorUnidad', 0.80, 0, 8, 9),
('Comida para Gatos', '464646464', 'Alimento seco para gatos', 'PorUnidad', 3.50, 0, 12, 9),
('Comida para Perros', '47474744', 'Alimento seco para perros', 'PorUnidad', 4.00, 0, 12, 9),
('Collar para Perros', '48484884', 'Collar para perros', 'PorUnidad', 5.00, 0, 12, 9),
('Collar para Gatos', '494949494', 'Collar para gatos', 'PorUnidad', 4.50, 0, 12, 9),
('Hueso de Juguete para Perros', '505070505', 'Juguete en forma de hueso', 'PorUnidad', 2.50, 0, 12, 9),
('Ratón de Juguete para Gatos', '515151515', 'Juguete en forma de ratón', 'PorUnidad', 2.00, 0, 12, 9),
('Jaula para Pájaros', '525252525', 'Jaula para aves', 'PorUnidad', 10.00, 0, 12, 9),
('Pañales Desechables Talla S', '101010101', 'Pañales desechables tamaño S', 'PorUnidad', 6.00, 0, 16, 9),
('Pañales Desechables Talla M', '202020202', 'Pañales desechables tamaño M', 'PorUnidad', 7.00, 0, 16, 9),
('Pañales Desechables Talla L', '303030303', 'Pañales desechables tamaño L', 'PorUnidad', 8.00, 0, 16, 9),
('Pañales Desechables Talla XL', '404040404', 'Pañales desechables tamaño XL', 'PorUnidad', 9.00, 0, 16, 9),
('Leche NaN para Recién Nacidos', '50550505', 'Fórmula láctea para bebés', 'PorUnidad', 15.00, 0, 2, 6),
('Toallas Húmedas', '606060606', 'Paquete de toallas húmedas', 'PorUnidad', 3.50, 0, 9, 4),
('Tetero', '707070707', 'Biberón para bebés', 'PorUnidad', 4.50, 0, 16, 9),
('Cucharillas', '808080808', 'Paquete de cucharillas', 'PorUnidad', 1.20, 0, 14, 9),
('Tenedores', '90909009', 'Paquete de tenedores', 'PorUnidad', 1.20, 0, 14, 9),
('Macetas', '111111112', 'Maceta para plantas', 'PorUnidad', 5.00, 0, 14, 9),
('Palillos', '12212123', 'Paquete de palillos', 'PorUnidad', 0.80, 0, 14, 9),
('Platos Desechables', '131313134', 'Paquete de platos desechables', 'PorUnidad', 2.50, 0, 14, 9),
('Linterna ', '14114145', 'Linterna portátil', 'PorUnidad', 6.00, 0, 14, 9),
('Bombillo Ahorrador', '171717178', 'Bombillo de bajo consumo', 'PorUnidad', 3.00, 0, 14, 9),
('Bombillo LED', '181818189', 'Bombillo LED', 'PorUnidad', 4.00, 0, 14, 9),
('Sartén de Teflón 18 cm', '191919190', 'Sartén de teflón de 18 cm', 'PorUnidad', 10.00, 0, 14, 9),
('Sartén de Teflón 25 cm', '202020201', 'Sartén de teflón de 25 cm', 'PorUnidad', 15.00, 0, 14, 9),
('Nevera de 2 Puertas', '292929290', 'Refrigerador de 2 puertas', 'PorUnidad', 500.00, 0, 15, 9),
('Nevera de una Puerta', '303030301', 'Refrigerador de una puerta', 'PorUnidad', 300.00, 0, 15, 9),
('Nevera de Oficina', '313131312', 'Refrigerador pequeño de oficina', 'PorUnidad', 200.00, 0, 15, 9),
('Congelador', '323232323', 'Congelador grande', 'PorUnidad', 400.00, 0, 15, 9),
('Lavadora de una Tina', '333333334', 'Lavadora de una tina', 'PorUnidad', 350.00, 0, 15, 9),
('Lavadora de dos Tinas', '343434345', 'Lavadora de dos tinas', 'PorUnidad', 400.00, 0, 15, 9),
('Cocina de dos Hornillas', '353535356', 'Cocina con dos hornillas', 'PorUnidad', 150.00, 0, 15, 9),
('Cocina de 4 Hornillas', '363636367', 'Cocina con cuatro hornillas', 'PorUnidad', 200.00, 0, 15, 9),
('Cocina de 5 Hornillas', '373737378', 'Cocina con cinco hornillas', 'PorUnidad', 250.00, 0, 15, 9),
('Fósforos', '383838389', 'Paquete de fósforos', 'PorUnidad', 0.50, 0, 14, 9),
('Huevos de 15 Unidades', '393939390', 'Cartón de 15 huevos', 'PorUnidad', 3.00, 0, 28, 9),
('Huevos de 30 Unidades', '40400401', 'Cartón de 30 huevos', 'PorUnidad', 5.00, 0, 28, 9),
('Lata de Atún', '414141412', 'Lata de atún', 'PorUnidad', 2.00, 0, 22, 15),
('Lata de Sardinas', '424242423', 'Lata de sardinas', 'PorUnidad', 1.50, 0, 22, 15),
('Mayonesa 250g', '434343434', 'Mayonesa en frasco 250g', 'PorUnidad', 2.00, 0, 24, 7),
('Mayonesa 500g', '444444445', 'Mayonesa en frasco 500g', 'PorUnidad', 3.50, 0, 24, 7),
('Cereal de Frutas', '111111112', 'Cereal de frutas variadas', 'PorUnidad', 3.00, 0, 25, 5),
('Cereal Zucarita', '222222223', 'Cereal azucarado', 'PorUnidad', 3.50, 0, 25, 5),
('Granola', '333333334', 'Mezcla de cereales y frutas', 'PorUnidad', 4.00, 0, 25, 5),
('Cereal Great Grains', '444444445', 'Cereal multigrano', 'PorUnidad', 3.80, 0, 25, 5),
('Cinco Estrellas', '777777778', 'Bebida alcohólica Cinco Estrellas', 'PorUnidad', 8.00, 1, 11, 13),
('Bajo Cero ', '888888889', 'Bebida alcohólica Bajo Cero', 'PorUnidad', 9.00, 1, 11, 13),
('Cerveza Light', '101010102', 'Cerveza baja en calorías', 'PorUnidad', 1.80, 1, 11, 13),
('Carta Roja ', '111111113', 'Bebida alcohólica Carta Roja', 'PorUnidad', 11.00, 1, 11, 13),
('Ron Gran Reserva', '131313135', 'Ron Gran Reserva', 'PorUnidad', 20.00, 1, 11, 13),
('Whiskey', '14114146', 'Whiskey importado', 'PorUnidad', 25.00, 1, 11, 13),
('Vino La Sagrada Familia', '151515157', 'Vino tinto La Sagrada Familia', 'PorUnidad', 8.00, 1, 11, 13),
('Mal Portada', '161616168', 'Bebida alcohólica Mal Portada', 'PorUnidad', 7.00, 1, 11, 13),
('Yogur de Fresa', '171717179', 'Yogur sabor fresa', 'PorUnidad', 1.50, 0, 2, 6),
('Yogur de Mango', '181818180', 'Yogur sabor mango', 'PorUnidad', 1.50, 0, 2, 6),
('Agua 1L', '19919191', 'Agua embotellada 1L', 'PorUnidad', 0.80, 0, 1, 1),
('Agua 5L', '202020202', 'Agua embotellada 5L', 'PorUnidad', 2.50, 0, 1, 1),
('Acetaminofén 10 mg', '212121213', 'Analgésico acetaminofén 10 mg', 'PorUnidad', 1.00, 0, 13, 15),
('Ibuprofeno 500mg', '222222224', 'Analgésico ibuprofeno 500 mg', 'PorUnidad', 1.50, 0, 13, 15),
('Atamel 10mg', '232323235', 'Analgésico atamel 10 mg', 'PorUnidad', 1.00, 0, 13, 15),
('Loratadina 10mg', '242424246', 'Antihistamínico loratadina 10 mg', 'PorUnidad', 1.20, 0, 13, 15),
('Vitamina C', '25525257', 'Suplemento de vitamina C', 'PorUnidad', 1.80, 0, 13, 15),
('Tera-grip', '262626268', 'Antigripal tera-grip', 'PorUnidad', 2.00, 0, 13, 15),
('Amoxicilina 500mg', '272727279', 'Antibiótico amoxicilina 500 mg', 'PorUnidad', 2.50, 0, 13, 15),
('Sal', '28228280', 'Sal de mesa', 'PorUnidad', 0.50, 0, 20, 15),
('Orégano en Polvo', '2929291', 'Especia orégano en polvo', 'PorUnidad', 1.00, 0, 20, 15),
('Comino', '30300302', 'Especia comino', 'PorUnidad', 1.00, 0, 20, 15),
('Adobo', '313131313', 'Condimento adobo', 'PorUnidad', 1.20, 0, 20, 15),
('Café', '323232324', 'Café molido', 'PorUnidad', 3.00, 0, 18, 15),
('Café Instantáneo', '333333335', 'Café instantáneo', 'PorUnidad', 3.50, 0, 18, 15),
('Té de Manzanilla', '343434346', 'Té de manzanilla', 'PorUnidad', 2.50, 0, 18, 15),
('Té de Malojillo', '353535357', 'Té de malojillo', 'PorUnidad', 2.50, 0, 18, 15),
('Té de Hierbabuena', '363636368', 'Té de hierbabuena', 'PorUnidad', 2.50, 0, 18, 15),
('Ensaladas Preparadas', '373737379', 'Ensalada lista para consumir', 'PorUnidad', 4.00, 0, 30, 10),
('Consomé', '383838380', 'Caldo de pollo en polvo', 'PorUnidad', 1.50, 0, 10, 17),
('Arroz con Pollo', '393939391', 'Plato preparado de arroz con pollo', 'PorUnidad', 5.00, 0, 30, 10),
('Ramen', '404040402', 'Sopa instantánea ramen', 'PorUnidad', 1.20, 0, 10, 17),
('Chocolate de Taza', '414141413', 'Chocolate para taza', 'PorUnidad', 2.00, 0, 21, 15),
('Chocolate de Barra', '424242424', 'Barra de chocolate', 'PorUnidad', 2.00, 0, 21, 15),
('Chocolate con Almendras', '434343435', 'Chocolate con almendras', 'PorUnidad', 2.50, 0, 21, 15),
('Caramelos de Fresa', '444444446', 'Caramelos sabor fresa', 'PorUnidad', 1.00, 0, 21, 15),
('Caramelos de Manzana', '101010102', 'Caramelos sabor manzana', 'PorUnidad', 1.00, 0, 21, 14),
('Caramelos de Jengibre', '202020203', 'Caramelos sabor jengibre', 'PorUnidad', 1.20, 0, 21, 14),
('Caramelos con Relleno de Chocolate', '303030304', 'Caramelos con centro de chocolate', 'PorUnidad', 1.50, 0, 21, 14),
('Camarones Conservados', '404040405', 'Camarones en conserva', 'PorUnidad', 3.00, 0, 29, 15),
('Cangrejo', '505050506', 'Carne de cangrejo en conserva', 'PorUnidad', 3.50, 0, 29, 15),
('Sardinas al Vacío', '606070607', 'Sardinas envasadas al vacío', 'PorUnidad', 2.00, 0, 29, 15),
('Pepinos Conservados', '727070708', 'Pepinos en conserva', 'PorUnidad', 1.50, 0, 4, 15),
('Urel', '808080809', 'Pescado fresco Urel', 'PorPesoKg', 8.00, 0, 29, 15),
('Pargo', '909090910', 'Pescado fresco Pargo', 'PorPesoKg', 10.00, 0, 29, 15),
('Roncador', '111111113', 'Pescado fresco Roncador', 'PorPesoKg', 9.00, 0, 29, 15),
('Leche Condensada', '121212124', 'Leche condensada en lata', 'PorUnidad', 1.80, 0, 2, 12),
('Leche Evaporada', '131313135', 'Leche evaporada en lata', 'PorUnidad', 1.60, 0, 2, 12),
('Crema Chantillí', '141414146', 'Crema chantillí', 'PorUnidad', 2.50, 0, 2, 12),
('Crema de Leche', '151515157', 'Crema de leche', 'PorUnidad', 2.00, 0, 2, 12),
('Natilla', '161616168', 'Postre de natilla', 'PorUnidad', 2.20, 0, 2, 12),
('Arequipe', '171717179', 'Dulce de leche', 'PorUnidad', 3.00, 0, 2, 12),
('Mantequilla 500gr', '181818180', 'Mantequilla en barra 500gr', 'PorUnidad', 4.00, 0, 2, 12),
('Mantequilla 250gr', '191919191', 'Mantequilla en barra 250gr', 'PorUnidad', 2.00, 0, 2, 12),
('Arroz con Ensalada y Pescado', '111111114', 'Plato preparado de arroz con ensalada y pescado', 'PorUnidad', 6.00, 0, 30, 15),
('Salsa de Soya', '222222225', 'Salsa de soya', 'PorUnidad', 2.00, 0, 24, 7),
('Salsa de Ajo', '333333336', 'Salsa de ajo', 'PorUnidad', 2.50, 0, 24, 7),
('Salsa Inglesa', '444444447', 'Salsa inglesa', 'PorUnidad', 2.80, 0, 24, 7),
('Salsa BBQ', '555555558', 'Salsa barbacoa', 'PorUnidad', 3.00, 0, 24, 7),
('Mostaza', '666666669', 'Mostaza en frasco', 'PorUnidad', 1.50, 0, 24, 7),
('Caraota', '777777770', 'Caraotas negras secas', 'PorPesoKg', 1.20, 0, 10, 15),
('Lenteja', '888888881', 'Lentejas secas', 'PorPesoKg', 1.00, 0, 10, 15),
('Arbeja', '999999992', 'Arvejas secas', 'PorPesoKg', 1.10, 0, 10, 15),
('Caraotas Rojas', '101010103', 'Caraotas rojas secas', 'PorPesoKg', 1.30, 0, 10, 15),
('Panza', '202020204', 'Panza de res fresca', 'PorPesoKg', 5.00, 0, 3, 15),
('Patas de Pollo', '303030305', 'Patas de pollo frescas', 'PorPesoKg', 2.00, 0, 3, 15),
('Patas de Res', '404040406', 'Patas de res frescas', 'PorPesoKg', 3.00, 0, 3, 15),
('Carne de Lagarto', '505050507', 'Carne de lagarto', 'PorPesoKg', 8.00, 0, 3, 15),
('Mango', '606060608', 'Fruta fresca de mango', 'PorPesoKg', 1.50, 0, 4, 15),
('Batata', '70700709', 'Tubérculo fresco de batata', 'PorPesoKg', 1.20, 0, 4, 15),
('Ñame', '808080810', 'Tubérculo fresco de ñame', 'PorPesoKg', 1.30, 0, 4, 15),
('Calabacín', '909090911', 'Vegetal fresco de calabacín', 'PorPesoKg', 1.10, 0, 4, 15),
('Cilantro', '111111116', 'Hierba fresca de cilantro', 'PorPesoKg', 2.50, 0, 4, 15),
('Perejil', '121212127', 'Hierba fresca de perejil', 'PorPesoKg', 2.00, 0, 4, 15),
('Vinagre', '131313138', 'Vinagre en botella', 'PorUnidad', 1.00, 0, 19, 7),
('Ensalada de Frutas Preparadas', '141417149', 'Ensalada de frutas lista para comer', 'PorUnidad', 4.00, 0, 30, 15),
  --Productos para mas marcas
('GAMA Aceite', '1234567890123', 'Aceite de cocina GAMA', 'PorUnidad', 5.00, 0, 1, 21),
('Empresas Polar Harina PAN', '1234567890124', 'Harina de maíz precocida', 'PorUnidad', 2.50, 0, 1, 22),
('Los Andes Jugo de Naranja', '1234567890125', 'Jugo de naranja natural', 'PorUnidad', 3.00, 0, 1, 23),
('La Castellana Salsa de Tomate', '1234567890126', 'Salsa de tomate tradicional', 'PorUnidad', 1.50, 0, 1, 24),
('La Moderna Pasta', '1234567890127', 'Pasta alimenticia de alta calidad', 'PorUnidad', 2.00, 0, 1, 25),
('Santa Teresa Ron', '1234567890128', 'Ron venezolano', 'PorUnidad', 15.00, 0, 1, 26),
('Cacique Ron', '1234567890129', 'Ron popular de Venezuela', 'PorUnidad', 12.00, 0, 1, 27),
('Venezuela Café', '1234567890130', 'Café molido', 'PorUnidad', 8.00, 0, 1, 28),
('El Rey Chocolate', '1234567890131', 'Chocolate de alta calidad', 'PorUnidad', 10.00, 0, 1, 29),
('Savoy Chocolate', '1234567890132', 'Chocolates y dulces', 'PorUnidad', 5.00, 0, 1, 30),
('Puig Galletas', '1234567890133', 'Galletas de panadería', 'PorUnidad', 3.00, 0, 1, 31),
('La Caroreña Sangría', '1234567890134', 'Sangría y vinos', 'PorUnidad', 7.00, 0, 1, 32),
('La Fama Pan', '1234567890135', 'Productos de panadería', 'PorUnidad', 2.00, 0, 1, 33),
('La Lucha Café', '1234567890136', 'Café y productos de cafetería', 'PorUnidad', 6.00, 0, 1, 34),
('La Vaquita Leche', '1234567890137', 'Leche y productos lácteos', 'PorUnidad', 4.00, 0, 1, 35),
('La Campiña Queso', '1234567890138', 'Quesos y productos lácteos', 'PorUnidad', 5.00, 0, 1, 36),
('La Montaña Agua', '1234567890139', 'Agua mineral', 'PorUnidad', 1.00, 0, 1, 37),
('La Sierra Agua', '1234567890140', 'Agua purificada', 'PorUnidad', 1.00, 0, 1, 38),
('La Costa Pescado', '1234567890141', 'Pescados frescos', 'PorPesoKg', 10.00, 0, 1, 39),
('La Selva Frutas', '1234567890142', 'Frutas frescas', 'PorPesoKg', 3.00, 0, 1, 40),
('Leche Táchira Leche', '1234567890143', 'Leche y derivados lácteos', 'PorUnidad', 4.00, 0, 1, 41),
('Parmalat Leche', '1234567890144', 'Leche UHT', 'PorUnidad', 4.00, 0, 1, 42),
('Minalba Agua', '1234567890145', 'Agua mineral', 'PorUnidad', 1.00, 0, 1, 43),
('Agua Manantial Agua', '1234567890146', 'Agua purificada', 'PorUnidad', 1.00, 0, 1, 44),
('Diana Aceite', '1234567890147', 'Aceites comestibles', 'PorUnidad', 5.00, 0, 1, 45),
('Mazola Aceite', '1234567890148', 'Aceite de maíz', 'PorUnidad', 5.00, 0, 1, 46),
('Pomarrosa Salsa', '1234567890149', 'Salsas y condimentos', 'PorUnidad', 2.00, 0, 1, 47),
('La Sibarita Gourmet', '1234567890150', 'Productos gourmet', 'PorUnidad', 10.00, 0, 1, 48),
('La Giralda Panadería', '1234567890151', 'Productos de panadería', 'PorUnidad', 3.00, 0, 1, 49),
('Ace Limpieza', '1234567890152', 'Productos de limpieza', 'PorUnidad', 4.00, 0, 1, 50),
('Foca Detergente', '1234567890153', 'Detergente en polvo', 'PorUnidad', 3.00, 0, 1, 51),
('Jabón Rey Jabón', '1234567890154', 'Jabón de lavar', 'PorUnidad', 2.00, 0, 1, 52),
('Scott Higiene', '1234567890155', 'Productos de higiene personal', 'PorUnidad', 5.00, 0, 1, 53),
('Toallas Nova Toallas', '1234567890156', 'Toallas de papel', 'PorUnidad', 3.00, 0, 1, 54),
('Kraft Snacks', '1234567890157', 'Productos alimenticios y snacks', 'PorUnidad', 4.00, 0, 1, 55),
('PepsiCo Bebidas', '1234567890158', 'Bebidas y snacks', 'PorUnidad', 2.00, 0, 1, 56),
('Palmolive Higiene', '1234567890159', 'Productos de higiene personal', 'PorUnidad', 5.00, 0, 1, 57),
('General Mills Alimentos', '1234567890160', 'Productos alimenticios variados', 'PorUnidad', 4.00, 0, 1, 58),
('Marlboro Cigarrillos', '1234567890161', 'Cigarrillos de distintos tipos', 'PorUnidad', 6.00, 0, 1, 59),
('Camel Cigarrillos', '1234567890162', 'Cigarrillos de alta calidad', 'PorUnidad', 6.00, 0, 1, 60),
('Lucky Strike Cigarrillos', '1234567890163', 'Cigarrillos de tabaco rubio', 'PorUnidad', 6.00, 0, 1, 61),
('Duracell Baterías', '1234567890164', 'Baterías de larga duración', 'PorUnidad', 5.00, 0, 1, 62),
('Energizer Pilas', '1234567890165', 'Pilas y baterías de calidad', 'PorUnidad', 5.00, 0, 1, 63),
('GAMA Arroz', '1234567890166', 'Arroz blanco GAMA', 'PorUnidad', 1.50, 0, 1, 21),
('GAMA Frijoles', '1234567890167', 'Frijoles negros GAMA', 'PorUnidad', 2.00, 0, 1, 21),
('GAMA Azúcar', '1234567890168', 'Azúcar refinada GAMA', 'PorUnidad', 1.20, 0, 1, 21),
('GAMA Sal', '1234567890169', 'Sal de mesa GAMA', 'PorUnidad', 0.80, 0, 1, 21),
('GAMA Harina', '1234567890170', 'Harina de trigo GAMA', 'PorUnidad', 1.50, 0, 1, 21),
('GAMA Pasta', '1234567890171', 'Pasta GAMA', 'PorUnidad', 1.80, 0, 1, 21),
('GAMA Leche', '1234567890172', 'Leche en polvo GAMA', 'PorUnidad', 3.50, 0, 1, 21),
('GAMA Café', '1234567890173', 'Café molido GAMA', 'PorUnidad', 4.00, 0, 1, 21),
('GAMA Té', '1234567890174', 'Té negro GAMA', 'PorUnidad', 2.50, 0, 1, 21),
('GAMA Galletas', '1234567890175', 'Galletas de vainilla GAMA', 'PorUnidad', 1.50, 0, 1, 21),
('GAMA Mermelada', '1234567890176', 'Mermelada de fresa GAMA', 'PorUnidad', 2.00, 0, 1, 21),
('GAMA Mantequilla', '1234567890177', 'Mantequilla GAMA', 'PorUnidad', 2.50, 0, 1, 21),
('GAMA Queso', '1234567890178', 'Queso blanco GAMA', 'PorUnidad', 3.00, 0, 1, 21),
('GAMA Yogur', '1234567890179', 'Yogur natural GAMA', 'PorUnidad', 1.80, 0, 1, 21),
('GAMA Helado', '1234567890180', 'Helado de vainilla GAMA', 'PorUnidad', 3.50, 0, 1, 21),
('GAMA Jugo', '1234567890181', 'Jugo de naranja GAMA', 'PorUnidad', 2.00, 0, 1, 21),
('GAMA Refresco', '1234567890182', 'Refresco de cola GAMA', 'PorUnidad', 1.50, 0, 1, 21),
('GAMA Agua', '1234567890183', 'Agua mineral GAMA', 'PorUnidad', 1.00, 0, 1, 21),
('GAMA Vino', '1234567890184', 'Vino tinto GAMA', 'PorUnidad', 10.00, 0, 1, 21),
('GAMA Cerveza', '1234567890185', 'Cerveza GAMA', 'PorUnidad', 2.00, 0, 1, 21);

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

INSERT INTO Proveedor (RIF, nombre, contacto, telefono, correo, ciudadId) VALUES
('J-36290482-7', 'Peres, Arevalo y Huerta', 'Lic. Leticia Madrigal', '593.824.2194x892', 'berta15@peres-huerta.com', 1),
('J-41878716-1', 'Valencia y Campos S.A. de C.V.', 'Ignacio Flores', '(778)408-0160x9753', 'andrea39@valencia-cv.com', 2),
('J-48801947-2', 'Grupo Collado y Tórrez', 'Aurora Blanco', '1-871-484-1858', 'salvadortrujillo@grupo-tórrez.com', 3),
('J-47308641-6', 'Club Bustos, Ybarra y Olmos', 'René Fabiola López Enríquez', '1-209-471-1220', 'toledojulio-cesar@club-olmos.com', 4),
('J-13693291-8', 'Industrias Gracia, Galván y Villalpando', 'Ricardo Laureano', '1-751-591-7953x304', 'garayjose-emilio@industrias-villalpando.com', 5),
('J-59306073-4', 'Corporacin Polanco-Bañuelos', 'Clemente Gaona Armenta', '1-891-013-9916x1510', 'esquiveldulce-maria@corporacin-polanco-bañuelos.com', 6),
('J-46016413-4', 'Roque-Gaitán', 'Agustín Tovar Pizarro', '141.314.5620x8709', 'ornelaselvira@roque-gaitán-roque-gaitán.com', 7),
('J-31253144-7', 'Corporacin Rodrígez, Vargas y de la O', 'Ana Luisa Zoé Covarrubias', '(584)197-2076', 'violeta56@corporacin-o.com', 8),
('J-94287260-4', 'Grupo Valentín, Alcala y Reyna', 'Israel Armenta Tovar', '237-594-5992', 'julia61@grupo-reyna.com', 9),
('J-62175296-5', 'Villegas S.A.', 'Cristobal Evelio Garica Ramos', '960-696-0271x427', 'mvalentin@villegas-sa.com', 10),
('J-75793104-9', 'Arellano S.C.', 'Hugo Mayte Arteaga Pelayo', '1-812-066-5030', 'tafoyasara@arellano-sc.com', 11),
('J-19296046-7', 'Espino-Casanova', 'Dr. Hermelinda Lemus', '1-217-610-4714x28512', 'aida00@espino-casanova.com', 12),
('J-40980125-5', 'Laboratorios Huerta y Valdez', 'Josefina Raquel Arias Zúñiga', '776-582-3694x02245', 'jose-carlos15@laboratorios-valdez.com', 13),
('J-77064947-4', 'Arguello S.A. de C.V.', 'Conchita Rodolfo Longoria', '682.417.3042', 'madridkarina@arguello-cv.com', 14),
('J-75187451-5', 'Luna-Pedroza A.C.', 'Ramiro Rosales Rojo', '1-517-176-0452', 'socorrovallejo@luna-pedroza-ac.com', 15),
('J-32915846-5', 'Brito, Barraza y Bravo', 'Estela Anel Olmos', '+16(8)8477936153', 'rocio26@brito-bravo.com', 16),
('J-68635943-9', 'Corporacin Carrero y Barela', 'Olivia Razo Ferrer', '07643039213', 'xochoa@corporacin-barela.com', 17),
('J-29449419-9', 'Despacho Ybarra-Saavedra', 'Ramón Leticia Piña', '757-738-9305x5508', 'franciscozavala@despacho-ybarra-saavedra.com', 18),
('J-95203267-5', 'Proyectos Ojeda-Verduzco', 'Mariano Andrés Bravo Sevilla', '+13(2)0407522758', 'gtamayo@proyectos-ojeda-verduzco.com', 19),
('J-59912829-0', 'Vela A.C.', 'Ing. Araceli Polanco', '1-489-676-9930', 'echeverriahermelinda@vela-ac.com', 20),
('J-74354097-4', 'Corporacin Barraza, Salcido y Iglesias', 'Lorenzo Juan Carlos Olivera Bañuelos', '(234)500-7627', 'coronadojesus@corporacin-iglesias.com', 21),
('J-74957809-9', 'Aranda, Robledo y Olvera', 'Amanda Campos', '200.992.5185x367', 'balderassantiago@aranda-olvera.com', 22),
('J-25657665-7', 'Miranda y Castellanos e Hijos', 'Mtro. Carolina Ontiveros', '(183)067-5375', 'armendarizalfredo@miranda-hijos.com', 23),
('J-55468268-4', 'Herrera y Amador S. R.L. de C.V.', 'Ing. Esmeralda Godínez', '08868412696', 'cantulinda@herrera-cv.com', 24),
('J-22962012-5', 'Camacho-Pelayo', 'Alta  Gracia Marisela Prado', '(607)541-5115x05520', 'josefinabatista@camacho-pelayo-camacho-pelayo.com', 25),
('J-25379386-8', 'Grupo Acosta-Flores', 'Abraham Lozada Negrete', '1-093-227-1754x20355', 'sloya@grupo-acosta-flores.com', 26),
('J-28441165-5', 'Enríquez-Villaseñor A.C.', 'Oswaldo Vera Manzanares', '(622)358-3324', 'lourdes02@enríquez-villaseñor-ac.com', 27),
('J-24872932-9', 'Orta A.C.', 'César Peres Luna', '(629)645-1375x8066', 'peralesines@orta-ac.com', 28),
('J-75021853-5', 'Figueroa y Nieto S.A. de C.V.', 'Aurora Escalante', '04189276266', 'fernandorendon@figueroa-cv.com', 29),
('J-46546487-9', 'Solorzano-Collado S.A. de C.V.', 'Susana Briseño', '340.797.0341x489', 'luzrodriguez@solorzano-collado-cv.com', 30),
('J-75265543-2', 'Salinas-Gómez', 'Lic. Gilberto Alonzo', '04004689671', 'joaquin43@salinas-gómez.com', 31),
('J-18126178-1', 'Aranda-Batista', 'Hilda Oswaldo Molina Casanova', '321-644-8298x3816', 'sleiva@aranda-batista.com', 32),
('J-41776444-1', 'Nieto y Vanegas e Hijos', 'Cristina Carlota Casárez', '697-284-5763x778', 'miguel07@nieto-hijos.com', 33),
('J-95168380-1', 'Grupo Saldivar, Ávila y Galván', 'Joaquín Rodríguez Ornelas', '+81(1)6050190443', 'renatoloera@grupo-galván.com', 34),
('J-65566296-5', 'Despacho Puente y Rincón', 'Juan Carlos Darío Menéndez Pérez', '627-285-2327x56676', 'elsaquinones@despacho-rincón.com', 35),
('J-96806686-5', 'Industrias Arroyo y Oquendo', 'Eugenia Bravo Escobar', '023.949.1845', 'dreynoso@industrias-oquendo.com', 36),
('J-66595453-0', 'Vera, Rentería y Saiz', 'Martín Esmeralda Miranda Jáquez', '+00(2)5040216396', 'maria-elenaespinoza@vera,-saiz.com', 37),
('J-63318256-6', 'Zúñiga-Canales S. R.L. de C.V.', 'Indira Medrano Tello', '1-540-803-5138x533', 'zacarias44@zúñiga-canales-cv.com', 38),
('J-80604392-1', 'Hernández, Rosario y Montañez', 'Alvaro Hilda Urías', '00777067771', 'bonillafabiola@hernándezmontañez.com', 39),
('J-89342741-8', 'Corrales-Pedraza', 'Marcos Sara Bermúdez', '(860)237-3245x561', 'santiago83@corrales-pedraza-corrales-pedraza.com', 40),
('J-33960570-5', 'Proyectos Quintanilla, Serrano y Zedillo', 'Omar Ibarra', '301-912-6334', 'tellonoelia@proyectos-zedillo.com', 41),
('J-43281222-1', 'Arroyo, Casas y Olivo', 'Caridad Raúl Muñoz Godínez', '(843)318-4535x74922', 'uribenatalia@arroyo-olivo.com', 42),
('J-83246736-2', 'Navarro-Vigil e Hijos', 'Catalina Ortiz Correa', '(812)379-3323', 'mmorales@navarro-vigil-hijos.com', 43),
('J-55289503-0', 'Laboratorios Samaniego-Cardenas', 'Sr(a). Olivia Ybarra', '774.038.2778', 'arcelia42@laboratorios-samaniego-cardenas.com', 44),
('J-95426867-5', 'Espino, Mateo y Lovato', 'Ana María Frías', '+53(5)7345240598', 'coronajesus@espino-lovato.com', 45),
('J-12198615-4', 'Salas e Hijos', 'Alberto Guardado Armenta', '+35(1)0562376254', 'violetamendez@salas-hijos.com', 46),
('J-42993532-0', 'Olivas, Aguirre y Parra', 'Oswaldo Óscar Ríos Arguello', '1-166-208-2982x1532', 'agustinde-la-garza@olivas-parra.com', 47),
('J-48973411-5', 'Laboratorios Berríos-Ponce', 'Sr(a). Silvano Reyna', '1-299-045-6007x15427', 'natividadmoya@laboratorios-berríos-ponce.com', 48),
('J-15522341-3', 'Laboratorios Palacios-Miranda', 'Miguel Laura Alejandro Márquez', '487-089-8407x6165', 'bavalos@laboratorios-palacios-miranda.com', 49),
('J-40851745-2', 'Laboratorios Aragón, Hernández y Verdugo', 'Emilio Óliver Sevilla Molina', '431-953-9852x250', 'vallejocristal@laboratorios-verdugo.com', 50),
('J-15262322-0', 'Naranjo-Lovato e Hijos', 'Irene Miguel Ángel Páez Zaragoza', '(202)907-2507x493', 'ulloaluz@naranjo-lovato-hi.com', 51),
('J-68156493-6', 'Proyectos Delgado, Tamayo y de la O', 'Victoria Cotto Venegas', '08896644406', 'francisco-javier88@proyectos-ov.com', 52),
('J-53218349-5', 'Monroy-Espinal e Hijos', 'Claudia Aguayo', '296-570-8693x0582', 'susanamoreno@monroy-espinal.com', 53),
('J-31347016-4', 'Almaraz y Haro S. R.L. de C.V.', 'Gerardo Dulce María Peres', '09737813271', 'rortega@almaraz-cv.com', 54),
('J-37362135-5', 'Club Moya, Menchaca y Bustamante', 'Alta  Gracia Miguel Alba Henríquez', '1-666-609-7592', 'itzel06@club-bustamante.com', 55),
('J-56849038-7', 'Solorio y Cervántez A.C.', 'Raúl Montenegro Muro', '+13(1)8705056246', 'rosariocordero@solorio-ac.com', 56),
('J-10912836-3', 'Malave, Segura y Balderas', 'Carmen Cecilia Rosales', '1-080-862-5911x82434', 'flavio48@malave,-balderas.com', 57),
('J-89245907-3', 'Correa y Rangel S. R.L. de C.V.', 'Alfonso Susana Vigil', '(805)137-9378', 'isabelacervantez@correa-cv.com', 58),
('J-97951432-3', 'Valadez y Báez S. R.L. de C.V.', 'Norma Montalvo Acevedo', '01695975685', 'chaconilse@valadez-cv.com', 59),
('J-36326432-3', 'Echeverría e Hijos', 'Aida Iván Zúñiga', '1-060-460-9251', 'cayala@echeverría-hijos.com', 60),
('J-76785587-9', 'Zayas-Herrera e Hijos', 'Ramón María Elena Paz Durán', '+74(3)6151105026', 'medranomaria-eugenia@zayas-herrera-hijos.com', 61),
('J-98934646-8', 'Rolón y Blanco y Asociados', 'Omar Padilla Iglesias', '+81(1)5517028400', 'kmiranda@rolón-asociados.com', 62),
('J-62020724-9', 'Grupo Delgado-Covarrubias', 'Sofía Isaac Alva', '603.345.2353x267', 'raul26@grupo-delgado-covarrubias.com', 63),
('J-40581316-9', 'Curiel S. R.L. de C.V.', 'Julio de León Córdova', '+05(8)0001992260', 'kpulido@curiel-cv.com', 64),
('J-26437392-5', 'Gutiérrez-Chavarría S.A. de C.V.', 'Dr. Oswaldo Pabón', '02695166376', 'leonardogrijalva@gutiérrez-chavarría-cv.com', 65);


INSERT INTO Carrito (clienteId, productoId, fechaAgregado, cantidad, precioPor)
VALUES 
(1, 1, '2024-11-06', 2, 1.50),
(1, 2, '2024-11-06', 1, 1.40),
(1, 3, '2024-11-06', 3, 0.80),

(2, 4, '2024-10-30', 1, 0.90),
(2, 5, '2024-10-30', 2, 2.50),
(2, 6, '2024-10-30', 1, 1.20),

(3, 7, '2025-01-01', 1, 3.00),
(3, 8, '2025-01-01', 1, 2.20),
(3, 9, '2025-01-01', 3, 1.30),

(4, 10, '2025-01-02', 2, 1.30),
(4, 11, '2025-01-02', 1, 1.70),
(4, 12, '2025-01-02', 1, 1.50),

(5, 13, '2025-03-03', 1, 0.50),
(5, 14, '2025-03-03', 2, 1.80),
(5, 15, '2025-03-03', 2, 2.50),

(6, 1, '2024-10-30', 2, 1.50),
(6, 2, '2024-10-30', 3, 1.40),
(6, 3, '2024-10-30', 1, 0.80),

(7, 4, '2024-10-02', 1, 0.90), 
(7, 5, '2024-10-02', 2, 2.50),
(7, 6, '2024-10-02', 2, 1.20),

(8, 7, '2025-01-03', 1, 3.00),
(8, 8, '2025-01-03', 1, 2.20),
(8, 9, '2025-01-03', 3, 1.30),

(9, 10, '2024-07-02', 2, 1.30), 
(9, 11, '2024-07-02', 1, 1.70),
(9, 12, '2024-07-02', 2, 1.50),

(10, 13, '2025-02-16', 1, 0.50), 
(10, 14, '2025-02-16', 2, 1.80),
(10, 15, '2025-02-16', 2, 2.50),

(11, 1, '2025-01-15', 2, 1.50), 
(11, 2, '2025-01-15', 1, 1.40),
(11, 3, '2025-01-15', 3, 0.80),

(12, 4, '2025-02-01', 1, 0.90), 
(12, 5, '2025-02-01', 2, 2.50),
(12, 6, '2025-02-01', 1, 1.20),

(13, 7, '2025-01-21', 1, 3.00), 
(13, 8, '2025-01-21', 1, 2.20),
(13, 9, '2025-01-21', 3, 1.30),

(14, 10, '2025-03-15', 2, 1.30), 
(14, 11, '2025-03-15', 1, 1.70),
(14, 12, '2025-03-15', 2, 1.50),

(15, 13, '2024-05-23', 1, 0.50),
(15, 14, '2024-05-23', 2, 1.80),
(15, 15, '2024-05-23', 2, 2.50),

(16, 16, '2025-10-12', 1, 2.50),
(16, 17, '2025-10-12', 1, 4.00),
(16, 18, '2025-10-12', 1, 5.50),

(17, 19, '2024-11-15', 2, 1.00),
(17, 20, '2024-11-15', 2, 1.50),
(17, 21, '2024-11-15', 3, 3.00),

(18, 1, '2025-03-03', 2, 1.50),
(18, 2, '2025-03-03', 1, 1.40),
(18, 3, '2025-03-03', 3, 0.80),

(19, 4, '2025-03-13', 1, 0.90),
(19, 5, '2025-03-13', 2, 2.50),
(19, 6, '2025-03-13', 1, 1.20),

(20, 7, '2025-03-16', 1, 3.00), 
(20, 8, '2025-03-16', 1, 2.20),
(20, 9, '2025-03-16', 3, 1.30),

(21, 10, '2024-07-01', 2, 1.30),
(21, 11, '2024-07-01', 1, 1.70),
(21, 12, '2024-07-01', 2, 1.50),

(22, 13, '2025-02-17', 1, 0.50),
(22, 14, '2025-02-17', 2, 1.80),
(22, 15, '2025-02-17', 2, 2.50),

(23, 16, '2025-01-20', 1, 2.50),
(23, 17, '2025-01-20', 1, 4.00),
(23, 18, '2025-01-20', 1, 5.50),

(24, 19, '2024-12-01', 2, 1.00),
(24, 20, '2024-12-01', 2, 1.50),
(24, 21, '2024-12-01', 3, 3.00),

(25, 1, '2024-07-13', 2, 1.50),
(25, 2, '2024-07-13', 1, 1.40),
(25, 3, '2024-07-13', 3, 0.80),

(26, 4, '2025-04-09', 1, 0.90),
(26, 5, '2025-04-09', 2, 2.50),
(26, 6, '2025-04-09', 1, 1.20),

(27, 7, '2025-01-05', 1, 3.00), 
(27, 8, '2025-01-05', 1, 2.20),
(27, 9, '2025-01-05', 3, 1.30),

(28, 10, '2024-05-25', 2, 1.30),
(28, 11, '2024-05-25', 1, 1.70),
(28, 12, '2024-05-25', 2, 1.50),

(29, 13, '2024-11-16', 1, 0.50),
(29, 14, '2024-11-16', 2, 1.80),
(29, 15, '2024-11-16', 2, 2.50),

(30, 16, '2025-09-10', 1, 2.50),
(30, 17, '2025-09-10', 1, 4.00),
(30, 18, '2025-09-10', 1, 5.50);


--SELECT * From Cliente;
--SELECT * From TipoEnvio;
--SELECT * From FormaPago;
--SELECT * From Cargo;
--SELECT * From Marca;
--SELECT * From Categoria;
--SELECT * From Pais;
--SELECT * From Ciudad;
