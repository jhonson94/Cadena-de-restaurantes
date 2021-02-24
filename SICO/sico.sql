-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2015 a las 05:00:44
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `id_categoria`, `direccion`, `descripcion`, `url`, `estado`) VALUES
(1, 'Topsy', 2, 'San sebastian', 'venta de helados2', 'http://www.loaizacomunicaciones.com.ec/_documentos/image/noticias/14/logo-topsy.png', 1),
(2, 'El fogon', 8, 'Parque Bolivar', 'Comida para el paso', 'http://www.surfguru.com/CMSImages/03/03f4ec44-1dee-4fe1-a91f-d2425eb30bba_390_339.jpg', 1),
(3, 'Ch farina', 1, 'colegio tecnico', NULL, 'http://www.chfarina.com/web/images/chefarina/logo.png', 1),
(4, 'Nice cream', 5, 'san sebastian ', NULL, 'http://image.slidesharecdn.com/tuttofredo-120327215934-phpapp02/95/tutto-fredo-1-728.jpg?cb=1333531216', 1),
(5, 'El pirata', 6, 'sucre', NULL, 'http://static.amarillasinternet.com/pictures/200000_300000/240000_250000/248000_249000/248800_248900/248823/banners/248823_a.jpg', 1),
(6, 'Estragos', 7, '10 de agosto', NULL, 'http://images.quebarato.com.ec/T440x/tragos+a+muy+bien+precio+quito+pichincha+ecuador__58EF7C_5.jpg', 1),
(7, 'Alivinatu', 8, '10 de agosto', NULL, 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTU3HleBVRNmVFysYgB_6oDXsTpdjMVws37JanDxCbGYpTnuv4F', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `nombre`, `total_productos`, `total_pago`, `numero_cuenta`, `fecha`, `estado`) VALUES
(1, 'Galo Celly', 2, 1, NULL, '2015-07-21', 'SP'),
(2, 'Galo Celly', 7, 10.5, NULL, '2015-07-29', 'SP');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombres`, `mail`, `sexo`, `cedula`, `fecha_nacimiento`, `telefono`, `direccion`, `id_tipo`, `usuario`, `pass`) VALUES
(1, 'Galo Celly', 'galocelly@gm.com', 'MASCULINO', '111111111', '2015-07-01', 233452, 'Loja', 2, 'g', 'g'),
(2, 'jafv', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'a', 'a');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `id_empresa`, `stock`, `url`, `estado`) VALUES
(1, 'Helado de crema', 'con crema', 1.5, 2, 200, 'http://www.hayrecetas.com/wp-content/uploads/2008/12/helado-crema1.jpg', 1),
(2, 'Parrilada', 'parrilla de chancho', 1.5, 2, 15, 'http://static.betazeta.com/www.sabrosia.com/up/2013/06/costillitas-al-horno-y-parrilla-960x623.jpg', 1),
(3, 'Helado Yogurt', 'con yogurt', 0.5, 1, 20, 'http://s3-eu-west-1.amazonaws.com/mimandote/images/valoraciones/0001/3024/yogurt-helado.jpg?1333536282', 1),
(4, 'Parillada Junior', NULL, 25, 2, 10, 'http://www.elcortijo.com.pe/images/parrila2000.jpg', 1),
(5, 'Lomo asado', NULL, 7.5, 2, 20, 'http://static.menutabapp.com/img/cache/800x500/2012/10/16/89bdbcde3687fd73abfe73c64ab2860d.jpeg', 1),
(6, 'Lomo aumado', NULL, 8, 2, 100, 'https://restorando-res.cloudinary.com/image/upload/s--MpyuNzoM--/c_fill,f_auto,h_328,w_463/v1403010854/restaurant_photos/e/5646/40040/restaurante_parrilladas-panchito-s_santiago-centro_platos10.jpg', 1),
(7, 'Pinchos', NULL, 2.5, 2, 10, 'http://www.elcortijo.com.pe/images/parrila2000.jpg', 1);

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
(1, 'administrador'),
(2, 'cliente');

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
