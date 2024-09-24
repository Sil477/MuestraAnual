-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 09:47:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `linea_de_produccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_op`
--

CREATE TABLE `estado_op` (
  `ID_Estado` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_op`
--

INSERT INTO `estado_op` (`ID_Estado`, `nombre`) VALUES
(1, 'En Proceso'),
(2, 'Finalizada'),
(3, 'Pendiente'),
(4, 'Cancelada'),
(5, 'Aprobada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `ID_ESTADO_DE_USUARIO` int(11) NOT NULL,
  `ESTADO_DE_USUARIO` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`ID_ESTADO_DE_USUARIO`, `ESTADO_DE_USUARIO`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Suspendido'),
(4, 'Eliminado'),
(5, 'Pendiente de Verificación');

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
  `ID_Tipo_Producto` int(11) DEFAULT NULL,
  `fecha_de_alta` date DEFAULT NULL,
  `fecha_de_baja` date DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formula`
--

INSERT INTO `formula` (`id_Formula`, `nro_Formula`, `ID_Producto`, `Cantidad`, `Nro_Etapa`, `ID_Tipo_Producto`, `fecha_de_alta`, `fecha_de_baja`, `estado`) VALUES
(1, 1, 'SAM-SIM-9271', 1, 1, 2, NULL, NULL, NULL),
(2, 1, 'LCD-32-0001', 1, 1, 1, NULL, NULL, NULL),
(3, 1, 'PLA-MAIN-0003', 1, 1, 2, NULL, NULL, NULL),
(4, 1, 'PPA-50-0003', 1, 2, 2, NULL, NULL, NULL),
(5, 1, 'TEL-32-0001', 2, 3, 3, NULL, NULL, NULL),
(6, 1, 'CAJ-50-0003', 1, 3, 3, NULL, NULL, NULL),
(7, 2, 'CAJ-32-0001', 1, 3, 3, NULL, NULL, NULL),
(8, 2, 'PPA-32-0001', 1, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material_stock`
--

CREATE TABLE `material_stock` (
  `Codigo_Producto` int(11) NOT NULL,
  `ID_Tipo_Material` int(11) DEFAULT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `Codigo_Barra` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `material_stock`
--

INSERT INTO `material_stock` (`Codigo_Producto`, `ID_Tipo_Material`, `Descripcion`, `CANTIDAD`, `ID_Proveedor`, `Codigo_Barra`) VALUES
(1, 1, 'Televisor 32\"', 700, 1, 'LCD-32-0001'),
(2, 1, 'Televisor 32\" Power', 650, 1, 'LCD-32-0002'),
(3, 1, 'Televisor 50\"', 650, 3, 'LCD-50-0003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `op_produccion`
--

CREATE TABLE `op_produccion` (
  `ID_op_PRODUCCION` int(11) NOT NULL,
  `ID_ORDEN_DE_Produccion` int(11) DEFAULT NULL,
  `id_produccion` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_carga`
--

CREATE TABLE `orden_carga` (
  `ID_Orden_Carga` int(11) NOT NULL,
  `ID_MATERIAL_stock` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_produccion`
--

CREATE TABLE `orden_produccion` (
  `ID_Op` int(11) NOT NULL,
  `Fecha_Inicio_OP` date NOT NULL,
  `Fecha_Cierre_OP` date DEFAULT NULL,
  `Cantidad_a_Producir` int(11) NOT NULL,
  `id_Formula` int(11) NOT NULL,
  `Estado` int(11) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_validacion`
--

CREATE TABLE `proceso_validacion` (
  `ID_PV` int(11) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `ID_PRODUCCION` int(11) DEFAULT NULL,
  `ID_Etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `ID_PRODUCCION` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `ID_Formula` int(11) DEFAULT NULL,
  `Unidad_de_Medida` varchar(255) NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Nombre_Proveedor` varchar(255) NOT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_Proveedor`, `Nombre_Proveedor`, `Contacto`, `Direccion`) VALUES
(1, 'SAMSUNG', '2964111111', 'SAN MARTIN 1'),
(2, 'FABRICA', '2964222222', 'SAN MARTIN 2'),
(3, 'PHILLIPS', '2964333333', 'SAN MARTIN 3'),
(4, 'NOKIA', '2964444444', 'SAN MARTIN 4');

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
(1, 'Tipo A'),
(2, 'Tipo B'),
(3, 'Tipo C');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_op`
--
ALTER TABLE `estado_op`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`ID_ESTADO_DE_USUARIO`);

--
-- Indices de la tabla `etapa`
--
ALTER TABLE `etapa`
  ADD PRIMARY KEY (`ID_Etapa`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`id_Formula`),
  ADD KEY `fk_etapa` (`Nro_Etapa`),
  ADD KEY `fk_tipo_producto` (`ID_Tipo_Producto`);

--
-- Indices de la tabla `material_stock`
--
ALTER TABLE `material_stock`
  ADD PRIMARY KEY (`Codigo_Producto`),
  ADD KEY `fk_material_proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `op_produccion`
--
ALTER TABLE `op_produccion`
  ADD PRIMARY KEY (`ID_op_PRODUCCION`);

--
-- Indices de la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  ADD PRIMARY KEY (`ID_Orden_Carga`);

--
-- Indices de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD PRIMARY KEY (`ID_Op`),
  ADD KEY `fk_orden_estado` (`Estado`),
  ADD KEY `fk_orden_formula` (`id_Formula`);

--
-- Indices de la tabla `proceso_validacion`
--
ALTER TABLE `proceso_validacion`
  ADD PRIMARY KEY (`ID_PV`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`ID_PRODUCCION`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_op`
--
ALTER TABLE `estado_op`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `ID_ESTADO_DE_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `etapa`
--
ALTER TABLE `etapa`
  MODIFY `ID_Etapa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `id_Formula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `material_stock`
--
ALTER TABLE `material_stock`
  MODIFY `Codigo_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `op_produccion`
--
ALTER TABLE `op_produccion`
  MODIFY `ID_op_PRODUCCION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  MODIFY `ID_Orden_Carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  MODIFY `ID_Op` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proceso_validacion`
--
ALTER TABLE `proceso_validacion`
  MODIFY `ID_PV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `ID_PRODUCCION` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `ID_Tipo_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formula`
--
ALTER TABLE `formula`
  ADD CONSTRAINT `fk_etapa` FOREIGN KEY (`Nro_Etapa`) REFERENCES `etapa` (`ID_Etapa`),
  ADD CONSTRAINT `fk_tipo_producto` FOREIGN KEY (`ID_Tipo_Producto`) REFERENCES `tipo_producto` (`ID_Tipo_Producto`);

--
-- Filtros para la tabla `material_stock`
--
ALTER TABLE `material_stock`
  ADD CONSTRAINT `fk_material_proveedor` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD CONSTRAINT `fk_orden_estado` FOREIGN KEY (`Estado`) REFERENCES `estado_op` (`ID_Estado`),
  ADD CONSTRAINT `fk_orden_formula` FOREIGN KEY (`id_Formula`) REFERENCES `formula` (`id_Formula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
