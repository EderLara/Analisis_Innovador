CREATE DATABASE `bd2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- bd2.audiencias definition

CREATE TABLE `audiencias` (
  `ID_Audiencia` int DEFAULT NULL,
  `ID_Campana` int DEFAULT NULL,
  `Edad` varchar(50) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Intereses` varchar(50) DEFAULT NULL,
  `Comportamiento` varchar(50) DEFAULT NULL,
  `Ubicacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- bd2.campanas definition

CREATE TABLE `campanas` (
  `ID_Campana` int DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Fecha_Inicio` varchar(50) DEFAULT NULL,
  `Fecha_Fin` varchar(50) DEFAULT NULL,
  `Plataforma` varchar(50) DEFAULT NULL,
  `Presupuesto` double DEFAULT NULL,
  `Objetivo` varchar(50) DEFAULT NULL,
  `Tipo_Campana` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- bd2.metricas definition

CREATE TABLE `metricas` (
  `ID_Metrica` int DEFAULT NULL,
  `ID_Campana` int DEFAULT NULL,
  `Fecha_Medicion` varchar(50) DEFAULT NULL,
  `Clics` int DEFAULT NULL,
  `Impresiones` int DEFAULT NULL,
  `Tasa_Clics` double DEFAULT NULL,
  `Conversiones` int DEFAULT NULL,
  `Tasa_Conversion` double DEFAULT NULL,
  `Ingreso_Generado` double DEFAULT NULL,
  `Rebotes` int DEFAULT NULL,
  `Tasa_rebote` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- bd2.tb1 definition

CREATE TABLE `tb1` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(15) DEFAULT NULL,
  `cedula` int DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;