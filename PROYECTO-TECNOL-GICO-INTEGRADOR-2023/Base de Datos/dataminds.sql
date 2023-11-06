-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-11-2023 a las 19:28:37
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dataminds`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abreviaturas`
--

DROP TABLE IF EXISTS `abreviaturas`;
CREATE TABLE IF NOT EXISTS `abreviaturas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Abreviatura` varchar(10) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abreviaturas_productos`
--

DROP TABLE IF EXISTS `abreviaturas_productos`;
CREATE TABLE IF NOT EXISTS `abreviaturas_productos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Abreviatura_ID` int DEFAULT NULL,
  `Producto_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Abreviatura_ID` (`Abreviatura_ID`),
  KEY `Producto_ID` (`Producto_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ied_flujo`
--

DROP TABLE IF EXISTS `ied_flujo`;
CREATE TABLE IF NOT EXISTS `ied_flujo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Periodo` varchar(10) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Flujo_USD` decimal(10,1) DEFAULT NULL,
  `Var_Porcentaje_Anterior` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo_ID` int DEFAULT NULL,
  `Descripcion` text COLLATE utf8mb3_spanish_ci,
  PRIMARY KEY (`ID`),
  KEY `Tipo_ID` (`Tipo_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_relaciones`
--

DROP TABLE IF EXISTS `productos_relaciones`;
CREATE TABLE IF NOT EXISTS `productos_relaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Producto_ID` int DEFAULT NULL,
  `IED_Flujo_ID` int DEFAULT NULL,
  `Var_Porcentaje_PIB_ID` int DEFAULT NULL,
  `Relacion_Comercial_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Producto_ID` (`Producto_ID`),
  KEY `IED_Flujo_ID` (`IED_Flujo_ID`),
  KEY `Var_Porcentaje_PIB_ID` (`Var_Porcentaje_PIB_ID`),
  KEY `Relacion_Comercial_ID` (`Relacion_Comercial_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_socios`
--

DROP TABLE IF EXISTS `productos_socios`;
CREATE TABLE IF NOT EXISTS `productos_socios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Producto_ID` int DEFAULT NULL,
  `Socio_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Producto_ID` (`Producto_ID`),
  KEY `Socio_ID` (`Socio_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relacion_comercial`
--

DROP TABLE IF EXISTS `relacion_comercial`;
CREATE TABLE IF NOT EXISTS `relacion_comercial` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Pais` varchar(50) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `Flujo_Envios_USD` decimal(10,2) DEFAULT NULL,
  `Categoria_Principal` varchar(50) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Valor_Principal_USD` decimal(10,2) DEFAULT NULL,
  `Detalle_Principal` text COLLATE utf8mb3_spanish_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios_comerciales`
--

DROP TABLE IF EXISTS `socios_comerciales`;
CREATE TABLE IF NOT EXISTS `socios_comerciales` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Socio` varchar(50) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Tipo_Relacion` varchar(15) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Porcentaje_Importaciones` decimal(5,2) DEFAULT NULL,
  `Porcentaje_Exportaciones` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_productos`
--

DROP TABLE IF EXISTS `tipos_productos`;
CREATE TABLE IF NOT EXISTS `tipos_productos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Porcentaje_Importaciones` decimal(5,2) DEFAULT NULL,
  `Porcentaje_Exportaciones` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_spanish_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_relaciones`
--

DROP TABLE IF EXISTS `usuarios_relaciones`;
CREATE TABLE IF NOT EXISTS `usuarios_relaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Usuario_ID` int DEFAULT NULL,
  `OtraTabla_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Usuario_ID` (`Usuario_ID`),
  KEY `OtraTabla_ID` (`OtraTabla_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `var_porcentaje_pib`
--

DROP TABLE IF EXISTS `var_porcentaje_pib`;
CREATE TABLE IF NOT EXISTS `var_porcentaje_pib` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Periodo` varchar(10) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `Porcentaje_PIB` decimal(5,1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abreviaturas_productos`
--
ALTER TABLE `abreviaturas_productos`
  ADD CONSTRAINT `abreviaturas_productos_ibfk_1` FOREIGN KEY (`Abreviatura_ID`) REFERENCES `abreviaturas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `abreviaturas_productos_ibfk_2` FOREIGN KEY (`Producto_ID`) REFERENCES `productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Tipo_ID`) REFERENCES `tipos_productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_relaciones`
--
ALTER TABLE `productos_relaciones`
  ADD CONSTRAINT `productos_relaciones_ibfk_1` FOREIGN KEY (`Producto_ID`) REFERENCES `productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_relaciones_ibfk_2` FOREIGN KEY (`IED_Flujo_ID`) REFERENCES `ied_flujo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_relaciones_ibfk_3` FOREIGN KEY (`Var_Porcentaje_PIB_ID`) REFERENCES `var_porcentaje_pib` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_relaciones_ibfk_4` FOREIGN KEY (`Relacion_Comercial_ID`) REFERENCES `relacion_comercial` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_socios`
--
ALTER TABLE `productos_socios`
  ADD CONSTRAINT `productos_socios_ibfk_1` FOREIGN KEY (`Producto_ID`) REFERENCES `productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_socios_ibfk_2` FOREIGN KEY (`Socio_ID`) REFERENCES `socios_comerciales` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios_relaciones`
--
ALTER TABLE `usuarios_relaciones`
  ADD CONSTRAINT `usuarios_relaciones_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_relaciones_ibfk_2` FOREIGN KEY (`OtraTabla_ID`) REFERENCES `tipos_productos` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
