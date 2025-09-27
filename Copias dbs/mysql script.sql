CREATE DATABASE tienda_mx;
USE tienda_mx;

CREATE TABLE articulos (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2)
);

CREATE TABLE compradores (
    id_comprador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);

CREATE TABLE asesores (
    id_asesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(50)
);

CREATE TABLE sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(150)
);

CREATE TABLE metodo_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50)
);

CREATE TABLE transaccion (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    id_articulo INT,
    id_comprador INT,
    id_asesor INT,
    id_sucursal INT,
    id_metodo_pago INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo),
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
    FOREIGN KEY (id_asesor) REFERENCES asesores(id_asesor),
    FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pago(id_metodo_pago)
);

-- Clientes (compradores)
INSERT INTO compradores (nombre, correo) VALUES
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

-- Tiendas (sucursal)
INSERT INTO sucursal (nombre, ubicacion) VALUES
('Central', 'Av. Principal 101'),
('Norte', 'Calle 45 #67'),
('Sur', 'Carrera 23 #10'),
('Este', 'Diagonal 8 #55'),
('Oeste', 'Transversal 44 #32');

-- Formas de Pago (metodo_pago)
INSERT INTO metodo_pago (tipo) VALUES
('Efectivo'), ('Tarjeta'), ('Transferencia');

-- Vendedores (asesores)
INSERT INTO asesores (nombre, puesto) VALUES
('Carlos Ruiz', 'Gerente de Ventas'),
('Laura Pérez', 'Asesor Comercial Senior'),
('Javier Castro', 'Especialista en Producto'),
('Ana Soto', 'Ejecutiva de Cuenta'),
('Ricardo Gómez', 'Consultor Junior'),
('Camilo Smith', 'Gerente de Zona'),
('Daniela Pérez', 'Asesor Comercial Senior'),
('Pedro Parquets', 'Especialista en Producto'),
('Analbys Sotomaria', 'Ejecutiva de Cuenta'),
('Ricardo Guzmán', 'Consultor Junior');

INSERT INTO articulos -- cambiar el nombre de acuerdo a la base de datos
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

-- Procedimiento almacenado para poblar la tabla transaccion
DELIMITER $$
CREATE PROCEDURE poblar_transacciones()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 10000 DO
    INSERT INTO transaccion (
      fecha, id_articulo, id_comprador, id_asesor, id_sucursal, id_metodo_pago, cantidad, total
    ) VALUES (
      DATE_ADD('2018-01-01', INTERVAL FLOOR(RAND()*2450) DAY),
      FLOOR(RAND()*100)+1,
      FLOOR(RAND()*20)+1,
      FLOOR(RAND()*5)+1,
      FLOOR(RAND()*5)+1,
      FLOOR(RAND()*3)+1,
      FLOOR(RAND()*5)+1,
      ROUND(RAND()*50+2,2)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

CALL poblar_transacciones();

DELIMITER $$
create view venta_data as 
select 
	  a.nombre as productos, 
    f.cantidad, 
    a.precio as valor_individual, 
    m.tipo as forma_pago, 
    c.nombre as clientes, 
    t.nombre as tiendas, 
    v.nombre as vendedores
from transaccion f 
inner join articulos a 
on f.id_articulo = a.id_articulo
inner join compradores c 
on f.id_comprador = c.id_comprador
inner join sucursal t 
on f.id_sucursal = t.id_sucursal
inner join asesores v
on f.id_asesor = v.id_asesor
inner join metodo_pago m
on f.id_metodo_pago = m.id_metodo_pago;
$$ 
DELIMITER;