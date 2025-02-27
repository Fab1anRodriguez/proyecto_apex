-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2025 a las 17:27:20
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
-- Base de datos: `free_fire`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
  `id_arma` int(11) NOT NULL,
  `nombre_arma` varchar(40) NOT NULL,
  `cantidad_balas` int(4) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `img_arma` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE `avatar` (
  `id_avatar` int(11) NOT NULL,
  `nom_avatar` varchar(100) NOT NULL,
  `img` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_armas`
--

CREATE TABLE `categoria_armas` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(40) NOT NULL,
  `nivel_minimo` int(11) NOT NULL,
  `daño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas`
--

CREATE TABLE `estadisticas` (
  `id_estadistica` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `puntos_totales` int(11) NOT NULL,
  `muertes_totales` int(11) NOT NULL,
  `total_headshots` int(11) NOT NULL,
  `partidas_jugadas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores_partida`
--

CREATE TABLE `jugadores_partida` (
  `id_jugador_partida` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `fecha_inicio` timestamp NULL DEFAULT NULL,
  `fecha_fin` timestamp NULL DEFAULT NULL,
  `puntos_totales` int(6) DEFAULT NULL,
  `muertes` int(4) DEFAULT NULL,
  `headshots` int(3) DEFAULT NULL,
  `id_arma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mundo`
--

CREATE TABLE `mundo` (
  `id_mundo` int(11) NOT NULL,
  `nom_mundo` varchar(100) NOT NULL,
  `img_mundo` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id_nivel` int(11) NOT NULL,
  `nombre_nivel` varchar(11) NOT NULL,
  `imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id_nivel`, `nombre_nivel`, `imagen`) VALUES
(1, 'Nivel Inici', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nom_rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nom_rol`) VALUES
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id_sala` int(11) NOT NULL,
  `id_mundo` int(11) NOT NULL,
  `nivel_minimo` int(11) NOT NULL,
  `max_jugadores` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` int(11) DEFAULT NULL,
  `vida` int(4) NOT NULL,
  `contraseña` varchar(500) NOT NULL,
  `id_Nivel` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `ultima_fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `avatar`, `vida`, `contraseña`, `id_Nivel`, `id_estado`, `id_rol`, `ultima_fecha`) VALUES
(3, 'Jean-Arevalo3112', 'jeancarlosarevalorojas@gmail.com', NULL, 100, '$2y$10$NlXxbyyYliQ2LBanj7CJDeV.Vu3gWFl42n0yMb2T4cxVtp50Fbrd.', 1, 1, 2, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armas`
--
ALTER TABLE `armas`
  ADD PRIMARY KEY (`id_arma`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `avatar`
--
ALTER TABLE `avatar`
  ADD PRIMARY KEY (`id_avatar`);

--
-- Indices de la tabla `categoria_armas`
--
ALTER TABLE `categoria_armas`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `jugadores_partida`
--
ALTER TABLE `jugadores_partida`
  ADD PRIMARY KEY (`id_jugador_partida`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_sala` (`id_sala`),
  ADD KEY `id_arma` (`id_arma`);

--
-- Indices de la tabla `mundo`
--
ALTER TABLE `mundo`
  ADD PRIMARY KEY (`id_mundo`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id_sala`),
  ADD KEY `id_mundo` (`id_mundo`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_Nivel` (`id_Nivel`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `fk_usuario_avatar` (`avatar`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `id_arma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `avatar`
--
ALTER TABLE `avatar`
  MODIFY `id_avatar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_armas`
--
ALTER TABLE `categoria_armas`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  MODIFY `id_estadistica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jugadores_partida`
--
ALTER TABLE `jugadores_partida`
  MODIFY `id_jugador_partida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mundo`
--
ALTER TABLE `mundo`
  MODIFY `id_mundo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `id_nivel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id_sala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `armas`
--
ALTER TABLE `armas`
  ADD CONSTRAINT `armas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria_armas` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD CONSTRAINT `estadisticas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugadores_partida`
--
ALTER TABLE `jugadores_partida`
  ADD CONSTRAINT `jugadores_partida_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jugadores_partida_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jugadores_partida_ibfk_3` FOREIGN KEY (`id_arma`) REFERENCES `armas` (`id_arma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`id_mundo`) REFERENCES `mundo` (`id_mundo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salas_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_avatar` FOREIGN KEY (`avatar`) REFERENCES `avatar` (`id_avatar`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_Nivel`) REFERENCES `nivel` (`id_nivel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
