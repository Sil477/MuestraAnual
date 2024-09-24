-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 02:34:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `linea_produccion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `id_formula` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formula`
--

INSERT INTO `formula` (`id_formula`, `descripcion`, `id_producto`) VALUES
(1, 'Proceso de ensamblaje para televisor LED 50\"', 1),
(2, 'Proceso de ensamblaje para televisor LED 32\"', 2),
(3, 'Proceso de ensamblaje para Smart TV 4K 55\"', 3),
(4, 'Proceso de ensamblaje para televisor OLED 65\"', 4),
(5, 'Proceso de ensamblaje para televisor QLED 75\"', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula_materia_prima`
--

CREATE TABLE `formula_materia_prima` (
  `id_formula` int(11) NOT NULL,
  `id_materia_prima` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formula_materia_prima`
--

INSERT INTO `formula_materia_prima` (`id_formula`, `id_materia_prima`, `cantidad_necesaria`) VALUES
(1, 1, 1.00),
(1, 2, 1.00),
(1, 3, 1.00),
(1, 4, 1.00),
(1, 5, 2.00),
(1, 6, 1.00),
(1, 7, 3.00),
(1, 8, 1.00),
(1, 9, 10.00),
(2, 1, 1.00),
(2, 2, 1.00),
(2, 3, 1.00),
(2, 4, 1.00),
(2, 5, 2.00),
(2, 6, 1.00),
(2, 7, 2.00),
(2, 8, 1.00),
(2, 9, 8.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias_primas`
--

CREATE TABLE `materias_primas` (
  `id_materia_prima` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materias_primas`
--

INSERT INTO `materias_primas` (`id_materia_prima`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad_stock`) VALUES
(1, 'PLA-LED-0001', 'Pantalla LED 50\"', 'Pantalla LED de 50 pulgadas', 150.00, 90),
(2, 'PLA-MAIN-0004', 'Placa Base', 'Placa base principal para el televisor', 50.00, 117),
(3, 'POW-SUPP-0007', 'Fuente de Alimentación', 'Fuente de alimentación para televisores', 25.00, 200),
(4, 'FRM-PLAS-0010', 'Marco de Plástico', 'Marco de plástico para la estructura externa del televisor', 10.00, 300),
(5, 'SPK-SOUND-0020', 'Altavoces', 'Altavoces estéreo de 10W', 15.00, 180),
(6, 'REM-CON-0032', 'Control Remoto', 'Control remoto para el televisor', 8.00, 250),
(7, 'CON-HDMI-USB-0045', 'Conectores HDMI y USB', 'Conectores HDMI, USB y otros puertos', 5.00, 300),
(8, 'CAB-POW-0050', 'Cable de Alimentación', 'Cable de alimentación estándar', 3.00, 500),
(9, 'SCW-TORN-0060', 'Tornillos y Sujetadores', 'Juego de tornillos y sujetadores', 1.00, 980);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_carga`
--

CREATE TABLE `orden_carga` (
  `id_orden_carga` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_orden_produccion` int(11) DEFAULT NULL,
  `id_materia_prima` int(11) DEFAULT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL,
  `descuento_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_carga`
--

INSERT INTO `orden_carga` (`id_orden_carga`, `fecha`, `id_orden_produccion`, `id_materia_prima`, `cantidad_necesaria`, `descuento_stock`) VALUES
(1, '2024-09-22', 1, 1, 10.00, 10),
(2, '2024-09-22', 1, 2, 10.00, 10),
(3, '2024-09-22', 1, 3, 10.00, 10),
(4, '2024-09-22', 1, 4, 10.00, 10),
(5, '2024-09-22', 1, 5, 20.00, 20),
(6, '2024-09-22', 1, 6, 10.00, 10),
(7, '2024-09-22', 1, 1, 10.00, 10),
(8, '2024-09-22', 1, 2, 10.00, 10),
(9, '2024-09-22', 1, 3, 10.00, 10),
(10, '2024-09-22', 1, 4, 10.00, 10),
(11, '2024-09-22', 1, 5, 20.00, 20),
(12, '2024-09-22', 1, 6, 10.00, 10),
(13, '2024-09-22', 1, 7, 30.00, 30),
(14, '2024-09-22', 1, 8, 10.00, 10),
(15, '2024-09-22', 1, 9, 100.00, 100),
(16, '2024-09-22', 8, 1, 10.00, NULL),
(17, '2024-09-22', 8, 1, 10.00, NULL),
(18, '2024-09-22', 1, 2, 10.00, 10),
(19, '2024-09-22', 1, 2, 10.00, 10),
(20, '2024-09-22', 1, 1, 10.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_produccion`
--

CREATE TABLE `orden_produccion` (
  `id_orden_produccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_produccion`
--

INSERT INTO `orden_produccion` (`id_orden_produccion`, `fecha`, `id_producto`, `cantidad`) VALUES
(1, '2024-09-22', 1, 10),
(2, '2024-09-22', 2, 5),
(3, '2024-09-23', 3, 7),
(4, '2024-09-22', 1, 3),
(5, '2024-09-22', 1, 1),
(6, '2024-09-22', 1, 1),
(7, '2024-09-22', 1, 3),
(8, '2024-09-22', 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_detalle`
--

CREATE TABLE `produccion_detalle` (
  `id_detalle_produccion` int(11) NOT NULL,
  `id_vale_produccion` int(11) DEFAULT NULL,
  `id_materia_prima` int(11) DEFAULT NULL,
  `cantidad_procesada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `produccion_detalle`
--

INSERT INTO `produccion_detalle` (`id_detalle_produccion`, `id_vale_produccion`, `id_materia_prima`, `cantidad_procesada`) VALUES
(1, 1, 1, 10),
(2, 1, 2, 10),
(3, 1, 3, 10),
(4, 2, 4, 10),
(5, 2, 5, 20),
(6, 2, 7, 30),
(7, 3, 6, 10),
(8, 3, 8, 10),
(9, 3, 9, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `cantidad_stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `codigo`, `nombre`, `descripcion`, `precio`, `cantidad_stock`) VALUES
(1, 'TV-LED-50-001', 'Televisor LED 50\"', 'Televisor LED de 50 pulgadas Full HD', 500.00, 50),
(2, 'TV-LED-32-002', 'Televisor LED 32\"', 'Televisor LED de 32 pulgadas HD', 300.00, 75),
(3, 'TV-SMART-4K-55-003', 'Televisor Smart TV 4K 55\"', 'Televisor Smart TV 4K de 55 pulgadas', 700.00, 40),
(4, 'TV-OLED-65-004', 'Televisor OLED 65\"', 'Televisor OLED de 65 pulgadas con HDR', 1200.00, 30),
(5, 'TV-QLED-75-005', 'Televisor QLED 75\"', 'Televisor QLED de 75 pulgadas con HDR', 1500.00, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id_puesto` int(11) NOT NULL,
  `nombre_puesto` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id_puesto`, `nombre_puesto`, `descripcion`) VALUES
(1, 'Puesto 1: Montaje de Componentes Principales', 'Ensamblaje de la pantalla, placa base, y fuente de alimentación'),
(2, 'Puesto 2: Integración de Componentes Secundarios', 'Integración de marco, altavoces, y conectores HDMI/USB'),
(3, 'Puesto 3: Finalización y Empaque', 'Incorporación del control remoto, cable de alimentación y finalización del producto con pruebas de calidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'adm_usuarios'),
(2, 'adm_formula'),
(3, 'adm_oc'),
(4, 'adm_op'),
(5, 'adm_producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `fecha_craacion` date DEFAULT curdate(),
  `fecha_eliminacion` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password`, `id_rol`, `fecha_craacion`, `fecha_eliminacion`) VALUES
(5, 'adm_ariel', '$2y$10$fcD91sh2s.AzEJQQj4hkveqo6zVOfcFwsgkbHm0HRxzzda4M4Eg7O', 2, '2024-09-21', '2024-09-21'),
(18, 'adm_fernando', '$2y$10$fvVe9F70iYylGmkAwkcmBeGLLx3/whIFiAc2ovhSZcR4ibqI3KZ1u', 1, '2024-09-22', '2024-09-22'),
(19, 'adm_chavez', '$2y$10$6NcTHoTzXnJTh2XCv9/qI.7HRYXzgGFpg5rn47vhZrWmdPI.UVwli', 5, '2024-09-22', '2024-09-22'),
(20, 'adm_blanco', '$2y$10$QcCapelL8XVKqDnGl421L.X93SkPW6UnwbSzL58cZ9wmgJWwqzV0K', 4, '2024-09-22', '2024-09-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vale_produccion`
--

CREATE TABLE `vale_produccion` (
  `id_vale_produccion` int(11) NOT NULL,
  `id_orden_produccion` int(11) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `descripcion_proceso` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vale_produccion`
--

INSERT INTO `vale_produccion` (`id_vale_produccion`, `id_orden_produccion`, `id_puesto`, `descripcion_proceso`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, 1, 1, 'Montaje de pantalla, placa base, y fuente de alimentación', '2024-09-22', '2024-09-23', 'Completado'),
(2, 1, 2, 'Integración de marco, altavoces y conectores HDMI/USB', '2024-09-23', '2024-09-24', 'Completado'),
(3, 1, 3, 'Incorporación del control remoto, cable de alimentación y empaquetado final', '2024-09-24', '2024-09-25', 'Completado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`id_formula`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `formula_materia_prima`
--
ALTER TABLE `formula_materia_prima`
  ADD PRIMARY KEY (`id_formula`,`id_materia_prima`),
  ADD KEY `id_materia_prima` (`id_materia_prima`);

--
-- Indices de la tabla `materias_primas`
--
ALTER TABLE `materias_primas`
  ADD PRIMARY KEY (`id_materia_prima`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  ADD PRIMARY KEY (`id_orden_carga`),
  ADD KEY `id_orden_produccion` (`id_orden_produccion`),
  ADD KEY `id_materia_prima` (`id_materia_prima`);

--
-- Indices de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD PRIMARY KEY (`id_orden_produccion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `produccion_detalle`
--
ALTER TABLE `produccion_detalle`
  ADD PRIMARY KEY (`id_detalle_produccion`),
  ADD KEY `id_vale_produccion` (`id_vale_produccion`),
  ADD KEY `id_materia_prima` (`id_materia_prima`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id_puesto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD PRIMARY KEY (`id_vale_produccion`),
  ADD KEY `id_orden_produccion` (`id_orden_produccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `id_formula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `materias_primas`
--
ALTER TABLE `materias_primas`
  MODIFY `id_materia_prima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  MODIFY `id_orden_carga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  MODIFY `id_orden_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `produccion_detalle`
--
ALTER TABLE `produccion_detalle`
  MODIFY `id_detalle_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id_puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  MODIFY `id_vale_produccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formula`
--
ALTER TABLE `formula`
  ADD CONSTRAINT `formula_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `formula_materia_prima`
--
ALTER TABLE `formula_materia_prima`
  ADD CONSTRAINT `formula_materia_prima_ibfk_1` FOREIGN KEY (`id_formula`) REFERENCES `formula` (`id_formula`),
  ADD CONSTRAINT `formula_materia_prima_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materias_primas` (`id_materia_prima`);

--
-- Filtros para la tabla `orden_carga`
--
ALTER TABLE `orden_carga`
  ADD CONSTRAINT `orden_carga_ibfk_1` FOREIGN KEY (`id_orden_produccion`) REFERENCES `orden_produccion` (`id_orden_produccion`),
  ADD CONSTRAINT `orden_carga_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materias_primas` (`id_materia_prima`);

--
-- Filtros para la tabla `orden_produccion`
--
ALTER TABLE `orden_produccion`
  ADD CONSTRAINT `orden_produccion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `produccion_detalle`
--
ALTER TABLE `produccion_detalle`
  ADD CONSTRAINT `produccion_detalle_ibfk_1` FOREIGN KEY (`id_vale_produccion`) REFERENCES `vale_produccion` (`id_vale_produccion`),
  ADD CONSTRAINT `produccion_detalle_ibfk_2` FOREIGN KEY (`id_materia_prima`) REFERENCES `materias_primas` (`id_materia_prima`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

--
-- Filtros para la tabla `vale_produccion`
--
ALTER TABLE `vale_produccion`
  ADD CONSTRAINT `vale_produccion_ibfk_1` FOREIGN KEY (`id_orden_produccion`) REFERENCES `orden_produccion` (`id_orden_produccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
