-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 02:40:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema de stock`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `ID_FORMULA` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha_de_Fabricacion` datetime NOT NULL,
  `ID_Orden_de_carga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 1, 'Televisor 32&#34;', 700, 1, 'LCD-32-0001'),
(2, 1, 'Televisor 32&#34; Power', 650, 1, 'LCD-32-0002'),
(3, 1, 'Televisor 50&#34;', 650, 3, 'LCD-50-0003'),
(4, 1, 'Televisor 65&#34;', 700, 3, 'LCD-65-0004'),
(5, 2, 'Placa Main 32&#34;', 1000, 2, 'PLA-MAIN-0001'),
(6, 2, 'Placa Main 32&#34; Power', 850, 2, 'PLA-MAIN-0002'),
(7, 2, 'Placa Main 50&#34;', 600, 2, 'PLA-MAIN-0003'),
(8, 2, 'Placa Main 65&#34;', 750, 2, 'PLA-MAIN-0004'),
(9, 2, 'Placa Power 32&#34;', 200, 2, 'PLA-POW-0001'),
(10, 2, 'Placa Power  50&#34;', 800, 2, 'PLA-POW-0004'),
(11, 2, 'Telgopor televisor 32&#34;', 600, 1, 'TEL-32-0001'),
(12, 2, 'Telgopor televisor 50&#34;', 560, 3, 'TEL-50-0003'),
(13, 2, 'Telgopor televisor 65&#34;', 490, 3, 'TEL-65-0004'),
(14, 2, 'Caja televisor 32&#34;', 710, 1, 'CAJ-32-0001'),
(15, 2, 'Caja televisor 50&#34;', 533, 3, 'CAJ-50-0003'),
(16, 2, 'Caja televisor 65&#34;', 645, 3, 'CAJ-65-0004'),
(17, 2, 'Control remoto 32&#34;', 300, 3, 'CON-32-0001'),
(18, 2, 'Control remoto 32&#34; Teclado', 100, 3, 'CON-32-0002'),
(19, 2, 'Control remoto 50&#34; 65&#34;', 200, 3, 'CON-65-0004'),
(20, 2, 'Control remoto 50&#34; 65&#34; Teclado', 300, 3, 'CON-65-0005'),
(21, 3, 'Manual/Garantia 32&#34;', 300, 1, 'MANGAR-0001'),
(22, 3, 'Manual/Garantia 50&#34; 65&#34;', 450, 3, 'MANGAR-0002');

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
  `nombre` varchar(255) NOT NULL,
  `Contacto` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_Proveedor`, `nombre`, `Contacto`, `Direccion`) VALUES
(1, 'Samsung', '2964111111', 'San Martin 1'),
(2, 'Fabrica', '2964222222', 'Belgrano 2'),
(3, 'Phillips', '2964333333', 'Thorne 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_Rol` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_Rol`, `Descripcion`) VALUES
(1, 'Administrador'),
(2, 'Usuario'),
(3, 'Supervisor'),
(4, 'Operador'),
(5, 'Invitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_material`
--

CREATE TABLE `tipo_material` (
  `ID_Tipo_Producto` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_material`
--

INSERT INTO `tipo_material` (`ID_Tipo_Producto`, `Descripcion`) VALUES
(1, 'Producto terminado'),
(2, 'Producto semielaborado'),
(3, 'Componente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `ID_rol` int(11) DEFAULT NULL,
  `ID_ESTADO_DE_USUARIO` int(11) DEFAULT NULL,
  `FECHA_DE_CREACION` datetime NOT NULL,
  `FECHA_DE_CAMBIO_DE_ESTADO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Username`, `Contraseña`, `ID_rol`, `ID_ESTADO_DE_USUARIO`, `FECHA_DE_CREACION`, `FECHA_DE_CAMBIO_DE_ESTADO`) VALUES
(1, 'admin', 'admin123', 1, 1, '2024-09-20 08:00:00', '2024-09-20 10:00:00'),
(2, 'user1', 'user123', 2, 1, '2024-09-19 09:30:00', NULL),
(3, 'supervisor', 'super123', 3, 1, '2024-09-18 07:45:00', '2024-09-19 15:00:00'),
(4, 'operador', 'oper123', 4, 2, '2024-09-17 14:15:00', NULL),
(5, 'guest', 'guest123', 2, 3, '2024-09-16 12:00:00', '2024-09-18 09:30:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_consumo`
--

CREATE TABLE `vale_consumo` (
  `ID_VALE_DE_CONSUMO` int(11) NOT NULL,
  `FECHA_DE_MODIFICACION` date NOT NULL,
  `ID_VALE_DE_PRODUCCION` int(11) DEFAULT NULL,
  `producto` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_produccion`
--

CREATE TABLE `vale_produccion` (
  `ID_VALE_DE_PRODUCCION` int(11) NOT NULL,
  `ID_ORDEN_DE_PRODUCCION` int(11) DEFAULT NULL,
  `CONFIRMACION_DE_PUESTO` varchar(255) DEFAULT NULL,
  `NUMERO_DEL_VALE` int(11) DEFAULT NULL,
  `ID_Etapa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD PRIMARY KEY (`ID_FORMULA`),
  ADD KEY `ID_Orden_de_carga` (`ID_Orden_de_carga`);

--
-- Indices de la tabla `material_stock`
--
ALTER TABLE `material_stock`
  ADD PRIMARY KEY (`Codigo_Producto`),
  ADD KEY `ID_Tipo_Material` (`ID_Tipo_Material`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`);

--
-- Indices de la tabla `op_produccion`
--
ALTER TABLE `op_produccion`
  ADD PRIMARY KEY (`ID_op_PRODUCCION`),
  ADD KEY `ID_ORDEN_DE_Produccion` (`ID_ORDEN_DE_Produccion`),
  ADD KEY `id_produccion` (`id_produccion`),
  ADD KEY `fk_nombre` (`nombre`);

--
-- Indices de la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  ADD PRIMARY KEY (`ID_Orden_Carga`),
  ADD KEY `ID_MATERIAL_stock` (`ID_MATERIAL_stock`);

--
-- Indices de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD PRIMARY KEY (`ID_Op`),
  ADD KEY `Estado` (`Estado`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `proceso_validacion`
--
ALTER TABLE `proceso_validacion`
  ADD PRIMARY KEY (`ID_PV`),
  ADD KEY `ID_PRODUCCION` (`ID_PRODUCCION`),
  ADD KEY `ID_Etapa` (`ID_Etapa`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`ID_PRODUCCION`),
  ADD UNIQUE KEY `unique_nombre` (`Nombre`),
  ADD KEY `ID_Formula` (`ID_Formula`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `tipo_material`
--
ALTER TABLE `tipo_material`
  ADD PRIMARY KEY (`ID_Tipo_Producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `ID_rol` (`ID_rol`),
  ADD KEY `ID_ESTADO_DE_USUARIO` (`ID_ESTADO_DE_USUARIO`);

--
-- Indices de la tabla `vale_consumo`
--
ALTER TABLE `vale_consumo`
  ADD PRIMARY KEY (`ID_VALE_DE_CONSUMO`),
  ADD KEY `ID_VALE_DE_PRODUCCION` (`ID_VALE_DE_PRODUCCION`);

--
-- Indices de la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD PRIMARY KEY (`ID_VALE_DE_PRODUCCION`),
  ADD KEY `ID_ORDEN_DE_PRODUCCION` (`ID_ORDEN_DE_PRODUCCION`),
  ADD KEY `ID_Etapa` (`ID_Etapa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  MODIFY `ID_Op` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formula`
--
ALTER TABLE `formula`
  ADD CONSTRAINT `formula_ibfk_1` FOREIGN KEY (`ID_Orden_de_carga`) REFERENCES `orden_carga` (`ID_Orden_Carga`);

--
-- Filtros para la tabla `material_stock`
--
ALTER TABLE `material_stock`
  ADD CONSTRAINT `material_stock_ibfk_1` FOREIGN KEY (`ID_Tipo_Material`) REFERENCES `tipo_material` (`ID_Tipo_Producto`),
  ADD CONSTRAINT `material_stock_ibfk_2` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `op_produccion`
--
ALTER TABLE `op_produccion`
  ADD CONSTRAINT `fk_nombre` FOREIGN KEY (`nombre`) REFERENCES `produccion` (`Nombre`),
  ADD CONSTRAINT `fk_produccion` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`ID_PRODUCCION`),
  ADD CONSTRAINT `op_produccion_ibfk_1` FOREIGN KEY (`ID_ORDEN_DE_Produccion`) REFERENCES `orden_produccion` (`ID_Op`),
  ADD CONSTRAINT `op_produccion_ibfk_2` FOREIGN KEY (`id_produccion`) REFERENCES `produccion` (`ID_PRODUCCION`);

--
-- Filtros para la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  ADD CONSTRAINT `orden_carga_ibfk_1` FOREIGN KEY (`ID_MATERIAL_stock`) REFERENCES `material_stock` (`Codigo_Producto`);

--
-- Filtros para la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD CONSTRAINT `orden_produccion_ibfk_1` FOREIGN KEY (`Estado`) REFERENCES `estado_op` (`ID_Estado`),
  ADD CONSTRAINT `orden_produccion_ibfk_2` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `proceso_validacion`
--
ALTER TABLE `proceso_validacion`
  ADD CONSTRAINT `proceso_validacion_ibfk_1` FOREIGN KEY (`ID_PRODUCCION`) REFERENCES `produccion` (`ID_PRODUCCION`),
  ADD CONSTRAINT `proceso_validacion_ibfk_2` FOREIGN KEY (`ID_Etapa`) REFERENCES `etapa` (`ID_Etapa`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`ID_Formula`) REFERENCES `formula` (`ID_FORMULA`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_Rol`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_ESTADO_DE_USUARIO`) REFERENCES `estado_usuario` (`ID_ESTADO_DE_USUARIO`);

--
-- Filtros para la tabla `vale_consumo`
--
ALTER TABLE `vale_consumo`
  ADD CONSTRAINT `vale_consumo_ibfk_1` FOREIGN KEY (`ID_VALE_DE_PRODUCCION`) REFERENCES `vale_produccion` (`ID_VALE_DE_PRODUCCION`);

--
-- Filtros para la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD CONSTRAINT `vale_produccion_ibfk_1` FOREIGN KEY (`ID_ORDEN_DE_PRODUCCION`) REFERENCES `orden_produccion` (`ID_Op`),
  ADD CONSTRAINT `vale_produccion_ibfk_2` FOREIGN KEY (`ID_Etapa`) REFERENCES `etapa` (`ID_Etapa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
