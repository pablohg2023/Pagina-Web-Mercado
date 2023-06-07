-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2023 a las 08:41:59
-- Versión del servidor: 5.7.40
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `charcuteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `num_telefono` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `num_telefono` (`num_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `apellidos`, `num_telefono`) VALUES
(1, '22303346Q', 'Miguel', 'Birao Castro', 654254629),
(2, '97483043G', 'Carla', 'Trujillo Tejera', 603490608),
(3, '70290963L', 'Marta', 'Gallardo Roca', 698438175),
(4, '65715865N', 'Matias', 'Gomez Pico', 662891235),
(5, '59087685H', 'Jesus', 'Hernandez Jimenez', 666356396);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidora`
--

DROP TABLE IF EXISTS `distribuidora`;
CREATE TABLE IF NOT EXISTS `distribuidora` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `num_telefono` int(10) NOT NULL,
  `fecha_distribucion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `num_telefono` (`num_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `distribuidora`
--

INSERT INTO `distribuidora` (`id`, `nombre`, `num_telefono`, `fecha_distribucion`) VALUES
(1, 'Maison Voisine', 613905437, '2022-11-19'),
(2, 'La Hoguera SA', 605149738, '2022-11-28'),
(3, 'Jamones Pesón', 664190376, '2022-11-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recoger` varchar(5) DEFAULT NULL,
  `domicilio` varchar(5) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_id` (`clientes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `recoger`, `domicilio`, `clientes_id`) VALUES
(1, 'Si', 'No', 4),
(2, 'Si', 'No', 3),
(3, 'No', 'Si', 1),
(4, 'Si', 'No', 5),
(5, 'No', 'Si', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) DEFAULT NULL,
  `precio_kilo` varchar(10) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  `clientes_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes_id` (`clientes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio_kilo`, `tipo`, `clientes_id`) VALUES
(1, 'Jamon Iberico Bellota', '80€', 'Embutido', 5),
(2, 'Jamon de Cebo', '65€', 'Embutido', 2),
(3, 'Queso Cabra Manchego', '22.99€', 'Lacteo', 4),
(4, 'Salchichon Payes', '18.90€', 'Embutido', 1),
(5, 'Chorizo Herradura de León', '11.80€', 'Embutido', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_has_distribuidora`
--

DROP TABLE IF EXISTS `productos_has_distribuidora`;
CREATE TABLE IF NOT EXISTS `productos_has_distribuidora` (
  `distribuidora_id` int(10) NOT NULL,
  `productos_id` int(10) NOT NULL,
  KEY `distribuidora_id` (`distribuidora_id`),
  KEY `productos_id` (`productos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_has_distribuidora`
--

INSERT INTO `productos_has_distribuidora` (`distribuidora_id`, `productos_id`) VALUES
(1, 1),
(1, 2),
(3, 3),
(2, 4),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
CREATE TABLE IF NOT EXISTS `trabajador` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dni` varchar(10) NOT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `apellidos` varchar(25) DEFAULT NULL,
  `num_seg_social` varchar(15) NOT NULL,
  `num_cuenta` varchar(30) NOT NULL,
  `num_telefono` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `num_seg_social` (`num_seg_social`),
  UNIQUE KEY `num_cuenta` (`num_cuenta`),
  UNIQUE KEY `num_telefono` (`num_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`id`, `dni`, `nombre`, `apellidos`, `num_seg_social`, `num_cuenta`, `num_telefono`) VALUES
(1, '51367809B', 'Raul', 'Rodriguez Gonzalez', '522-04-4245', 'ES2302372088729917350015', 653972505),
(2, '44883593J', 'Beatriz', 'Suarez Martinez', '502-33-8180', 'ES7100199700672932146657', 692935089),
(3, '85850506Q', 'Alfonso', 'Ramos Torres', '041-54-8894', 'ES2220009856218376775253', 680691645);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador_has_clientes`
--

DROP TABLE IF EXISTS `trabajador_has_clientes`;
CREATE TABLE IF NOT EXISTS `trabajador_has_clientes` (
  `trabajador_id` int(10) NOT NULL,
  `clientes_id` int(10) NOT NULL,
  KEY `trabajador_id` (`trabajador_id`),
  KEY `clientes_id` (`clientes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trabajador_has_clientes`
--

INSERT INTO `trabajador_has_clientes` (`trabajador_id`, `clientes_id`) VALUES
(3, 4),
(3, 1),
(2, 2),
(1, 5),
(2, 3);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`);

--
-- Filtros para la tabla `productos_has_distribuidora`
--
ALTER TABLE `productos_has_distribuidora`
  ADD CONSTRAINT `productos_has_distribuidora_ibfk_1` FOREIGN KEY (`distribuidora_id`) REFERENCES `distribuidora` (`id`),
  ADD CONSTRAINT `productos_has_distribuidora_ibfk_2` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `trabajador_has_clientes`
--
ALTER TABLE `trabajador_has_clientes`
  ADD CONSTRAINT `trabajador_has_clientes_ibfk_1` FOREIGN KEY (`trabajador_id`) REFERENCES `trabajador` (`id`),
  ADD CONSTRAINT `trabajador_has_clientes_ibfk_2` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
