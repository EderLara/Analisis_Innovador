CREATE DATABASE ventas_sql;
GO
USE ventas_sql;
GO

CREATE TABLE bienes (
    id_bien INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2)
);

CREATE TABLE usuario (
    id_usuario INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE encargado (
    id_encargado INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(50)
);

CREATE TABLE local (
    id_local INT IDENTITY PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE instrumento (
    id_instrumento INT IDENTITY PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE venta (
    id_venta INT IDENTITY PRIMARY KEY,
    fecha DATE,
    id_bien INT FOREIGN KEY REFERENCES bienes(id_bien),
    id_usuario INT FOREIGN KEY REFERENCES usuario(id_usuario),
    id_encargado INT FOREIGN KEY REFERENCES encargado(id_encargado),
    id_local INT FOREIGN KEY REFERENCES local(id_local),
    id_instrumento INT FOREIGN KEY REFERENCES instrumento(id_instrumento),
    cantidad INT,
    total DECIMAL(10,2)
);

-- Clientes (usuario)
INSERT INTO usuario (nombre, correo) VALUES
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

-- Tiendas (local)
INSERT INTO local (nombre, direccion) VALUES
('Central', 'Av. Principal 101'),
('Norte', 'Calle 45 #67'),
('Sur', 'Carrera 23 #10'),
('Este', 'Diagonal 8 #55'),
('Oeste', 'Transversal 44 #32');

-- Formas de Pago (instrumento)
INSERT INTO instrumento (tipo) VALUES
('Efectivo'), ('Tarjeta'), ('Transferencia');

-- Vendedores (encargado)
INSERT INTO encargado (nombre, puesto) VALUES
('Pedro Sánchez', 'Ejecutivo de Cuentas Clave'),
('María Vargas', 'Especialista en eCommerce'),
('Diego Morales', 'Supervisor de Telemarketing'),
('Silvia Rojas', 'Gerente de Sucursal'),
('Fernando Soto', 'Analista de Inteligencia de Mercado'),
('Adriana Gil', 'Asesor de Retención'),
('Juan Ríos', 'Desarrollador de Territorio'),
('Natalia Bravo', 'Consultor de Soluciones'),
('Roberto Landa', 'Asesor de Postventa'),
('Claudia Pardo', 'Técnico de Campo'),
('Emilio Vega', 'Promotor de Ventas'),
('Daniela Salas', 'Coordinadora de Proyectos'),
('Hugo Meléndez', 'Asesor Financiero'),
('Lorena Ramos', 'Ejecutiva de Ventas Corporativas'),
('Sergio Tello', 'Especialista en Trade Marketing'),
('Andrea Montes', 'Asesor de Experiencia del Cliente');

-- Productos (bienes)
INSERT INTO bienes -- cambiar el nombre de acuerdo a la base de datos
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

-- Crea una tabla temporal de 10,000 filas para generar el lote
WITH Numeros AS (
    SELECT TOP 10000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) as N
    FROM sys.all_columns a CROSS JOIN sys.all_columns b
)
INSERT INTO venta (
  fecha, id_bien, id_usuario, id_encargado, id_local, id_instrumento, cantidad, total
)
SELECT
  -- Fecha: 
  DATEADD(day, ABS(CHECKSUM(NEWID())) % 2450, '2018-01-01'),
  -- IDs: ABS(CHECKSUM(NEWID())) % N + 1
  ABS(CHECKSUM(NEWID())) % 100 + 1,
  ABS(CHECKSUM(NEWID())) % 20 + 1,
  ABS(CHECKSUM(NEWID())) % 10 + 1,
  ABS(CHECKSUM(NEWID())) % 5 + 1,
  ABS(CHECKSUM(NEWID())) % 3 + 1,
  -- Cantidad:
  ABS(CHECKSUM(NEWID())) % 5 + 1,
  -- Total: Usamos NEWID() con RAND() para garantizar la aleatoriedad por fila
  ROUND(RAND(CHECKSUM(NEWID())) * 50 + 2, 2)
FROM Numeros;
GO

CREATE VIEW venta_data AS
SELECT
    a.nombre AS productos,
    f.cantidad,
    a.precio AS valor_individual,
    m.tipo AS forma_pago,
    c.nombre AS clientes,
    t.nombre AS tiendas,
    v.nombre AS vendedores
FROM venta f
INNER JOIN bienes a ON f.id_bien = a.id_bien
INNER JOIN usuario c ON f.id_usuario = c.id_usuario
INNER JOIN local t ON f.id_local = t.id_local
INNER JOIN encargado v ON f.id_encargado = v.id_encargado
INNER JOIN instrumento m ON f.id_instrumento = m.id_instrumento;
