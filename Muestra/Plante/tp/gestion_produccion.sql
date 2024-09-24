-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 02:22:37
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_produccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapa`
--

CREATE TABLE `etapa` (
  `ID_Etapa` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `etapa`
--

INSERT INTO `etapa` (`ID_Etapa`, `Descripcion`) VALUES
(1, 'puesto_1'),
(2, 'puesto_2'),
(3, 'puesto_3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `id_Formula` int(11) NOT NULL,
  `nro_Formula` int(11) DEFAULT NULL,
  `ID_Producto` varchar(255) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Nro_Etapa` int(11) DEFAULT NULL,
  `ID_Tipo_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formula`
--

INSERT INTO `formula` (`id_Formula`, `nro_Formula`, `ID_Producto`, `Cantidad`, `Nro_Etapa`, `ID_Tipo_Producto`) VALUES
(1, 1, 'SAM-SIM-9271', 1, 1, 2),
(2, 1, 'LCD-32-0001', 1, 1, 1),
(3, 1, 'PLA-MAIN-0003', 1, 1, 2),
(4, 1, 'PPA-50-0003', 1, 2, 2),
(5, 1, 'TEL-32-0001', 2, 3, 3),
(6, 1, 'CAJ-50-0003', 1, 3, 3),
(7, 2, 'CAJ-32-0001', 1, 3, 3),
(8, 2, 'PPA-32-0001', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Codigo_Producto` varchar(255) NOT NULL,
  `ID_Tipo_Producto` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Stock` int(11) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `Barcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Codigo_Producto`, `ID_Tipo_Producto`, `Descripcion`, `Stock`, `ID_Proveedor`, `Barcode`) VALUES
('CAJ-32-0001', 3, 'Caja televisor 32\"', 710, 1, 'CAJ-32-0001'),
('CAJ-50-0003', 3, 'Caja televisor 50\"', 533, 3, 'CAJ-50-0003'),
('CAJ-65-0004', 3, 'Caja televisor 65\"', 645, 1, 'CAJ-65-0004'),
('CON-32-0001', 3, 'Control remoto 32\"', 300, 3, 'CON-32-0001'),
('CON-32-0002', 3, 'Control remoto 32\" Teclado', 100, 3, 'CON-32-0002'),
('CON-65-0004', 3, 'Control remoto 65\"', 200, 3, 'CON-54-0004'),
('CON-65-0005', 3, 'Control remoto 65\" Teclado', 50, 3, 'CON-65-0005'),
('LCD-32-0001', 1, 'Televisor 32\"', 300, 1, 'LCD-32-0001'),
('LCD-32-0002', 1, 'Televisor 32\" (Power)', 200, 1, 'LCD-32-0002'),
('LCD-50-0003', 1, 'Televisor 50\"', 300, 1, 'LCD-58-0003'),
('LCD-65-0004', 1, 'Televisor 65\"', 500, 1, 'LCD-65-0004'),
('MANGAR-0001', 3, 'Manual/Garantia', 300, 1, 'MANGAR-0001'),
('MANGAR-0002', 3, 'Manual/Garantia', 450, 3, 'MANGAR-0002'),
('PLA-MAIN-0001', 2, 'Placa Main 32\"', 700, 2, 'PLA-MAIN-0001'),
('PLA-MAIN-0003', 2, 'Placa Main 50\"', 600, 2, 'PLA-MAIN-0003'),
('PLA-MAIN-0004', 2, 'Placa Main 65\"', 500, 2, 'PLA-MAIN-0004'),
('PLA-POW-0001', 2, 'Placa Power 32\"', 200, 2, 'PLA-POW-0001'),
('PLA-POW-0003', 2, 'Placa Power 50\"', 800, 2, 'PLA-POW-0003'),
('PLA-POW-0004', 2, 'Placa Power 65\"', 750, 2, 'PLA-POW-0004'),
('PPA-32-0001', 2, 'Pantalla 32\"', 500, 3, 'PPA-32-0001'),
('PPA-50-0003', 2, 'Pantalla 50\"', 400, 3, 'PPA-50-0003'),
('PPA-65-0004', 2, 'Pantalla 65\"', 300, 3, 'PPA-65-0004'),
('SAM-SIM-9271', 2, 'Placa SIM', 457, 1, 'SAM-SIM-9271'),
('TEL-32-0001', 3, 'Telgopor televisor 32\"', 600, 2, 'TEL-32-0001'),
('TEL-50-0003', 3, 'Telgopor televisor 50\"', 560, 2, 'TEL-50-0003'),
('TEL-65-0004', 3, 'Telgopor televisor 65\"', 490, 2, 'TEL-65-0004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_Proveedor`, `Nombre`, `Contacto`, `Direccion`) VALUES
(1, 'SAMSUNG', '2964111111', 'SAN MARTIN 1'),
(2, 'FABRICA', '2964222222', 'SAN MARTIN 2'),
(3, 'PHILLIPS', '2964333333', 'SAN MARTIN 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `ID_Tipo_Producto` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`ID_Tipo_Producto`, `Descripcion`) VALUES
(1, 'Producto Final'),
(2, 'Ensamble'),
(3, 'Empaque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_produccion`
--

CREATE TABLE `vale_produccion` (
  `ID_Vale` int(11) NOT NULL,
  `Codigo_Padre` varchar(255) DEFAULT NULL,
  `Fecha` date NOT NULL,
  `ID_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vale_produccion`
--

INSERT INTO `vale_produccion` (`ID_Vale`, `Codigo_Padre`, `Fecha`, `ID_Usuario`) VALUES
(1, 'LCD-32-0001', '2024-09-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_produccion_detalle`
--

CREATE TABLE `vale_produccion_detalle` (
  `ID_Detalle` int(11) NOT NULL,
  `ID_Vale` int(11) DEFAULT NULL,
  `Codigo_Hijo` varchar(255) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vale_produccion_detalle`
--

INSERT INTO `vale_produccion_detalle` (`ID_Detalle`, `ID_Vale`, `Codigo_Hijo`, `Cantidad`) VALUES
(1, 1, 'PPA-50-0003', 5),
(2, 1, 'TEL-32-0001', 10),
(3, 1, 'PLA-MAIN-0003', 5),
(4, 1, 'PLA-POW-0001', 5),
(5, 1, 'CAJ-50-0003', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`ID_Etapa`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`id_Formula`) USING BTREE,
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `Nro_Etapa` (`Nro_Etapa`),
  ADD KEY `fk_tipo_producto` (`ID_Tipo_Producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Codigo_Producto`),
  ADD KEY `ID_Tipo_Producto` (`ID_Tipo_Producto`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`ID_Tipo_Producto`);

--
-- Indices de la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD PRIMARY KEY (`ID_Vale`),
  ADD KEY `Codigo_Padre` (`Codigo_Padre`);

--
-- Indices de la tabla `vale_produccion_detalle`
--
ALTER TABLE `vale_produccion_detalle`
  ADD PRIMARY KEY (`ID_Detalle`),
  ADD KEY `ID_Vale` (`ID_Vale`),
  ADD KEY `Codigo_Hijo` (`Codigo_Hijo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `id_Formula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  MODIFY `ID_Vale` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vale_produccion_detalle`
--
ALTER TABLE `vale_produccion_detalle`
  MODIFY `ID_Detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formula`
--
ALTER TABLE `formula`
  ADD CONSTRAINT `fk_tipo_producto` FOREIGN KEY (`ID_Tipo_Producto`) REFERENCES `producto` (`ID_Tipo_Producto`),
  ADD CONSTRAINT `formula_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`Codigo_Producto`),
  ADD CONSTRAINT `formula_ibfk_2` FOREIGN KEY (`Nro_Etapa`) REFERENCES `etapa` (`ID_Etapa`),
  ADD CONSTRAINT `formula_ibfk_3` FOREIGN KEY (`ID_Tipo_Producto`) REFERENCES `tipo_producto` (`ID_Tipo_Producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_Tipo_Producto`) REFERENCES `tipo_producto` (`ID_Tipo_Producto`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD CONSTRAINT `vale_produccion_ibfk_1` FOREIGN KEY (`Codigo_Padre`) REFERENCES `producto` (`Codigo_Producto`);

--
-- Filtros para la tabla `vale_produccion_detalle`
--
ALTER TABLE `vale_produccion_detalle`
  ADD CONSTRAINT `vale_produccion_detalle_ibfk_1` FOREIGN KEY (`ID_Vale`) REFERENCES `vale_produccion` (`ID_Vale`),
  ADD CONSTRAINT `vale_produccion_detalle_ibfk_2` FOREIGN KEY (`Codigo_Hijo`) REFERENCES `producto` (`Codigo_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
