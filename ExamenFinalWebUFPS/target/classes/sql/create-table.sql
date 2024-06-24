-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2024 a las 17:38:48
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
-- Base de datos: `semillero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id` int(11) NOT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `actividad` varchar(500) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `resultado` text DEFAULT NULL,
  `producto` text DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id`, `proyecto_id`, `actividad`, `descripcion`, `fecha_inicio`, `fecha_fin`, `resultado`, `producto`, `responsable_id`) VALUES
(5, 1, 'Desarrollo de diseño', 'Lalalala', '2023-01-01', '2023-03-31', 'Lalalala', 'Diseño', NULL),
(6, 1, 'Modelo de datos', 'Lalalala', '2023-04-01', '2024-04-30', 'Lalalala', 'Modelo', NULL),
(7, 2, 'Ganar los partidos de primera ronda', 'Lalalala', '2024-07-15', '2024-11-01', 'Lalalala', 'Muchos puntos', NULL),
(8, 2, 'Ganar la final', 'Lalalala', '2024-11-12', '2024-12-14', 'Lalalala', 'Copa', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`) VALUES
(1, 'Ciencias Agrarias'),
(2, 'Ingenierías'),
(3, 'Ciencias de la Salud y el Deporte'),
(4, 'Ciencias Humanas'),
(5, 'Lingüística, Artes y Letras'),
(6, 'Ciencias Biológicas y del Mar'),
(7, 'Ciencias Sociales'),
(8, 'Ciencias Exactas y de la Tierra'),
(9, 'Navales y de Seguridad'),
(10, 'Multidisciplinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `capacitacion_id` int(11) DEFAULT NULL,
  `integrante_id` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacitacion`
--

CREATE TABLE `capacitacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `objetivo` varchar(500) DEFAULT NULL,
  `fecha_inicio_plan` date DEFAULT NULL,
  `fecha_fin_plan` date DEFAULT NULL,
  `integrante_id` int(11) DEFAULT NULL,
  `asistentes_esperados` int(11) DEFAULT NULL,
  `fecha_inicio_realizada` date DEFAULT NULL,
  `fecha_fin_realizada` date DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `periodo_id` int(11) DEFAULT NULL,
  `semillero_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `capacitacion`
--

INSERT INTO `capacitacion` (`id`, `nombre`, `objetivo`, `fecha_inicio_plan`, `fecha_fin_plan`, `integrante_id`, `asistentes_esperados`, `fecha_inicio_realizada`, `fecha_fin_realizada`, `observaciones`, `periodo_id`, `semillero_id`) VALUES
(1, 'HTML', 'Lalalala', '2024-02-01', '2024-02-08', 1, 15, NULL, NULL, NULL, NULL, NULL),
(2, 'JS', 'Lalalala', '2024-02-01', '2024-02-08', 2, 15, NULL, NULL, NULL, NULL, NULL),
(3, 'Goles', 'Lalalala', '2024-08-01', '2024-08-08', 3, 15, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Departamento de Sistemas e Informática'),
(2, 'Departamento de Ciencias Agrarias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `identificacion` varchar(20) DEFAULT NULL,
  `cvlac` varchar(500) DEFAULT NULL,
  `nivel_formacion_id` int(11) DEFAULT NULL,
  `direccion` varchar(500) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`id`, `codigo`, `nombre`, `identificacion`, `cvlac`, `nivel_formacion_id`, `direccion`, `telefono`, `email`, `fecha_nacimiento`, `departamento_id`) VALUES
(1, '05372', 'Carlos Angarita', '12345678', 'https://', 3, 'Calle', '3111234567', 'carlos@ufps.edu.co', '1984-06-08', 1),
(2, '01234', 'Radamel', '12345673', 'https://', 4, 'Calle', '3111234567', 'rada@ufps.edu.co', '1984-06-08', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `programa_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `codigo`, `nombre`, `email`, `telefono`, `fecha_nacimiento`, `direccion`, `programa_id`) VALUES
(1, '1151111', 'Juan Olmedo', 'juan@ufps.edu.co', '1234567890', '2006-01-01', 'Calle', 1),
(2, '1151112', 'Maria Ovallos', 'maria@ufps.edu.co', '1234567891', '2006-01-01', 'Calle', 1),
(3, '1151113', 'Diana Uribe', 'diana@ufps.edu.co', '1234567892', '2006-01-01', 'Calle', 1),
(4, '1161113', 'Mario Iguaran', 'mario@ufps.edu.co', '1234567892', '2006-01-01', 'Calle', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `nivel_id` int(11) DEFAULT NULL,
  `fecha_realizacion` date DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `nombre`, `nivel_id`, `fecha_realizacion`, `lugar`, `descripcion`) VALUES
(1, 'Red Colsi Norte de Santander 2024', 2, '2024-05-15', 'Pamplona', NULL),
(2, 'Red Colsi Santander', 2, '2024-04-15', 'Bucaramanga', NULL),
(3, 'Red Colsi Nacional 2024', 3, '2024-09-14', 'Cartagena', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento_nivel`
--

CREATE TABLE `evento_nivel` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `evento_nivel`
--

INSERT INTO `evento_nivel` (`id`, `descripcion`) VALUES
(1, 'local'),
(2, 'regional'),
(3, 'nacional'),
(4, 'internacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `sigla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `nombre`, `sigla`) VALUES
(1, 'Grupo de Investigación de Inteligencia Artificial', 'GIDISOFT'),
(2, 'Grupo de Investigación de Inteligencia Artificial', 'GIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscrito`
--

CREATE TABLE `inscrito` (
  `integrante_id` int(11) NOT NULL,
  `periodo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante`
--

CREATE TABLE `integrante` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `semillero_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_ingreso` date DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fecha_retiro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `integrante`
--

INSERT INTO `integrante` (`id`, `estudiante_id`, `semillero_id`, `estado`, `fecha_ingreso`, `rol_id`, `fecha_retiro`) VALUES
(1, 1, 1, 1, '2023-01-01', 1, NULL),
(2, 2, 1, 1, '2023-01-01', 2, NULL),
(3, 4, 2, 1, '2023-07-01', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `id` int(11) NOT NULL,
  `semillero_id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`id`, `semillero_id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 1, 'Aplicaciones Web', 'Lalalala', 1),
(2, 1, 'Sistemas Distribuidos', 'Lalalala', 1),
(3, 2, 'Goleadores', 'Lalalala', 1),
(4, 2, 'Equipos de Colombia', 'Lalalala', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `descripcion`) VALUES
(1, 'Ponente'),
(2, 'Asistente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_formacion`
--

CREATE TABLE `nivel_formacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `nivel_formacion`
--

INSERT INTO `nivel_formacion` (`id`, `nombre`) VALUES
(1, 'Pregrado'),
(2, 'Especialista'),
(3, 'Magister'),
(4, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `id` int(11) NOT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `proyecto_id` int(11) DEFAULT NULL,
  `modalidad_id` int(11) DEFAULT NULL,
  `producto_tipo_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `integrante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id`, `fecha_inicio`, `fecha_fin`, `descripcion`) VALUES
(1, '2023-01-01', '2023-06-30', 'Semestre 2023-1'),
(2, '2023-07-01', '2023-12-31', 'Semestre 2023-2'),
(3, '2024-01-01', '2024-06-30', 'Semestre 2024-1'),
(4, '2024-07-01', '2024-12-31', 'Semestre 2024-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_tipo`
--

CREATE TABLE `producto_tipo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `producto_tipo`
--

INSERT INTO `producto_tipo` (`id`, `descripcion`) VALUES
(1, 'Ponencia'),
(2, 'Artículo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `id` int(11) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id`, `codigo`, `nombre`) VALUES
(1, '115', 'Ingeniería de Sistemas'),
(2, '116', 'Ingeniería Industrial'),
(3, '119', 'Ingeniería Electrónica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `linea_id` int(11) DEFAULT NULL,
  `objetivo_general` text DEFAULT NULL,
  `responsable_id` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`id`, `nombre`, `linea_id`, `objetivo_general`, `responsable_id`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'AHP', 1, 'Lalalala', 1, '2023-01-01', '2023-08-31'),
(2, 'Millos', 4, 'Lalalala', 3, '2024-07-01', '2024-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Instructor'),
(2, 'Lider'),
(3, 'Participante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semillero`
--

CREATE TABLE `semillero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `sigla` varchar(20) DEFAULT NULL,
  `grupo_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `mision` text DEFAULT NULL,
  `vision` text DEFAULT NULL,
  `objetivo_general` text DEFAULT NULL,
  `objetivo_especifico` text DEFAULT NULL,
  `estrategia_trabajo` text DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `semillero`
--

INSERT INTO `semillero` (`id`, `nombre`, `sigla`, `grupo_id`, `area_id`, `mision`, `vision`, `objetivo_general`, `objetivo_especifico`, `estrategia_trabajo`, `director_id`) VALUES
(1, 'Semillero de Investigación de Aplicaciones WEB', 'SIAWEB', 1, 2, 'Lalalala', 'Lalalala', 'Lalalala', 'Lalalala', 'Lalalala', 1),
(2, 'Semillero de Millonarios', 'MILLOS', 2, 3, 'Lalalala', 'Lalalala', 'Lalalala', 'Lalalala', 'Lalalala', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actividad_integrante_FK` (`responsable_id`),
  ADD KEY `actividad_proyecto_FK` (`proyecto_id`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asistencia_unique` (`capacitacion_id`,`integrante_id`),
  ADD KEY `asistencia_integrante_FK` (`integrante_id`);

--
-- Indices de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capacitacion_integrante_FK` (`integrante_id`),
  ADD KEY `capacitacion_periodo_FK` (`periodo_id`),
  ADD KEY `capacitacion_semillero_FK` (`semillero_id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `director_unique` (`codigo`),
  ADD KEY `director_nivel_formacion_FK` (`nivel_formacion_id`),
  ADD KEY `director_departamento_FK` (`departamento_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_programa_FK` (`programa_id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evento_evento_nivel_FK` (`nivel_id`);

--
-- Indices de la tabla `evento_nivel`
--
ALTER TABLE `evento_nivel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscrito`
--
ALTER TABLE `inscrito`
  ADD PRIMARY KEY (`integrante_id`,`periodo_id`),
  ADD KEY `inscrito_periodo_FK` (`periodo_id`);

--
-- Indices de la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `integrante_rol_FK` (`rol_id`),
  ADD KEY `integrante_semillero_FK` (`semillero_id`),
  ADD KEY `integrante_estudiante_FK` (`estudiante_id`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linea_semillero_FK` (`semillero_id`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nivel_formacion`
--
ALTER TABLE `nivel_formacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participacion_modalidad_FK` (`modalidad_id`),
  ADD KEY `participacion_evento_FK` (`evento_id`),
  ADD KEY `participacion_proyecto_FK` (`proyecto_id`),
  ADD KEY `participacion_producto_tipo_FK` (`producto_tipo_id`),
  ADD KEY `participacion_integrante_FK` (`integrante_id`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_tipo`
--
ALTER TABLE `producto_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `programa_unique` (`codigo`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyecto_linea_FK` (`linea_id`),
  ADD KEY `proyecto_integrante_FK` (`responsable_id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol_unique` (`nombre`);

--
-- Indices de la tabla `semillero`
--
ALTER TABLE `semillero`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semillero_director_FK` (`director_id`),
  ADD KEY `semillero_grupo_FK` (`grupo_id`),
  ADD KEY `semillero_area_FK` (`area_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `director`
--
ALTER TABLE `director`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `evento_nivel`
--
ALTER TABLE `evento_nivel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `integrante`
--
ALTER TABLE `integrante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `nivel_formacion`
--
ALTER TABLE `nivel_formacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `participacion`
--
ALTER TABLE `participacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto_tipo`
--
ALTER TABLE `producto_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `semillero`
--
ALTER TABLE `semillero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD CONSTRAINT `actividad_integrante_FK` FOREIGN KEY (`responsable_id`) REFERENCES `integrante` (`id`),
  ADD CONSTRAINT `actividad_proyecto_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_capacitacion_FK` FOREIGN KEY (`capacitacion_id`) REFERENCES `capacitacion` (`id`),
  ADD CONSTRAINT `asistencia_integrante_FK` FOREIGN KEY (`integrante_id`) REFERENCES `integrante` (`id`);

--
-- Filtros para la tabla `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD CONSTRAINT `capacitacion_integrante_FK` FOREIGN KEY (`integrante_id`) REFERENCES `integrante` (`id`),
  ADD CONSTRAINT `capacitacion_periodo_FK` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`),
  ADD CONSTRAINT `capacitacion_semillero_FK` FOREIGN KEY (`semillero_id`) REFERENCES `semillero` (`id`);

--
-- Filtros para la tabla `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_departamento_FK` FOREIGN KEY (`departamento_id`) REFERENCES `departamento` (`id`),
  ADD CONSTRAINT `director_nivel_formacion_FK` FOREIGN KEY (`nivel_formacion_id`) REFERENCES `nivel_formacion` (`id`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_programa_FK` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_evento_nivel_FK` FOREIGN KEY (`nivel_id`) REFERENCES `evento_nivel` (`id`);

--
-- Filtros para la tabla `inscrito`
--
ALTER TABLE `inscrito`
  ADD CONSTRAINT `inscrito_integrante_FK` FOREIGN KEY (`integrante_id`) REFERENCES `integrante` (`id`),
  ADD CONSTRAINT `inscrito_periodo_FK` FOREIGN KEY (`periodo_id`) REFERENCES `periodo` (`id`);

--
-- Filtros para la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD CONSTRAINT `integrante_estudiante_FK` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `integrante_rol_FK` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `integrante_semillero_FK` FOREIGN KEY (`semillero_id`) REFERENCES `semillero` (`id`);

--
-- Filtros para la tabla `linea`
--
ALTER TABLE `linea`
  ADD CONSTRAINT `linea_semillero_FK` FOREIGN KEY (`semillero_id`) REFERENCES `semillero` (`id`);

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `participacion_evento_FK` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `participacion_integrante_FK` FOREIGN KEY (`integrante_id`) REFERENCES `integrante` (`id`),
  ADD CONSTRAINT `participacion_modalidad_FK` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`id`),
  ADD CONSTRAINT `participacion_producto_tipo_FK` FOREIGN KEY (`producto_tipo_id`) REFERENCES `producto_tipo` (`id`),
  ADD CONSTRAINT `participacion_proyecto_FK` FOREIGN KEY (`proyecto_id`) REFERENCES `proyecto` (`id`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `proyecto_integrante_FK` FOREIGN KEY (`responsable_id`) REFERENCES `integrante` (`id`),
  ADD CONSTRAINT `proyecto_linea_FK` FOREIGN KEY (`linea_id`) REFERENCES `linea` (`id`);

--
-- Filtros para la tabla `semillero`
--
ALTER TABLE `semillero`
  ADD CONSTRAINT `semillero_area_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `semillero_director_FK` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`),
  ADD CONSTRAINT `semillero_grupo_FK` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
