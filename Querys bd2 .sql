use bd2;
describe campanas;
select * from campanas;
select * from audiencias;
--joins--
--Producto cartesiano

#Como unir tablas de diferentes formas
#lo primero es bautizar nuevamente las bases de datos 

# Producto cartesiano (sin condición de unión)
# Esto multiplica todas las filas de campanas por todas las filas de audiencias
# ¡Ojo! puede dar muchísimas combinaciones
SELECT campanas.Nombre, campanas.plataforma, audiencias.intereses
FROM campanas JOIN audiencias;



# INNER JOIN
# Devuelve solo las filas donde coinciden los ID_campana en ambas tablas
SELECT * from campanas c inner join metricas m ON c.ID_campana = m.ID_campana;

# LEFT JOIN
# Devuelve todas las filas de campanas y solo las coincidencias de metricas.
# Si no hay coincidencia, las columnas de metricas salen como NULL


SELECT * from campanas c left join metricas m ON c.Fecha_Inicio= m.Fecha_Medicion;

# RIGHT JOIN
# Devuelve todas las filas de metricas y solo las coincidencias de campanas.
# Si no hay coincidencia, las columnas de campanas salen como NULL

SELECT * from campanas c right join metricas m ON c.Fecha_Inicio= m.Fecha_Medicion;


#--Grouped By

SELECT ID_campana FROM  metricas GROUP BY ID_campana;

#vs
SELECT ID_campana FROM metricas;
Select * from campanas;

## sum, avg, coun, in, or etc

SELECT 
    MAX(Clics) AS max_clics,             # valor máximo de clics
    MIN(Conversiones) AS min_conversiones, # valor mínimo de conversiones
    AVG(Impresiones) AS prom_impresiones,  # promedio de impresiones
    SUM(Rebotes) AS total_rebotes,        # suma de todos los rebotes
    COUNT(*) AS num_campañas              # cuenta cuántas filas hay
FROM metricas 
WHERE ID_campana = 1;

# Seleccionamos las campañas que se hicieron en Google Ads o Instagram Ads
SELECT 
    ID_campana,   # identificador único de la campaña
    Nombre        # nombre de la campaña
FROM campanas
WHERE Plataforma IN ('Google Ads', 'Instagram Ads');  # condición con IN para filtrar por varias opciones

# Contar cuántos registros tiene cada campaña en la tabla metricas
SELECT  
    ID_campana,               # agrupamos por el identificador de la campaña
    COUNT(*) AS total         # total de registros por cada campaña
FROM metricas
GROUP BY ID_campana;

# Filtrar las campañas que tienen más de 5 registros en metricas
SELECT  
    ID_campana, 
    COUNT(*) AS mayor_5       # solo muestra las campañas con más de 5 registros
FROM metricas
GROUP BY ID_campana
HAVING COUNT(*) > 5;          # HAVING se usa para filtrar después del GROUP BY


#joins + group by
# Obtener cuántas audiencias están asociadas a cada campaña
SELECT 
    campanas.nombre,                        # nombre de la campaña
    COUNT(audiencias.ID_campana) AS total_audiencias  # total de audiencias por campaña
FROM campanas
LEFT JOIN audiencias 
    ON campanas.ID_campana = audiencias.ID_campana    # unir ambas tablas por ID de campaña
GROUP BY campanas.nombre;                   # agrupar por nombre de campaña


# Contar cuántas mujeres hay en las audiencias por campaña
SELECT 
    campanas.nombre, 
    COUNT(*) AS total_mujeres
FROM campanas
LEFT JOIN audiencias 
    ON campanas.ID_campana = audiencias.ID_campana
WHERE audiencias.Genero = 'Femenino'   # condición para contar solo mujeres
GROUP BY campanas.nombre;              # agrupar por campaña


SELECT 
    campanas.nombre, 
    COUNT(*) AS total_mujeres
FROM campanas
LEFT JOIN audiencias 
    ON campanas.ID_campana = audiencias.ID_campana
WHERE audiencias.Genero = 'Masculino'   # condición para contar solo mujeres
GROUP BY campanas.nombre;              # agrupar por campaña


#jois + having

# Encontrar campañas con menos de 3 clics en total

SELECT 
    campanas.nombre,                                # Traemos el nombre de la campaña
    COUNT(metricas.ID_campana) AS campana_con_pocos_clics  # Contamos las métricas por campaña
FROM campanas
LEFT JOIN metricas 
    ON campanas.ID_campana = metricas.ID_campana    # Relacionamos campanas con metricas por su ID
GROUP BY campanas.nombre                            # Agrupamos por nombre de campaña
HAVING COUNT(metricas.clics) < 3;                   # Filtramos solo campañas con menos de 3 clics


## joins + order by

## JOINS + ORDER BY

SELECT 
    campanas.nombre,                                   # Seleccionamos el nombre de la campaña
    COUNT(metricas.ID_campana) AS total_metricas       # Contamos cuántas métricas tiene cada campaña
FROM campanas
RIGHT JOIN metricas 
    ON campanas.ID_campana = metricas.ID_campana       # Relacionamos ambas tablas por ID_campana
GROUP BY campanas.nombre                               # Agrupamos por nombre de campaña
ORDER BY total_metricas DESC;                          # Ordenamos de mayor a menor según total de métricas

#Subconsultas
# SUBCONSULTAS
SELECT 
    ID_campana,                   # Traemos el ID de la campaña
    nombre,                       # Traemos el nombre de la campaña
    presupuesto                   # Traemos el presupuesto de la campaña
FROM campanas
WHERE ID_campana IN (             # Comparamos los ID con el resultado de la subconsulta
    SELECT ID_campana             # Subconsulta que devuelve los ID de campañas existentes
    FROM campanas
);



#Not in debe incluir is not null

# NOT IN con IS NOT NULL
SELECT 
    ID_audiencia,        # Traemos el ID de la audiencia
    intereses,             # Interés de la audiencia
    ubicacion            # Ubicación de la audiencia
FROM audiencias
WHERE ID_campana NOT IN (          # Excluimos los ID que estén en la subconsulta
    SELECT ID_audiencia            # Subconsulta devuelve IDs de audiencia
    FROM audiencias
    WHERE ID_audiencia IS NOT NULL # Filtramos NULL para que NOT IN funcione bien
);

# Seleccionamos las audiencias cuya campaña NO está en la plataforma 'Google Ads'
SELECT 
    edad,               # Edad de la audiencia
    genero,             # Género de la audiencia
    intereses             # Interés de la audiencia
FROM audiencias
WHERE ID_campana NOT IN (              # Comparamos el ID de campaña
    SELECT ID_campana                  # Subconsulta: todas las campañas en Google Ads
    FROM campanas
    WHERE plataforma = 'Google Ads'
      AND ID_campana IS NOT NULL       # Evitamos problemas con NULL en NOT IN
);

#update + select

# Actualizar la fecha de medición en la tabla métricas
UPDATE metricas m
SET m.fecha_medicion = (
    # Subconsulta: obtener la fecha máxima de fin de la campaña asociada
    SELECT MAX(c.fecha_fin)
    FROM campanas c
    WHERE c.ID_campana = m.ID_campana
)
# Condición: solo actualizar si existe una campaña con el mismo ID
WHERE EXISTS (
    SELECT 1
    FROM campanas c
    WHERE c.ID_campana = m.ID_campana
);

#update + join
# Actualizar los clics en la tabla métricas usando un JOIN con campanas
UPDATE metricas m
JOIN campanas c ON m.ID_campana = c.ID_campana   # Relación entre ambas tablas
SET m.clics = m.clics + 1                        # Sumar +1 a la columna clics
WHERE c.estado = 'en curso';                     # Solo actualizar si la campaña está activa
