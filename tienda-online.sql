-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-12-2023 a las 23:34:24
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda-online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'TECNOLOGIA', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'DISEÑO WEB', 'assets/images/categorias/20220805093028.jpg', 1),
(3, 'FASHION', 'NO', 1),
(4, 'PRUEBA', '', 0),
(5, 'PRUEBA', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perfil` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default.png',
  `token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verify` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(3, 'ANGEL SIFUENTES', 'lovenaju2@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', '21a66551b83c814b108081b292dc65d2', 1),
(5, 'JUAN ANGEL', 'prueba@gmail.com', '$2y$10$rr24uW0VypkrDEhooFRsoOli/Pcm5NR5F8D9NARgQz0l1UfPkqV1q', 'default.png', 'c81b5136bcd10b4390108c979ed28ee6', 1),
(6, 'alder gaspar', 'estigarribiaalder@gmail.com', '$2y$10$w0sWCX.O9G0PVvKwvwNl5uZAcZ2Enk55uTtMLcwER7gfEXYUFkOS2', 'default.png', '0d6fa32151dae7760958005b49be3e83', 0),
(8, 'Alder Riquelme', 'riquelmealder@gmail.com', '$2y$10$xVKcWrnyat1VkaMWznGQkOmJFjeHacjxKSoBQ4qYCBPFhjWTT4/tu', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'CAMARA WEB', 200.00, 1, 1, 2),
(2, 'TELEVISOR LG', 1500.00, 1, 1, 3),
(3, 'NUEVO PRODUCTO', 5.00, 1, 2, 6),
(4, 'FASHION 2', 3.00, 1, 2, 8),
(5, 'FASHION1', 8.00, 1, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaccion` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `proceso` enum('1','2','3') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6PX22696F1040260E', 1700.00, 'COMPLETED', '2023-02-20 17:12:42', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 5, '2'),
(2, '1HJ95121A9582915R', 16.00, 'COMPLETED', '2023-07-10 22:37:24', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 3, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'PARLANTE HILON', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?\r\n', 10.00, 10, 'assets/images/productos/20220805093212.jpg', 1, 1),
(2, 'CAMARA WEB', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 20.00, 15, 'assets/images/productos/20220805093304.jpg', 1, 1),
(3, 'TELEVISOR LG', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 10.00, 40, 'assets/images/productos/20220805093355.jpg', 1, 1),
(4, 'MICROFONO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 8.00, 5, 'assets/images/productos/20220805093426.jpg', 1, 1),
(5, 'LAPTOP LENOVO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 30.00, 12, 'assets/images/productos/20220805093535.jpg', 1, 1),
(6, 'NUEVO PRODUCTO', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, facere.</p><ol><li>Lorem ipsum, dolor sit amet <strong>consectetur</strong> adipisicing elit. Incidunt, facere.</li><li><a href=\"https://angelsifuentes.com/pos\">https://angelsifuentes.com/pos</a></li></ol>', 5.00, 16, 'assets/images/productos/20220806090232.jpg', 1, 2),
(7, 'FASHION1', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 8.00, 5, 'assets/images/productos/fashion1.png', 1, 3),
(8, 'FASHION 2', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 3.00, 12, 'assets/images/productos/fashion2.png', 1, 3),
(10, 'vamos', 'si se puede', 12.00, 12, 'assets/images/productos/20230710235600.jpg', 0, 4),
(11, 'CAMISA', 'PRUEBA EXAMEN', 35.00, 25, 'assets/images/productos/20231204223530.jpg', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perfil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'Alder', 'Riquelme', 'Riquelmealder@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'hola', 'como', 'esta@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 0),
(3, 'ANGEL', 'RIQUELME', 'RIQUELMEANGEL@GMAIL.COM', '$2y$10$ADvMdjS85ucFZ0zOecYg3OCX/RRJ3jxBA3ZMBMYuMfKhaFr4PH9T2', NULL, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
