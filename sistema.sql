USE restaurante;


INSERT INTO usuarios (nombre, correo, contrasena, tipo) VALUES
('Laura Sanchez', 'laura@gmail.com', 'laura123', 'CLIENTE'),
('Andres Torres', 'andres@gmail.com', 'andres456', 'CLIENTE'),
('Valentina Rios', 'vale@gmail.com', 'vale789', 'CLIENTE'),
('Santiago Mora', 'santi@gmail.com', 'santi321', 'CLIENTE'),
('Daniela Castro', 'dani@gmail.com', 'dani654', 'CLIENTE'),
('Felipe Vargas', 'felipe@gmail.com', 'felipe987', 'CLIENTE'),
('Isabella Ruiz', 'isa@gmail.com', 'isa111', 'CLIENTE'),
('Camilo Herrera', 'camilo@gmail.com', 'camilo222', 'CLIENTE'),
('Sofia Mendoza', 'sofia@gmail.com', 'sofia333', 'CLIENTE'),
('Miguel Angel', 'miguel@gmail.com', 'miguel444', 'CLIENTE'),
('Carlos Admin2', 'admin2@restaurante.com', 'admin456', 'ADMINISTRADOR');


INSERT INTO productos (nombre, precio, descripcion, disponible) VALUES
('Sobrebarriga', 28000, 'Carne de res en salsa criolla con papas', TRUE),
('Cazuela de Mariscos', 35000, 'Cazuela con camarones, calamares y mejillones', TRUE),
('Empanadas x3', 9000, 'Empanadas de pipian fritas crujientes', TRUE),
('Chocolate Caliente', 6000, 'Chocolate santafereño con queso', TRUE),
('Cerveza Club Colombia', 8000, 'Cerveza rubia nacional 330ml', TRUE),
('Agua Cristal', 4000, 'Agua mineral 600ml', TRUE),
('Torta de Choclo', 15000, 'Torta dulce de maiz tierno', TRUE),
('Tamales Tolimenses', 18000, 'Tamales tradicionales del Tolima', TRUE),
('Fritanga Mixta', 32000, 'Chicharron, morcilla, chorizo y papa criolla', TRUE),
('Caldo de Costilla', 14000, 'Caldo tradicional santafereño', TRUE),
('Arequipe con Brevas', 11000, 'Postre tipico colombiano', TRUE),
('Jugo de Maracuya', 8000, 'Jugo natural de maracuya', TRUE);

INSERT INTO pedidos (id_cliente, estado, tiempo_estimado, total) VALUES
(6,  'ENTREGADO',    14, 43000),
(7,  'ENTREGADO',    11, 29000),
(8,  'ENTREGADO',    17, 57000),
(9,  'CANCELADO',     8, 18000),
(10, 'ENTREGADO',    14, 46000),
(11, 'EN PREPARACION', 11, 37000),
(12, 'PENDIENTE',    20, 62000),
(2,  'ENTREGADO',    14, 36000),
(3,  'ENTREGADO',    11, 28000),
(4,  'ENTREGADO',    17, 54000),
(5,  'PENDIENTE',    14, 41000),
(6,  'ENTREGADO',    11, 33000),
(7,  'EN PREPARACION', 14, 50000),
(8,  'ENTREGADO',    20, 67000),
(9,  'ENTREGADO',    11, 22000);


INSERT INTO pedido_productos (id_pedido, id_producto) VALUES
(6,  2),  (6,  6),  (6,  8),
(7,  3),  (7,  4),  (7, 12),
(8,  9),  (8,  5),  (8,  6),  (8, 11),
(9,  2),
(10, 1),  (10, 3),  (10, 5),  (10, 6),
(11, 4),  (11, 7),  (11, 12),
(12, 9),  (12, 10), (12, 11), (12, 13), (12, 14),
(13, 1),  (13, 6),  (13, 3),
(14, 2),  (14, 12),
(15, 1),  (15, 4),  (15, 5),  (15, 6),  (15, 8),
(16, 3),  (16, 7),  (16, 12),
(17, 9),  (17, 5),  (17, 6),
(18, 1),  (18, 9),  (18, 10), (18, 11), (18, 13),
(19, 2),  (19, 6),
(20, 3),  (20, 4),  (20, 12);


INSERT INTO pagos (id_pedido, monto, metodo_pago, estado) VALUES
(6,  43000, 'TARJETA',       'PAGADO'),
(7,  29000, 'EFECTIVO',      'PAGADO'),
(8,  57000, 'TRANSFERENCIA', 'PAGADO'),
(9,  18000, 'EFECTIVO',      'CANCELADO'),
(10, 46000, 'TARJETA',       'PAGADO'),
(11, 37000, 'EFECTIVO',      'PENDIENTE'),
(12, 62000, 'TARJETA',       'PENDIENTE'),
(13, 36000, 'TRANSFERENCIA', 'PAGADO'),
(14, 28000, 'EFECTIVO',      'PAGADO'),
(15, 54000, 'TARJETA',       'PAGADO'),
(16, 41000, 'EFECTIVO',      'PENDIENTE'),
(17, 33000, 'TRANSFERENCIA', 'PAGADO'),
(18, 50000, 'TARJETA',       'PENDIENTE'),
(19, 67000, 'EFECTIVO',      'PAGADO'),
(20, 22000, 'TRANSFERENCIA', 'PAGADO');

show tables;

SELECT * FROM productos;

SELECT p.id, u.nombre, p.estado, p.total, p.fecha_hora
FROM pedidos p
JOIN usuarios u ON p.id_cliente = u.id;

SELECT p.id AS id_pedido, pr.nombre AS producto, pr.precio
FROM pedidos p
JOIN pedido_productos pp ON p.id = pp.id_pedido
JOIN productos pr ON pp.id_producto = pr.id;

SELECT pa.id, u.nombre, pa.monto, pa.metodo_pago, pa.estado, pa.fecha
FROM pagos pa
JOIN pedidos pe ON pa.id_pedido = pe.id
JOIN usuarios u ON pe.id_cliente = u.id;

SELECT DATE(fecha_hora) AS fecha, SUM(total) AS total_ventas
FROM pedidos
GROUP BY DATE(fecha_hora);
