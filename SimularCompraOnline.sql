--Se procesa la compra de 30 clientes PROCEDIMIENTO A

EXEC SimularCompraOnline @clienteId = 1, @tipoEnvioId = 2, @metodoPagoId = 1;

EXEC SimularCompraOnline @clienteId = 2, @tipoEnvioId = 1, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 3, @tipoEnvioId = 5, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 4, @tipoEnvioId = 2, @metodoPagoId = 5;

EXEC SimularCompraOnline @clienteId = 5, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 6, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 7, @tipoEnvioId = 4, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 8, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 9, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 10, @tipoEnvioId = 2, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 11, @tipoEnvioId = 5, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 12, @tipoEnvioId = 1, @metodoPagoId = 1;

EXEC SimularCompraOnline @clienteId = 13, @tipoEnvioId = 4, @metodoPagoId = 7;

EXEC SimularCompraOnline @clienteId = 14, @tipoEnvioId = 4, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 15, @tipoEnvioId = 5, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 16, @tipoEnvioId = 2, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 17, @tipoEnvioId = 5, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 18, @tipoEnvioId = 1, @metodoPagoId = 1;

EXEC SimularCompraOnline @clienteId = 19, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 20, @tipoEnvioId = 1, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 21, @tipoEnvioId = 5, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 22, @tipoEnvioId = 1, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 23, @tipoEnvioId = 4, @metodoPagoId = 7;

EXEC SimularCompraOnline @clienteId = 24, @tipoEnvioId = 2, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 25, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 26, @tipoEnvioId = 4, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 27, @tipoEnvioId = 3, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 28, @tipoEnvioId = 2, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 29, @tipoEnvioId = 1, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 30, @tipoEnvioId = 5, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 91, @tipoEnvioId = 1, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 92, @tipoEnvioId = 5, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 93, @tipoEnvioId = 1, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 94, @tipoEnvioId = 4, @metodoPagoId = 7;

EXEC SimularCompraOnline @clienteId = 95, @tipoEnvioId = 2, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 96, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 97, @tipoEnvioId = 4, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 98, @tipoEnvioId = 3, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 98, @tipoEnvioId = 2, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 99, @tipoEnvioId = 1, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 100, @tipoEnvioId = 5, @metodoPagoId = 2;

INSERT INTO Carrito (clienteId, productoId, fechaAgregado, cantidad, precioPor) --Volvemos a llenar el carrito pero con fechas distintas
VALUES 
(1, 1, '2024-12-06', 2, 1.50),
(1, 2, '2024-12-06', 1, 1.40),
(1, 3, '2024-12-06', 3, 0.80),

(2, 4, '2024-12-30', 1, 0.90),
(2, 5, '2024-12-30', 2, 2.50),
(2, 6, '2024-12-30', 1, 1.20),

(3, 7, '2025-02-01', 1, 3.00),
(3, 8, '2025-02-01', 1, 2.20),
(3, 9, '2025-02-01', 3, 1.30),

(4, 10, '2025-01-04', 2, 1.30),
(4, 11, '2025-01-04', 1, 1.70),
(4, 12, '2025-01-04', 1, 1.50),

(5, 13, '2025-03-05', 1, 0.50),
(5, 14, '2025-03-05', 2, 1.80),
(5, 15, '2025-03-05', 2, 2.50),

(6, 1, '2024-12-30', 2, 1.50),
(6, 2, '2024-12-30', 3, 1.40),
(6, 3, '2024-12-30', 1, 0.80),

(7, 4, '2025-01-02', 1, 0.90), 
(7, 5, '2025-01-02', 2, 2.50),
(7, 6, '2025-01-02', 2, 1.20),

(8, 7, '2025-03-03', 1, 3.00),
(8, 8, '2025-03-03', 1, 2.20),
(8, 9, '2025-03-03', 3, 1.30),

(9, 10, '2024-07-05', 2, 1.30), 
(9, 11, '2024-07-05', 1, 1.70),
(9, 12, '2024-07-05', 2, 1.50),

(10, 13, '2025-02-19', 1, 0.50), 
(10, 14, '2025-02-19', 2, 1.80),
(10, 15, '2025-02-19', 2, 2.50),
(10, 11, '2025-02-19', 2, 1.70),
(10, 12, '2025-02-19', 2, 1.50),

(11, 1, '2025-03-15', 2, 1.50), 
(11, 2, '2025-03-15', 1, 1.40),
(11, 3, '2025-03-15', 3, 0.80),

(12, 4, '2025-02-14', 1, 0.90), 
(12, 5, '2025-02-14', 2, 2.50),
(12, 6, '2025-02-14', 1, 1.20),

(13, 7, '2025-01-27', 1, 3.00), 
(13, 8, '2025-01-27', 1, 2.20),
(13, 9, '2025-01-27', 3, 1.30),

(14, 10, '2025-04-15', 2, 1.30), 
(14, 11, '2025-04-15', 1, 1.70),
(14, 12, '2025-04-15', 2, 1.50),

(15, 13, '2025-03-23', 1, 0.50),
(15, 14, '2025-03-23', 2, 1.80),
(15, 15, '2025-03-23', 2, 2.50),

(16, 16, '2025-11-12', 1, 2.50),
(16, 17, '2025-11-12', 1, 4.00),
(16, 18, '2025-11-12', 1, 5.50),

(17, 19, '2025-01-15', 2, 1.00),
(17, 20, '2025-01-15', 2, 1.50),
(17, 21, '2025-01-15', 3, 3.00),

(18, 1, '2025-03-13', 2, 1.50),
(18, 2, '2025-03-13', 1, 1.40),
(18, 3, '2025-03-13', 3, 0.80),

(19, 4, '2025-04-13', 1, 0.90),
(19, 5, '2025-04-13', 2, 2.50),
(19, 6, '2025-04-13', 1, 1.20),

(20, 7, '2025-05-16', 1, 3.00), 
(20, 8, '2025-05-16', 1, 2.20),
(20, 9, '2025-05-16', 3, 1.30);


--Vaciamos los carritos 
EXEC SimularCompraOnline @clienteId = 1, @tipoEnvioId = 2, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 2, @tipoEnvioId = 1, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 3, @tipoEnvioId = 5, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 4, @tipoEnvioId = 2, @metodoPagoId = 5;

EXEC SimularCompraOnline @clienteId = 5, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 6, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 7, @tipoEnvioId = 4, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 8, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 9, @tipoEnvioId = 5, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 10, @tipoEnvioId = 2, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 11, @tipoEnvioId = 5, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 12, @tipoEnvioId = 1, @metodoPagoId = 1;

EXEC SimularCompraOnline @clienteId = 13, @tipoEnvioId = 4, @metodoPagoId = 7;

EXEC SimularCompraOnline @clienteId = 14, @tipoEnvioId = 4, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 15, @tipoEnvioId = 5, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 16, @tipoEnvioId = 2, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 17, @tipoEnvioId = 5, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 18, @tipoEnvioId = 1, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 19, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 20, @tipoEnvioId = 1, @metodoPagoId = 8;

INSERT INTO Carrito (clienteId, productoId, fechaAgregado, cantidad, precioPor) --Volvemos a llenar el carrito pero con fechas distintas
VALUES 
(14, 10, '2025-04-17', 2, 1.30), 
(14, 11, '2025-04-17', 1, 1.70),
(14, 12, '2025-04-17', 2, 1.50),

(15, 13, '2025-04-23', 1, 0.50),
(15, 14, '2025-04-23', 2, 1.80),
(15, 15, '2025-04-23', 2, 2.50),

(16, 16, '2025-12-12', 1, 2.50),
(16, 17, '2025-12-12', 1, 4.00),
(16, 18, '2025-12-12', 1, 5.50),

(17, 19, '2025-01-18', 2, 1.00),
(17, 20, '2025-01-18', 2, 1.50),
(17, 21, '2025-01-18', 3, 3.00),

(18, 1, '2025-04-13', 2, 1.50),
(18, 2, '2025-04-13', 1, 1.40),
(18, 3, '2025-04-13', 3, 0.80),

(19, 4, '2025-04-15', 1, 0.90),
(19, 5, '2025-04-15', 2, 2.50),
(19, 6, '2025-04-15', 1, 1.20),

(20, 7, '2025-05-18', 1, 3.00), 
(20, 8, '2025-05-18', 1, 2.20),
(20, 9, '2025-05-18', 3, 1.30);

EXEC SimularCompraOnline @clienteId = 14, @tipoEnvioId = 4, @metodoPagoId = 6;

EXEC SimularCompraOnline @clienteId = 15, @tipoEnvioId = 5, @metodoPagoId = 4;

EXEC SimularCompraOnline @clienteId = 16, @tipoEnvioId = 2, @metodoPagoId = 2;

EXEC SimularCompraOnline @clienteId = 17, @tipoEnvioId = 5, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 18, @tipoEnvioId = 1, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 19, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 20, @tipoEnvioId = 1, @metodoPagoId = 8;


INSERT INTO Carrito (clienteId, productoId, fechaAgregado, cantidad, precioPor) --Volvemos a llenar el carrito pero con fechas distintas
VALUES 
(1, 1, '2024-12-09', 2, 1.50),
(1, 2, '2024-12-09', 1, 1.40),
(1, 3, '2024-12-09', 3, 0.80),

(2, 4, '2025-01-30', 1, 0.90),
(2, 5, '2025-01-30', 2, 2.50),
(2, 6, '2025-01-30', 1, 1.20),

(3, 7, '2025-02-05', 1, 3.00),
(3, 8, '2025-02-05', 1, 2.20),
(3, 9, '2025-02-05', 3, 1.30),

(4, 10, '2025-01-08', 2, 1.30),
(4, 11, '2025-01-08', 1, 1.70),
(4, 12, '2025-01-08', 1, 1.50),

(5, 13, '2025-03-14', 1, 0.50),
(5, 14, '2025-03-14', 2, 1.80),
(5, 15, '2025-03-14', 2, 2.50),

(6, 1, '2025-02-28', 2, 1.50),
(6, 2, '2025-02-28', 3, 1.40),
(6, 3, '2025-02-28', 1, 0.80),

(7, 4, '2025-01-19', 1, 0.90), 
(7, 5, '2025-01-19', 2, 2.50),
(7, 6, '2025-01-19', 2, 1.20),

(8, 7, '2025-03-17', 1, 3.00),
(8, 8, '2025-03-17', 1, 2.20),
(8, 9, '2025-03-17', 3, 1.30),

(9, 10, '2024-07-29', 2, 1.30), 
(9, 11, '2024-07-29', 1, 1.70),
(9, 12, '2024-07-29', 2, 1.50),

(10, 13, '2025-03-19', 1, 0.50), 
(10, 14, '2025-03-19', 2, 1.80),
(10, 15, '2025-03-19', 2, 2.50),
(10, 11, '2025-03-19', 2, 1.70),
(10, 12, '2025-03-19', 2, 1.50);

EXEC SimularCompraOnline @clienteId = 1, @tipoEnvioId = 2, @metodoPagoId = 1;

EXEC SimularCompraOnline @clienteId = 2, @tipoEnvioId = 1, @metodoPagoId = 3;

EXEC SimularCompraOnline @clienteId = 3, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 4, @tipoEnvioId = 2, @metodoPagoId = 5;

EXEC SimularCompraOnline @clienteId = 5, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 6, @tipoEnvioId = 5, @metodoPagoId = 7;

EXEC SimularCompraOnline @clienteId = 7, @tipoEnvioId = 4, @metodoPagoId = 10;

EXEC SimularCompraOnline @clienteId = 8, @tipoEnvioId = 3, @metodoPagoId = 9;

EXEC SimularCompraOnline @clienteId = 9, @tipoEnvioId = 5, @metodoPagoId = 8;

EXEC SimularCompraOnline @clienteId = 10, @tipoEnvioId = 2, @metodoPagoId = 6;

--Esto porque necesitamos que haya clientes con mas de 3 compras distintas de un mismo producto para que se pueda usar la tabla de ProductoRecomendadoCliente