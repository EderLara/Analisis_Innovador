CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2)
);

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    correo VARCHAR(255)
);

CREATE TABLE agente (
    id_agente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    cargo VARCHAR(255)
);

CREATE TABLE tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    ubicacion VARCHAR(255)
);

CREATE TABLE modo_pago (
    id_modo_pago INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255)
);

CREATE TABLE registro (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    fecha VARCHAR(255),
    id_producto INT,
    id_cliente INT,
    id_agente INT,
    id_tienda INT,
    id_modo_pago INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_agente) REFERENCES agente(id_agente),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_modo_pago) REFERENCES modo_pago(id_modo_pago)
);

INSERT INTO cliente (nombre, correo) VALUES
('Juan Pérez', 'juan.perez@email.com'),
('Ana Gómez', 'ana.gomez@email.com'),
('Carlos Ruiz', 'carlos.ruiz@email.com'),
('Laura Torres', 'laura.torres@email.com'),
('Marta Sánchez', 'marta.sanchez@email.com'),
('Alberto Ramírez', 'alberto.ramirez@email.com'),
('Rocío Ortega', 'rocio.ortega@email.com'),
('Iván Castillo', 'ivan.castillo@email.com'),
('Lucía Vargas', 'lucia.vargas@email.com'),
('Pedro Jiménez', 'pedro.jimenez@email.com'),
('Valeria Moreno', 'valeria.moreno@email.com'),
('José Mejía', 'jose.mejia@email.com'),
('Sofía Lozano', 'sofia.lozano@email.com'),
('Miguel Pardo', 'miguel.pardo@email.com'),
('Carmen Pina', 'carmen.pina@email.com'),
('Pablo Gil', 'pablo.gil@email.com'),
('Teresa Díaz', 'teresa.diaz@email.com'),
('Diego Álvarez', 'diego.alvarez@email.com'),
('Olga Cano', 'olga.cano@email.com'),
('Javier Suárez', 'javier.suarez@email.com');

-- Tiendas
INSERT INTO tienda (nombre, ubicacion) VALUES ('Central', 'Av. Principal 101');
INSERT INTO tienda (nombre, ubicacion) VALUES ('Norte', 'Calle 45 #67');
INSERT INTO tienda (nombre, ubicacion) VALUES ('Sur', 'Carrera 23 #10');
INSERT INTO tienda (nombre, ubicacion) VALUES ('Este', 'Diagonal 8 #55');
INSERT INTO tienda (nombre, ubicacion) VALUES ('Oeste', 'Transversal 44 #32');

-- Formas de pago
INSERT INTO modo_pago (tipo) VALUES ('Efectivo');
INSERT INTO modo_pago (tipo) VALUES ('Tarjeta');
INSERT INTO modo_pago (tipo) VALUES ('Transferencia');

-- Vendedores
INSERT INTO agente (nombre, cargo) VALUES ('Mario Linares', 'Supervisor');
INSERT INTO agente (nombre, cargo) VALUES ('Esther Salas', 'Vendedor');
INSERT INTO agente (nombre, cargo) VALUES ('David Muñoz', 'Ejecutivo');
INSERT INTO agente (nombre, cargo) VALUES ('Sandra Vera', 'Promotor');
INSERT INTO agente (nombre, cargo) VALUES ('Julio Parra', 'Vendedor');
INSERT INTO agente (nombre, cargo) VALUES ('Juan Porras', 'Supervisor');
INSERT INTO agente (nombre, cargo) VALUES ('Esther Prada', 'Vendedor');
INSERT INTO agente (nombre, cargo) VALUES ('David Hernadez', 'Vendedor');
INSERT INTO agente (nombre, cargo) VALUES ('Sara Mahecha', 'Vendedor');
INSERT INTO agente (nombre, cargo) VALUES ('Andres Niño', 'Vendedor');

-- Producto 
INSERT INTO producto -- cambiar el nombre de acuerdo a la base de datos
(nombre, descripcion, precio) VALUES
('Cepillo Dental', 'Cepillo de dientes de cerdas suaves', 1544.24),
('Jabón Líquido', 'Jabón líquido antibacterial', 2021.88),
('Papel Higiénico', 'Paquete de 12 rollos', 3622.50),
('Shampoo', 'Shampoo para todo tipo de cabello', 3044.40),
('Pasta Dental', 'Pasta con flúor', 1999.25),
('Desodorante', 'En barra sin aroma', 2635.00),
('Crema Corporal', 'Hidratante para piel seca', 4261.50),
('Toalla Femenina', 'Paquete con 10 unidades', 2497.60),
('Máquina de Afeitar', 'Desechable de doble filo', 1979.25),
('Gel Fijador', 'Fijador de cabello mediano', 1578.20),
('Paquete de Pilas', 'AA de larga duración', 1996.20),
('Fósforos', 'Caja con 100 unidades', 950.40),
('Pan Tajado', 'Paquete de 400g', 1450.10),
('Leche Entera', 'Litro larga vida', 2387.00),
('Azúcar', 'Paquete de 1 kilo', 1214.85),
('Sal Fina', 'Paquete de 500g', 550.44),
('Aceite Vegetal', 'Botella de 1 litro', 3626.70),
('Arroz Blanco', 'Paquete de 1 kilo', 2129.40),
('Atún en Agua', 'Lata de 170g', 1677.95),
('Cereal', 'Maíz hojuelas 300g', 2592.00),
('Café Molido', 'Paquete de 250g', 3355.80),
('Chocolate Instantáneo', 'Porciones solubles 200g', 3240.00),
('Harina de Trigo', 'Paquete de 1 kilo', 1816.50),
('Papel Aluminio', 'Rollo de 10 metros', 1087.90),
('Servilletas', 'Paquete de 100 hojas', 1126.25),
('Jabón en Barra', 'Empaque de 3 unidades', 688.00),
('Detergente Líquido', 'Botella de 900ml', 1944.80),
('Suavizante Textil', 'Lavado intensivo 750ml', 2207.80),
('Limpiador Multiusos', 'Botella de 500ml', 1258.20),
('Desinfectante', 'Botella de 500ml', 1991.60),
('Escoba', 'Cerdas sintéticas', 3598.00),
('Trapero', 'Algodón 1 unidad', 1858.00),
('Baldes', 'Capacidad de 12 litros', 3519.00),
('Guantes de Goma', 'Par para aseo', 1270.50),
('Gas Butano', 'Botella portátil', 5256.00),
('Bolsa Basura', 'Paquete de 30 unidades', 1860.10),
('Esponja Multiusos', 'Paquete de 3', 1017.90),
('Cinta Adhesiva', 'Rollo transparente', 729.30),
('Lapicero', 'Tinta azul', 599.40),
('Lápiz', 'No. 2 escolar', 353.20),
('Cuaderno', '100 hojas rayadas', 1798.20),
('Colores', 'Bolsa de 12 colores', 2466.20),
('Marcador Permanente', 'Negro', 462.40),
('Tijeras', 'De oficina pequeña', 951.60),
('Pegante escolar', 'Tubo de 20g', 637.00),
('Carpeta plástica', 'Oficio', 595.10),
('Calculadora senc.', 'Pantalla básica', 2156.70),
('Zapatilla deportiva', 'Blanca talla 39', 12888.00),
('Camisa Polo', 'Algodón talla M', 5313.30),
('Pantalón Jean', 'Azul oscuro talla 32', 17251.50),
('Medias', 'Pack de 3 pares', 2448.60),
('Reloj pulso', 'Análogo', 7498.40),
('Sombrero', 'Tejido en palma', 2664.00),
('Cinturón', 'Piel sintética', 5654.70),
('Bolso', 'Mediano color negro', 13101.00),
('Mochila escolar', 'Tela resistente', 12286.75),
('Cargador USB', 'Doble salida', 3595.80),
('Audífonos', 'Cableados básicos', 4942.75),
('Lámpara LED', 'Con pilas recargables', 6247.50),
('Regleta eléctrica', '4 tomas', 2565.00),
('Mouse óptico', 'USB', 2105.40),
('Teclado', 'Membrana USB', 4558.30),
('Libreta de notas', 'Pequeña a5', 1117.60),
('Agua embotellada', 'Botella 1.5 litros', 708.70),
('Gaseosa', 'Botella de 2 litros', 1691.20),
('Jugo natural', 'Botella de 1 litro', 1557.70),
('Bebida energética', 'Lata de 250ml', 1909.60),
('Galletas saladas', 'Paquete 6 unidades', 957.50),
('Pan de molde', 'Paquete 24 rebanadas', 1260.00),
('Queso fundido', 'Porciones 300g', 2082.20),
('Jamón cocido', 'Empaque 250g', 2999.50),
('Salchicha', 'Pack de 6 unidades', 2018.40),
('Yogurt', 'Botella 500ml', 739.20),
('Mantequilla', '250g', 2199.45),
('Helado', 'Barril 1 litro', 3210.90),
('Frutas deshidratadas', 'Mix 200g', 1934.10),
('Semillas mixtas', 'Paquete 200g', 1766.40),
('Almendra', 'Paquete 100g', 2952.20),
('Galletitas dulces', 'Pack 12 unidades', 1659.90),
('Paleta', 'Bolsa 20 unidades', 1591.50),
('Caramelos surtidos', 'Bolsa 200g', 2433.20),
('Chocolate barra', 'Barra 100g', 1099.80),
('Rosquillas', 'Bolsa 10 unidades', 1235.25),
('Cereal snack', 'Barra individual', 639.54),
('Tostadas de maíz', 'Bolsa 150g', 1212.90),
('Salsa de tomate', 'Botella 300ml', 614.90),
('Mayonesa', 'Botella 300ml', 840.00),
('Vinagre', 'Botella 350ml', 698.00),
('Mostaza', 'Botella 250ml', 940.50),
('Aceitunas verdes', 'Frasco 200g', 1658.65),
('Encurtidos', 'Frasco 500g', 1397.00),
('Chiles en vinagre', 'Lata 200g', 975.60),
('Sopa instantánea', 'Paquete individual', 625.10),
('Puré de papa', 'Paquete 125g', 1616.00),
('Conserva de atún', 'Lata 120g', 939.60),
('Conserva de melocotón', 'Lata 400g', 2332.50),
('Lentejas', 'Paquete 500g', 683.80),
('Garbanzos', 'Caja 400g', 891.00),
('Alubias', 'Caja 400g', 1181.70),
('Té verde', '20 sobres', 1886.40),
('Café instantáneo', 'Frasco 200g', 3222.40),
('Agua tónica', 'Botella 1 litro', 1269.60);

DELIMITER $$

CREATE PROCEDURE poblar_registros()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 10000 DO
    INSERT INTO registro (
      fecha, id_producto, id_cliente, id_agente, id_tienda, id_modo_pago, cantidad, total
    ) VALUES (
      DATE_ADD('2018-01-01', INTERVAL FLOOR(RAND()*2450) DAY),
      FLOOR(RAND()*100)+1,     -- id_producto (1–100)
      FLOOR(RAND()*20)+1,      -- id_cliente (1–20)
      FLOOR(RAND()*10)+1,      -- id_agente (1–10)
      FLOOR(RAND()*5)+1,       -- id_tienda (1–5)
      FLOOR(RAND()*3)+1,       -- id_modo_pago (1–3)
      FLOOR(RAND()*5)+1,       -- cantidad (1–5)
      ROUND(RAND()*50+2,2)     -- total (2.00–52.00)
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;

call poblar_registros;

CREATE VIEW venta_data AS
SELECT 
    a.nombre AS productos,
    f.cantidad,
    a.precio AS valor_individual,
    m.tipo AS forma_pago,
    c.nombre AS clientes,
    t.nombre AS tiendas,
    v.nombre AS vendedores
FROM registro f
INNER JOIN producto a ON f.id_producto = a.id_producto
INNER JOIN cliente c ON f.id_cliente = c.id_cliente
INNER JOIN tienda t ON f.id_tienda = t.id_tienda
INNER JOIN agente v ON f.id_agente = v.id_agente
INNER JOIN modo_pago m ON f.id_modo_pago = m.id_modo_pago;

select * from venta_data vd;