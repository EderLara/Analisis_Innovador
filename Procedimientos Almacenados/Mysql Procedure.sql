CREATE PROCEDURE `cost_item`()
BEGIN

    -- Declaración de variables locales
    DECLARE fin_cursor INT;           -- Indicador para saber si el cursor ha llegado al final
    DECLARE porcentaje FLOAT;         -- Porcentaje de utilidad calculado aleatoriamente
    DECLARE venta FLOAT;              -- Precio de venta calculado
    DECLARE id INT;                   -- ID del artículo
    DECLARE valor FLOAT;              -- Precio base del artículo

    -- Declaración del cursor 'item_set' para recorrer los artículos
    DECLARE item_set CURSOR FOR 
        SELECT
            id_articulo,                                							-- ID del artículo
            precio,                                     							-- Precio base
            (10 + (RAND() * 11)) AS porcentaje_utilidad, 							-- Porcentaje aleatorio entre 10 y 21
            ROUND(precio * (1 + FLOOR(10 + (RAND() * 11))/100), 2) AS precio_venta 	-- Precio de venta con utilidad
        FROM articulos;

    -- Manejador para detectar el fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_cursor = 1;

    -- Abrimos el cursor para comenzar a recorrer los registros
    OPEN item_set;

    -- Bucle para recorrer cada fila del cursor
    bucle: LOOP
        -- Extraemos los valores de la fila actual del cursor
        FETCH item_set INTO id, valor, porcentaje, venta;

        -- Mostramos los valores obtenidos (opcional, útil para depuración)
        -- SELECT id, valor, porcentaje, venta;

        -- Si se ha llegado al final del cursor, salimos del bucle
        IF fin_cursor = 1 THEN 
            LEAVE bucle;
        END IF;

        -- Actualizamos el artículo con el nuevo porcentaje de utilidad y precio de venta
        UPDATE articulos
            SET porcentaje_utilidad = porcentaje, 
                precio_venta = venta
            WHERE id_articulo = id;
    END LOOP;

    -- Cerramos el cursor después de terminar el recorrido
    CLOSE item_set;
END;