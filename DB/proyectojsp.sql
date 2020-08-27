-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2020 a las 00:47:15
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectojsp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE `fotos` (
  `nick` varchar(10) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`nick`, `foto`, `fecha`) VALUES
('christian', 'img/3lq63dcck4b729ib3t2i573fkd.jpg', '2020-05-26 19:35:09'),
('christian', 'img/pud68l9908t3spe27lueb823ma.jpg', '2020-05-26 19:36:00'),
('christian', 'img/j176uuphj2kr153ul7ggdu9b2b.jpg', '2020-05-26 23:57:27'),
('christian', 'img/1hb1tvcqdtsblq1r555g0joah9.jpg', '2020-05-26 23:57:50'),
('christian', 'img/a2t0g9f2t1ed4s2mttvc6d6df7.jpg', '2020-05-26 23:58:06'),
('fulanito', 'img/21r5ep2vkdebu95p5oee8kl89p.jpg', '2020-05-27 00:00:17'),
('fulanito', 'img/4oo1ru46vh589633flm3hfpjnn.jpg', '2020-05-27 00:00:24'),
('test', 'img/tvi1cm28h1av78fdts1ns2j527.jpg', '2020-05-27 00:36:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `nick` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`nick`, `email`, `pass`, `foto`) VALUES
('christian', 'christivn.ramos@gmail.com', '�–žïnÊÓÂš:b’€æ†Ï?]Z†¯óÊ’:Ül’', 'img/edpe4opi9nbnamtcauu6dgmq9f.jpg'),
('fulanito', 'fulanito@gmail.com', 'HlÀQCÌÝ~-”úð§\0¨´œÑ9\"§ZâŠÊ¨Å', 'img/kmmbktmkv4frleui1jbmmuv6sg.jpg'),
('menganito', 'menganito@hotmail.com', 'â°ÓÃ8‘ë°ñï`žÄB ã Î”Æ_¼Œ3DŽ²%', 'img/lt9imlne153ep2nmr826154hc7.jpg'),
('test', 'test@test.com', '�–žïnÊÓÂš:b’€æ†Ï?]Z†¯óÊ’:Ül’', 'img/11n44jvkrnqoen0d5srbsbseij.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
