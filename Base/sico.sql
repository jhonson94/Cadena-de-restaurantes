-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2015 a las 02:34:14
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Pizzeria'),
(2, 'Cafeteria'),
(3, 'Restaurant'),
(4, 'Eventos Sociales'),
(5, 'Heladeria'),
(6, 'Marisqueria'),
(7, 'Licoreria'),
(8, 'Comida rapida'),
(9, 'Comida Vegetariana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`,`id_categoria`),
  KEY `fk_categoria_idx` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `id_categoria`, `direccion`, `descripcion`, `url`, `estado`) VALUES
(1, 'Topsy2', 2, 'loja22', 'venta de helados2', 'http://www.loaizacomunicaciones.com.ec/_documentos/image/noticias/14/logo-topsy.png', 0),
(2, 'El fogon2', 2, 'Parque Bolivar', 'Comida para el paso', 'http://www.surfguru.com/CMSImages/03/03f4ec44-1dee-4fe1-a91f-d2425eb30bba_390_339.jpg', 1),
(3, 'NUEVA', 9, 'sac', 'cac', 'sdsad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE IF NOT EXISTS `pago` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `total_productos` int(20) DEFAULT NULL,
  `total_pago` double DEFAULT NULL,
  `numero_cuenta` int(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `nombre`, `total_productos`, `total_pago`, `numero_cuenta`, `fecha`, `estado`) VALUES
(1, 'jose', 8, 12, 1111111, '2015-07-27', 'PAGADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_id_producto_idx` (`id_producto`),
  KEY `fk_id_persona_idx` (`id_persona`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_producto`, `cantidad`, `fecha`, `id_persona`) VALUES
(1, 1, 5, '2015-07-27', 1),
(2, 2, 3, '2015-07-27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `id_tipo` int(11) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  PRIMARY KEY (`id_persona`,`id_tipo`),
  KEY `fk_tipo_idx` (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `mail`, `sexo`, `cedula`, `fecha_nacimiento`, `telefono`, `direccion`, `id_tipo`, `usuario`, `pass`) VALUES
(1, 'jose', 'jjs@djj.com', 'Masculino', '31231', '2008-11-01', 4324, 'dasdsa', 2, 'jose', 'jose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_empresa` int(11) NOT NULL,
  `stock` int(45) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`,`id_empresa`),
  KEY `fk_empresa_idx` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `id_empresa`, `stock`, `url`, `estado`) VALUES
(1, 'Helado de crema', 'con crema', 1.5, 2, 200, 'http://www.hayrecetas.com/wp-content/uploads/2008/12/helado-crema1.jpg', 1),
(2, 'Parrilada', 'parrilla de chancho', 1.5, 2, 15, 'http://static.betazeta.com/www.sabrosia.com/up/2013/06/costillitas-al-horno-y-parrilla-960x623.jpg', 1),
(3, 'Helado Yogurt', 'con yogurt', 0.5, 1, 20, 'http://s3-eu-west-1.amazonaws.com/mimandote/images/valoraciones/0001/3024/yogurt-helado.jpg?1333536282', 0),
(4, 'no se', 'das', 1, 2, 21, 'ascasc', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE IF NOT EXISTS `tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `tipo`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valoraciones`
--

CREATE TABLE IF NOT EXISTS `valoraciones` (
  `id_valoraciones` int(11) NOT NULL AUTO_INCREMENT,
  `tabla` varchar(45) DEFAULT NULL,
  `valoracion` varchar(250) DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_valoraciones`,`id_persona`),
  KEY `fk_persona_idx` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
