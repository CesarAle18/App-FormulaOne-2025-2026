-- ============================================================
-- Formula1APP - Script de base de datos para XAMPP (MariaDB)
-- Base de datos: f1_manager
-- ============================================================
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE IF NOT EXISTS `f1_manager` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `f1_manager`;
-- ============================================================
-- DROP TABLES (orden inverso de dependencias)
-- ============================================================
DROP TABLE IF EXISTS `resultado_sprint`;
DROP TABLE IF EXISTS `resultado`;
DROP TABLE IF EXISTS `carrera`;
DROP TABLE IF EXISTS `piloto`;
DROP TABLE IF EXISTS `constructor`;
DROP TABLE IF EXISTS `circuito`;
DROP TABLE IF EXISTS `temporada`;
-- ============================================================
-- TABLA: temporada
-- ============================================================
CREATE TABLE `temporada` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lxujn16vr0nn6a5krl9o9v1db` (`anio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `temporada` (`id`, `anio`) VALUES
(1, 2025),
(2, 2026);
-- ============================================================
-- TABLA: circuito
-- ============================================================
CREATE TABLE `circuito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `ubicacion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `circuito` (`id`, `nombre`, `ubicacion`) VALUES
(1, 'Bahrain International Circuit', 'Sakhir, Bahrain'),
(2, 'Jeddah Corniche Circuit', 'Jeddah, Saudi Arabia'),
(3, 'Albert Park Circuit', 'Melbourne, Australia'),
(4, 'Suzuka Circuit', 'Suzuka, Japan'),
(5, 'Shanghai International Circuit', 'Shanghai, China'),
(6, 'Miami International Autodrome', 'Miami, USA'),
(7, 'Imola - Autodromo Internazionale Enzo e Dino Ferrari', 'Imola, Italy'),
(8, 'Circuit de Monaco', 'Monte Carlo, Monaco'),
(9, 'Circuit Gilles Villeneuve', 'Montreal, Canada'),
(10, 'Circuit de Barcelona-Catalunya', 'Barcelona, Spain'),
(11, 'Red Bull Ring', 'Spielberg, Austria'),
(12, 'Silverstone Circuit', 'Silverstone, UK'),
(13, 'Hungaroring', 'Budapest, Hungary'),
(14, 'Circuit de Spa-Francorchamps', 'Stavelot, Belgium'),
(15, 'Circuit Zandvoort', 'Zandvoort, Netherlands'),
(16, 'Autodromo Nazionale Monza', 'Monza, Italy'),
(17, 'Baku City Circuit', 'Baku, Azerbaijan'),
(18, 'Marina Bay Street Circuit', 'Singapore'),
(19, 'Circuit of the Americas', 'Austin, USA'),
(20, 'Autódromo Hermanos Rodríguez', 'Mexico City, Mexico'),
(21, 'Interlagos - Autódromo José Carlos Pace', 'São Paulo, Brazil'),
(22, 'Las Vegas Strip Circuit', 'Las Vegas, USA'),
(23, 'Losail International Circuit', 'Lusail, Qatar'),
(24, 'Yas Marina Circuit', 'Abu Dhabi, UAE');
-- ============================================================
-- TABLA: constructor
-- ============================================================
CREATE TABLE `constructor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nacionalidad` varchar(100) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `constructor` (`id`, `nacionalidad`, `nombre`) VALUES
(1, 'Reino Unido', 'McLaren Mercedes'),
(2, 'Italia', 'Ferrari'),
(3, 'Austria', 'Red Bull Racing Honda RBPT'),
(4, 'Reino Unido', 'Mercedes'),
(5, 'Reino Unido', 'Aston Martin Aramco Mercedes'),
(6, 'Francia', 'Alpine Renault'),
(7, 'Estados Unidos', 'Haas Ferrari'),
(8, 'Austria', 'Racing Bulls Honda RBPT'),
(9, 'Reino Unido', 'Williams Mercedes'),
(10, 'Suiza', 'Kick Sauber Ferrari'),
(11, 'Alemania', 'Audi F1 Team'),
(12, 'Estados Unidos', 'Cadillac Ferrari');
-- ============================================================
-- TABLA: piloto
-- ============================================================
CREATE TABLE `piloto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dorsal` varchar(10) DEFAULT NULL,
  `nacionalidad` varchar(80) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `constructor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKegktchdktbaf6v0dha2cbrf3n` (`constructor_id`),
  CONSTRAINT `FKegktchdktbaf6v0dha2cbrf3n` FOREIGN KEY (`constructor_id`) REFERENCES `constructor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `piloto` (`id`, `dorsal`, `nacionalidad`, `nombre`, `constructor_id`) VALUES
(1, '4', 'Reino Unido', 'Lando Norris', 1),
(2, '81', 'Australia', 'Oscar Piastri', 1),
(3, '16', 'Mónaco', 'Charles Leclerc', 2),
(4, '44', 'Reino Unido', 'Lewis Hamilton', 2),
(5, '1', 'Países Bajos', 'Max Verstappen', 3),
(6, '30', 'Nueva Zelanda', 'Liam Lawson', 3),
(7, '63', 'Reino Unido', 'George Russell', 4),
(8, '12', 'Italia', 'Andrea Kimi Antonelli', 4),
(9, '14', 'España', 'Fernando Alonso', 5),
(10, '18', 'Canadá', 'Lance Stroll', 5),
(11, '10', 'Francia', 'Pierre Gasly', 6),
(12, '43', 'Argentina', 'Franco Colapinto', 6),
(13, '31', 'Francia', 'Esteban Ocon', 7),
(14, '87', 'Reino Unido', 'Oliver Bearman', 7),
(15, '22', 'Japón', 'Yuki Tsunoda', 8),
(16, '6', 'Francia', 'Isack Hadjar', 8),
(17, '23', 'Tailandia', 'Alexander Albon', 9),
(18, '55', 'España', 'Carlos Sainz', 9),
(19, '5', 'Brasil', 'Gabriel Bortoleto', 10),
(20, '27', 'Alemania', 'Nico Hülkenberg', 10),
(21, '7', 'Australia', 'Jack Doohan', 6),
(22, '40', 'Suecia', 'Arvid Lindblad', 8),
(23, '11', 'México', 'Sergio Pérez', 12),
(24, '77', 'Finlandia', 'Valtteri Bottas', 12);
-- ============================================================
-- TABLA: carrera
-- ============================================================
CREATE TABLE `carrera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `gp_numero` int(11) DEFAULT NULL,
  `nombre_gp` varchar(200) DEFAULT NULL,
  `circuito_id` bigint(20) DEFAULT NULL,
  `temporada_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1jjl213nuh1vtccpxpt78opvy` (`circuito_id`),
  KEY `FK9gwrwulvdijidobvdmm4qu94g` (`temporada_id`),
  CONSTRAINT `FK1jjl213nuh1vtccpxpt78opvy` FOREIGN KEY (`circuito_id`) REFERENCES `circuito` (`id`),
  CONSTRAINT `FK9gwrwulvdijidobvdmm4qu94g` FOREIGN KEY (`temporada_id`) REFERENCES `temporada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `carrera` (`id`, `fecha`, `gp_numero`, `nombre_gp`, `circuito_id`, `temporada_id`) VALUES
-- TEMPORADA 2025 (24 carreras)
(1, '2025-03-16', 1, 'Australian Grand Prix', 3, 1),
(2, '2025-03-23', 2, 'Chinese Grand Prix', 5, 1),
(3, '2025-04-06', 3, 'Japanese Grand Prix', 4, 1),
(4, '2025-04-13', 4, 'Bahrain Grand Prix', 1, 1),
(5, '2025-04-20', 5, 'Saudi Arabian Grand Prix', 2, 1),
(6, '2025-05-04', 6, 'Miami Grand Prix', 6, 1),
(7, '2025-05-18', 7, 'Emilia Romagna Grand Prix', 7, 1),
(8, '2025-05-25', 8, 'Monaco Grand Prix', 8, 1),
(9, '2025-06-01', 9, 'Spanish Grand Prix', 10, 1),
(10, '2025-06-15', 10, 'Canadian Grand Prix', 9, 1),
(11, '2025-06-29', 11, 'Austrian Grand Prix', 11, 1),
(12, '2025-07-06', 12, 'British Grand Prix', 12, 1),
(13, '2025-07-27', 13, 'Belgian Grand Prix', 14, 1),
(14, '2025-08-03', 14, 'Hungarian Grand Prix', 13, 1),
(15, '2025-08-31', 15, 'Dutch Grand Prix', 15, 1),
(16, '2025-09-07', 16, 'Italian Grand Prix', 16, 1),
(17, '2025-09-21', 17, 'Azerbaijan Grand Prix', 17, 1),
(18, '2025-10-05', 18, 'Singapore Grand Prix', 18, 1),
(19, '2025-10-19', 19, 'United States Grand Prix', 19, 1),
(20, '2025-10-26', 20, 'Mexico City Grand Prix', 20, 1),
(21, '2025-11-09', 21, 'São Paulo Grand Prix', 21, 1),
(22, '2025-11-22', 22, 'Las Vegas Grand Prix', 22, 1),
(23, '2025-11-30', 23, 'Qatar Grand Prix', 23, 1),
(24, '2025-12-07', 24, 'Abu Dhabi Grand Prix', 24, 1),
-- TEMPORADA 2026 (4 carreras)
(25, '2026-03-08', 1, 'Australian Grand Prix', 3, 2),
(26, '2026-03-15', 2, 'Chinese Grand Prix', 5, 2),
(27, '2026-03-29', 3, 'Japanese Grand Prix', 4, 2),
(28, '2026-05-03', 4, 'Miami Grand Prix', 6, 2);

INSERT INTO `carrera` (`id`, `fecha`, `gp_numero`, `nombre_gp`, `circuito_id`, `temporada_id`) VALUES
-- Ronda 5: Canadian GP
(29, '2026-05-24', 5, 'Canadian Grand Prix', 9, 2),
-- Ronda 6: Monaco GP
(30, '2026-06-07', 6, 'Monaco Grand Prix', 8, 2),
-- Ronda 7: Spanish GP (Barcelona)
(31, '2026-06-14', 7, 'Spanish Grand Prix', 10, 2),
-- Ronda 8: Austrian GP
(32, '2026-06-28', 8, 'Austrian Grand Prix', 11, 2),
-- Ronda 9: British GP
(33, '2026-07-05', 9, 'British Grand Prix', 12, 2),
-- Ronda 10: Belgian GP
(34, '2026-07-19', 10, 'Belgian Grand Prix', 14, 2),
-- Ronda 11: Hungarian GP
(35, '2026-07-26', 11, 'Hungarian Grand Prix', 13, 2),
-- Ronda 12: Dutch GP
(36, '2026-08-23', 12, 'Dutch Grand Prix', 15, 2),
-- Ronda 13: Italian GP (Monza)
(37, '2026-09-06', 13, 'Italian Grand Prix', 16, 2),
-- Ronda 14: Spanish GP (Madrid) - Nuevo circuito
(38, '2026-09-13', 14, 'Madrid Grand Prix', 10, 2),
-- Ronda 15: Azerbaijan GP
(39, '2026-09-26', 15, 'Azerbaijan Grand Prix', 17, 2),
-- Ronda 16: Singapore GP
(40, '2026-10-11', 16, 'Singapore Grand Prix', 18, 2),
-- Ronda 17: United States GP (Austin)
(41, '2026-10-25', 17, 'United States Grand Prix', 19, 2),
-- Ronda 18: Mexico City GP
(42, '2026-11-01', 18, 'Mexico City Grand Prix', 20, 2),
-- Ronda 19: Sao Paulo GP (Brasil)
(43, '2026-11-08', 19, 'Sao Paulo Grand Prix', 21, 2),
-- Ronda 20: Las Vegas GP
(44, '2026-11-21', 20, 'Las Vegas Grand Prix', 22, 2),
-- Ronda 21: Qatar GP
(45, '2026-11-29', 21, 'Qatar Grand Prix', 23, 2),
-- Ronda 22: Abu Dhabi GP
(46, '2026-12-06', 22, 'Abu Dhabi Grand Prix', 24, 2);
-- ============================================================
-- TABLA: resultado
-- ============================================================
CREATE TABLE `resultado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `motivo_retiro` varchar(200) DEFAULT NULL,
  `posicion_final` int(11) DEFAULT NULL,
  `puntos_obtenidos` decimal(5,2) DEFAULT NULL,
  `retirado` bit(1) DEFAULT NULL,
  `tiempo` varchar(100) DEFAULT NULL,
  `vueltas` int(11) DEFAULT NULL,
  `carrera_id` bigint(20) DEFAULT NULL,
  `piloto_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7hsjyvj7t94jav12p4qp9m5mh` (`carrera_id`),
  KEY `FKquvb94bffp9w7d7rhs5msnvcq` (`piloto_id`),
  CONSTRAINT `FK7hsjyvj7t94jav12p4qp9m5mh` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `FKquvb94bffp9w7d7rhs5msnvcq` FOREIGN KEY (`piloto_id`) REFERENCES `piloto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `resultado` (`id`, `motivo_retiro`, `posicion_final`, `puntos_obtenidos`, `retirado`, `tiempo`, `vueltas`, `carrera_id`, `piloto_id`) VALUES
-- R01: Australian GP 2025 - Ganador: Lando Norris
(1, NULL, 1, 25.00, b'0', '1:42:06.304', 58, 1, 1),
(2, NULL, 2, 18.00, b'0', '+0.895s', 58, 1, 5),
(3, NULL, 3, 15.00, b'0', '+8.481s', 58, 1, 7),
(4, NULL, 4, 12.00, b'0', '+14.412s', 58, 1, 2),
(5, NULL, 5, 10.00, b'0', '+19.576s', 58, 1, 8),
(6, NULL, 6, 8.00, b'0', '+25.342s', 58, 1, 3),
(7, NULL, 7, 6.00, b'0', '+42.718s', 58, 1, 4),
(8, NULL, 8, 4.00, b'0', '+57.230s', 58, 1, 17),
(9, NULL, 9, 2.00, b'0', '+1 lap', 57, 1, 18),
(10, NULL, 10, 1.00, b'0', '+1 lap', 57, 1, 9),
-- R02: Chinese GP 2025 - Ganador: Oscar Piastri
(11, NULL, 1, 25.00, b'0', '1:30:55.026', 56, 2, 2),
(12, NULL, 2, 18.00, b'0', '+9.748s', 56, 2, 1),
(13, NULL, 3, 15.00, b'0', '+11.097s', 56, 2, 7),
(14, NULL, 4, 12.00, b'0', '+37.984s', 56, 2, 5),
(15, NULL, 5, 10.00, b'0', '+46.813s', 56, 2, 8),
(16, NULL, 6, 8.00, b'0', '+55.741s', 56, 2, 6),
(17, NULL, 7, 6.00, b'0', '+73.628s', 56, 2, 3),
(18, NULL, 8, 4.00, b'0', '+1 lap', 55, 2, 16),
(19, NULL, 9, 2.00, b'0', '+1 lap', 55, 2, 14),
(20, NULL, 10, 1.00, b'0', '+1 lap', 55, 2, 20),
-- R03: Japanese GP 2025 - Ganador: Max Verstappen
(21, NULL, 1, 25.00, b'0', '1:22:06.983', 53, 3, 5),
(22, NULL, 2, 18.00, b'0', '+1.423s', 53, 3, 1),
(23, NULL, 3, 15.00, b'0', '+2.129s', 53, 3, 2),
(24, NULL, 4, 12.00, b'0', '+11.632s', 53, 3, 7),
(25, NULL, 5, 10.00, b'0', '+23.571s', 53, 3, 3),
(26, NULL, 6, 8.00, b'0', '+34.219s', 53, 3, 8),
(27, NULL, 7, 6.00, b'0', '+40.887s', 53, 3, 4),
(28, NULL, 8, 4.00, b'0', '+50.341s', 53, 3, 6),
(29, NULL, 9, 2.00, b'0', '+58.672s', 53, 3, 15),
(30, NULL, 10, 1.00, b'0', '+1 lap', 52, 3, 17),
-- R04: Bahrain GP 2025 - Ganador: Oscar Piastri
(31, NULL, 1, 25.00, b'0', '1:35:39.435', 57, 4, 2),
(32, NULL, 2, 18.00, b'0', '+15.499s', 57, 4, 7),
(33, NULL, 3, 15.00, b'0', '+16.273s', 57, 4, 1),
(34, NULL, 4, 12.00, b'0', '+29.847s', 57, 4, 5),
(35, NULL, 5, 10.00, b'0', '+37.612s', 57, 4, 8),
(36, NULL, 6, 8.00, b'0', '+52.341s', 57, 4, 3),
(37, NULL, 7, 6.00, b'0', '+63.904s', 57, 4, 4),
(38, NULL, 8, 4.00, b'0', '+74.219s', 57, 4, 10),
(39, NULL, 9, 2.00, b'0', '+85.341s', 57, 4, 9),
(40, NULL, 10, 1.00, b'0', '+1 lap', 56, 4, 17),
-- R05: Saudi Arabian GP 2025 - Ganador: Oscar Piastri
(41, NULL, 1, 25.00, b'0', '1:22:47.315', 50, 5, 2),
(42, NULL, 2, 18.00, b'0', '+4.231s', 50, 5, 1),
(43, NULL, 3, 15.00, b'0', '+8.764s', 50, 5, 5),
(44, NULL, 4, 12.00, b'0', '+15.342s', 50, 5, 7),
(45, NULL, 5, 10.00, b'0', '+28.671s', 50, 5, 8),
(46, NULL, 6, 8.00, b'0', '+36.901s', 50, 5, 3),
(47, NULL, 7, 6.00, b'0', '+44.218s', 50, 5, 4),
(48, NULL, 8, 4.00, b'0', '+56.432s', 50, 5, 6),
(49, NULL, 9, 2.00, b'0', '+68.921s', 50, 5, 15),
(50, NULL, 10, 1.00, b'0', '+1 lap', 49, 5, 16),
-- R06: Miami GP 2025 - Ganador: Oscar Piastri
(51, NULL, 1, 25.00, b'0', '1:28:39.412', 57, 6, 2),
(52, NULL, 2, 18.00, b'0', '+7.219s', 57, 6, 1),
(53, NULL, 3, 15.00, b'0', '+18.673s', 57, 6, 5),
(54, NULL, 4, 12.00, b'0', '+25.341s', 57, 6, 7),
(55, NULL, 5, 10.00, b'0', '+32.412s', 57, 6, 8),
(56, NULL, 6, 8.00, b'0', '+44.219s', 57, 6, 3),
(57, NULL, 7, 6.00, b'0', '+55.678s', 57, 6, 4),
(58, NULL, 8, 4.00, b'0', '+63.219s', 57, 6, 6),
(59, NULL, 9, 2.00, b'0', '+74.341s', 57, 6, 18),
(60, NULL, 10, 1.00, b'0', '+1 lap', 56, 6, 17),
-- R07: Emilia Romagna GP 2025 - Ganador: Max Verstappen
(61, NULL, 1, 25.00, b'0', '1:26:12.483', 63, 7, 5),
(62, NULL, 2, 18.00, b'0', '+7.341s', 63, 7, 2),
(63, NULL, 3, 15.00, b'0', '+14.892s', 63, 7, 1),
(64, NULL, 4, 12.00, b'0', '+22.109s', 63, 7, 7),
(65, NULL, 5, 10.00, b'0', '+31.784s', 63, 7, 8),
(66, NULL, 6, 8.00, b'0', '+41.231s', 63, 7, 3),
(67, NULL, 7, 6.00, b'0', '+52.017s', 63, 7, 4),
(68, NULL, 8, 4.00, b'0', '+65.342s', 63, 7, 20),
(69, NULL, 9, 2.00, b'0', '+78.901s', 63, 7, 14),
(70, NULL, 10, 1.00, b'0', '+1 lap', 62, 7, 11),
-- R08: Monaco GP 2025 - Ganador: Lando Norris
(71, NULL, 1, 25.00, b'0', '1:47:12.914', 78, 8, 1),
(72, NULL, 2, 18.00, b'0', '+3.428s', 78, 8, 2),
(73, NULL, 3, 15.00, b'0', '+7.217s', 78, 8, 7),
(74, NULL, 4, 12.00, b'0', '+11.682s', 78, 8, 5),
(75, NULL, 5, 10.00, b'0', '+16.341s', 78, 8, 8),
(76, NULL, 6, 8.00, b'0', '+23.784s', 78, 8, 3),
(77, NULL, 7, 6.00, b'0', '+31.217s', 78, 8, 4),
(78, NULL, 8, 4.00, b'0', '+1 lap', 77, 8, 10),
(79, NULL, 9, 2.00, b'0', '+1 lap', 77, 8, 9),
(80, NULL, 10, 1.00, b'0', '+1 lap', 77, 8, 17),
-- R09: Spanish GP 2025 - Ganador: Oscar Piastri
(81, NULL, 1, 25.00, b'0', '1:28:41.276', 66, 9, 2),
(82, NULL, 2, 18.00, b'0', '+3.124s', 66, 9, 5),
(83, NULL, 3, 15.00, b'0', '+9.817s', 66, 9, 1),
(84, NULL, 4, 12.00, b'0', '+18.342s', 66, 9, 7),
(85, NULL, 5, 10.00, b'0', '+27.891s', 66, 9, 8),
(86, NULL, 6, 8.00, b'0', '+38.217s', 66, 9, 3),
(87, NULL, 7, 6.00, b'0', '+48.673s', 66, 9, 4),
(88, NULL, 8, 4.00, b'0', '+60.219s', 66, 9, 16),
(89, NULL, 9, 2.00, b'0', '+72.341s', 66, 9, 17),
(90, NULL, 10, 1.00, b'0', '+1 lap', 65, 9, 9),
-- R10: Canadian GP 2025 - Ganador: George Russell
(91, NULL, 1, 25.00, b'0', '1:34:52.648', 70, 10, 7),
(92, NULL, 2, 18.00, b'0', '+2.817s', 70, 10, 5),
(93, NULL, 3, 15.00, b'0', '+8.219s', 70, 10, 8),
(94, NULL, 4, 12.00, b'0', '+15.673s', 70, 10, 2),
(95, NULL, 5, 10.00, b'0', '+23.341s', 70, 10, 1),
(96, NULL, 6, 8.00, b'0', '+32.781s', 70, 10, 3),
(97, NULL, 7, 6.00, b'0', '+41.219s', 70, 10, 4),
(98, NULL, 8, 4.00, b'0', '+54.673s', 70, 10, 20),
(99, NULL, 9, 2.00, b'0', '+68.341s', 70, 10, 14),
(100, NULL, 10, 1.00, b'0', '+1 lap', 69, 10, 17),
-- R11: Austrian GP 2025 - Ganador: Lando Norris
(101, NULL, 1, 25.00, b'0', '1:24:51.897', 71, 11, 1),
(102, NULL, 2, 18.00, b'0', '+4.219s', 71, 11, 2),
(103, NULL, 3, 15.00, b'0', '+8.673s', 71, 11, 7),
(104, NULL, 4, 12.00, b'0', '+14.341s', 71, 11, 5),
(105, NULL, 5, 10.00, b'0', '+22.781s', 71, 11, 8),
(106, NULL, 6, 8.00, b'0', '+31.219s', 71, 11, 3),
(107, NULL, 7, 6.00, b'0', '+42.673s', 71, 11, 4),
(108, NULL, 8, 4.00, b'0', '+55.341s', 71, 11, 16),
(109, NULL, 9, 2.00, b'0', '+69.781s', 71, 11, 17),
(110, NULL, 10, 1.00, b'0', '+1 lap', 70, 11, 9),
-- R12: British GP 2025 - Ganador: Lando Norris
(111, NULL, 1, 25.00, b'0', '1:22:27.491', 52, 12, 1),
(112, NULL, 2, 18.00, b'0', '+3.847s', 52, 12, 2),
(113, NULL, 3, 15.00, b'0', '+8.219s', 52, 12, 20),
(114, NULL, 4, 12.00, b'0', '+12.673s', 52, 12, 7),
(115, NULL, 5, 10.00, b'0', '+19.341s', 52, 12, 5),
(116, NULL, 6, 8.00, b'0', '+28.781s', 52, 12, 8),
(117, NULL, 7, 6.00, b'0', '+37.219s', 52, 12, 3),
(118, NULL, 8, 4.00, b'0', '+49.673s', 52, 12, 4),
(119, NULL, 9, 2.00, b'0', '+63.341s', 52, 12, 17),
(120, NULL, 10, 1.00, b'0', '+1 lap', 51, 12, 18),
-- R13: Belgian GP 2025 - Ganador: Oscar Piastri
(121, NULL, 1, 25.00, b'0', '1:44:07.832', 44, 13, 2),
(122, NULL, 2, 18.00, b'0', '+5.341s', 44, 13, 1),
(123, NULL, 3, 15.00, b'0', '+12.673s', 44, 13, 5),
(124, NULL, 4, 12.00, b'0', '+18.219s', 44, 13, 7),
(125, NULL, 5, 10.00, b'0', '+26.781s', 44, 13, 8),
(126, NULL, 6, 8.00, b'0', '+36.341s', 44, 13, 3),
(127, NULL, 7, 6.00, b'0', '+46.219s', 44, 13, 4),
(128, NULL, 8, 4.00, b'0', '+58.673s', 44, 13, 13),
(129, NULL, 9, 2.00, b'0', '+72.341s', 44, 13, 14),
(130, NULL, 10, 1.00, b'0', '+1 lap', 43, 13, 17),
-- R14: Hungarian GP 2025 - Ganador: Lando Norris
(131, NULL, 1, 25.00, b'0', '1:38:19.274', 70, 14, 1),
(132, NULL, 2, 18.00, b'0', '+3.217s', 70, 14, 2),
(133, NULL, 3, 15.00, b'0', '+7.781s', 70, 14, 7),
(134, NULL, 4, 12.00, b'0', '+13.219s', 70, 14, 5),
(135, NULL, 5, 10.00, b'0', '+21.673s', 70, 14, 8),
(136, NULL, 6, 8.00, b'0', '+31.341s', 70, 14, 3),
(137, NULL, 7, 6.00, b'0', '+42.781s', 70, 14, 4),
(138, NULL, 8, 4.00, b'0', '+56.219s', 70, 14, 13),
(139, NULL, 9, 2.00, b'0', '+71.673s', 70, 14, 9),
(140, NULL, 10, 1.00, b'0', '+1 lap', 69, 14, 17),
-- R15: Dutch GP 2025 - Ganador: Oscar Piastri
(141, NULL, 1, 25.00, b'0', '1:30:05.418', 72, 15, 2),
(142, NULL, 2, 18.00, b'0', '+4.673s', 72, 15, 1),
(143, NULL, 3, 15.00, b'0', '+9.217s', 72, 15, 5),
(144, NULL, 4, 12.00, b'0', '+15.781s', 72, 15, 7),
(145, NULL, 5, 10.00, b'0', '+23.219s', 72, 15, 8),
(146, NULL, 6, 8.00, b'0', '+33.673s', 72, 15, 3),
(147, NULL, 7, 6.00, b'0', '+44.341s', 72, 15, 4),
(148, NULL, 8, 4.00, b'0', '+57.781s', 72, 15, 17),
(149, NULL, 9, 2.00, b'0', '+72.219s', 72, 15, 9),
(150, NULL, 10, 1.00, b'0', '+1 lap', 71, 15, 18),
-- R16: Italian GP 2025 - Ganador: Max Verstappen
(151, NULL, 1, 25.00, b'0', '1:14:13.492', 53, 16, 5),
(152, NULL, 2, 18.00, b'0', '+3.217s', 53, 16, 2),
(153, NULL, 3, 15.00, b'0', '+8.781s', 53, 16, 1),
(154, NULL, 4, 12.00, b'0', '+14.219s', 53, 16, 7),
(155, NULL, 5, 10.00, b'0', '+22.673s', 53, 16, 8),
(156, NULL, 6, 8.00, b'0', '+33.341s', 53, 16, 3),
(157, NULL, 7, 6.00, b'0', '+44.781s', 53, 16, 4),
(158, NULL, 8, 4.00, b'0', '+58.219s', 53, 16, 16),
(159, NULL, 9, 2.00, b'0', '+73.673s', 53, 16, 14),
(160, NULL, 10, 1.00, b'0', '+1 lap', 52, 16, 17),
-- R17: Azerbaijan GP 2025 - Ganador: Max Verstappen
(161, NULL, 1, 25.00, b'0', '1:32:14.721', 51, 17, 5),
(162, NULL, 2, 18.00, b'0', '+5.673s', 51, 17, 2),
(163, NULL, 3, 15.00, b'0', '+11.217s', 51, 17, 1),
(164, NULL, 4, 12.00, b'0', '+18.781s', 51, 17, 7),
(165, NULL, 5, 10.00, b'0', '+27.219s', 51, 17, 8),
(166, NULL, 6, 8.00, b'0', '+38.673s', 51, 17, 3),
(167, NULL, 7, 6.00, b'0', '+51.341s', 51, 17, 4),
(168, NULL, 8, 4.00, b'0', '+65.781s', 51, 17, 16),
(169, NULL, 9, 2.00, b'0', '+1 lap', 50, 17, 17),
(170, NULL, 10, 1.00, b'0', '+1 lap', 50, 17, 18),
-- R18: Singapore GP 2025 - Ganador: George Russell
(171, NULL, 1, 25.00, b'0', '1:40:53.617', 62, 18, 7),
(172, NULL, 2, 18.00, b'0', '+3.219s', 62, 18, 8),
(173, NULL, 3, 15.00, b'0', '+8.781s', 62, 18, 2),
(174, NULL, 4, 12.00, b'0', '+15.217s', 62, 18, 1),
(175, NULL, 5, 10.00, b'0', '+23.673s', 62, 18, 5),
(176, NULL, 6, 8.00, b'0', '+34.341s', 62, 18, 3),
(177, NULL, 7, 6.00, b'0', '+46.781s', 62, 18, 4),
(178, NULL, 8, 4.00, b'0', '+61.219s', 62, 18, 9),
(179, NULL, 9, 2.00, b'0', '+1 lap', 61, 18, 17),
(180, NULL, 10, 1.00, b'0', '+1 lap', 61, 18, 18),
-- R19: United States GP 2025 - Ganador: Max Verstappen
(181, NULL, 1, 25.00, b'0', '1:35:42.381', 56, 19, 5),
(182, NULL, 2, 18.00, b'0', '+4.217s', 56, 19, 2),
(183, NULL, 3, 15.00, b'0', '+9.781s', 56, 19, 1),
(184, NULL, 4, 12.00, b'0', '+16.219s', 56, 19, 7),
(185, NULL, 5, 10.00, b'0', '+25.673s', 56, 19, 8),
(186, NULL, 6, 8.00, b'0', '+36.341s', 56, 19, 3),
(187, NULL, 7, 6.00, b'0', '+48.781s', 56, 19, 4),
(188, NULL, 8, 4.00, b'0', '+63.217s', 56, 19, 16),
(189, NULL, 9, 2.00, b'0', '+1 lap', 55, 19, 17),
(190, NULL, 10, 1.00, b'0', '+1 lap', 55, 19, 18),
-- R20: Mexico City GP 2025 - Ganador: Lando Norris
(191, NULL, 1, 25.00, b'0', '1:40:32.741', 71, 20, 1),
(192, NULL, 2, 18.00, b'0', '+5.673s', 71, 20, 2),
(193, NULL, 3, 15.00, b'0', '+11.217s', 71, 20, 5),
(194, NULL, 4, 12.00, b'0', '+18.781s', 71, 20, 7),
(195, NULL, 5, 10.00, b'0', '+27.219s', 71, 20, 8),
(196, NULL, 6, 8.00, b'0', '+38.673s', 71, 20, 3),
(197, NULL, 7, 6.00, b'0', '+51.341s', 71, 20, 4),
(198, NULL, 8, 4.00, b'0', '+65.781s', 71, 20, 9),
(199, NULL, 9, 2.00, b'0', '+1 lap', 70, 20, 17),
(200, NULL, 10, 1.00, b'0', '+1 lap', 70, 20, 18),
-- R21: São Paulo GP 2025 - Ganador: Lando Norris
(201, NULL, 1, 25.00, b'0', '2:05:41.812', 69, 21, 1),
(202, NULL, 2, 18.00, b'0', '+7.219s', 69, 21, 2),
(203, NULL, 3, 15.00, b'0', '+13.781s', 69, 21, 5),
(204, NULL, 4, 12.00, b'0', '+21.219s', 69, 21, 7),
(205, NULL, 5, 10.00, b'0', '+30.673s', 69, 21, 8),
(206, NULL, 6, 8.00, b'0', '+42.341s', 69, 21, 3),
(207, NULL, 7, 6.00, b'0', '+55.781s', 69, 21, 4),
(208, NULL, 8, 4.00, b'0', '+1 lap', 68, 21, 16),
(209, NULL, 9, 2.00, b'0', '+1 lap', 68, 21, 17),
(210, NULL, 10, 1.00, b'0', '+1 lap', 68, 21, 9),
-- R22: Las Vegas GP 2025 - Ganador: Max Verstappen
(211, NULL, 1, 25.00, b'0', '1:21:08.429', 50, 22, 5),
(212, NULL, 2, 18.00, b'0', '+23.546s', 50, 22, 7),
(213, NULL, 3, 15.00, b'0', '+30.488s', 50, 22, 8),
(214, NULL, 4, 12.00, b'0', '+30.678s', 50, 22, 3),
(215, NULL, 5, 10.00, b'0', '+34.924s', 50, 22, 18),
(216, NULL, 6, 8.00, b'0', '+41.219s', 50, 22, 4),
(217, NULL, 7, 6.00, b'0', '+53.781s', 50, 22, 20),
(218, NULL, 8, 4.00, b'0', '+67.219s', 50, 22, 17),
(219, NULL, 9, 2.00, b'0', '+1 lap', 49, 22, 9),
(220, NULL, 10, 1.00, b'0', '+1 lap', 49, 22, 13),
-- R23: Qatar GP 2025 - Ganador: Max Verstappen
(221, NULL, 1, 25.00, b'0', '1:31:27.486', 57, 23, 5),
(222, NULL, 2, 18.00, b'0', '+6.219s', 57, 23, 2),
(223, NULL, 3, 15.00, b'0', '+12.781s', 57, 23, 1),
(224, NULL, 4, 12.00, b'0', '+19.219s', 57, 23, 7),
(225, NULL, 5, 10.00, b'0', '+28.673s', 57, 23, 8),
(226, NULL, 6, 8.00, b'0', '+39.341s', 57, 23, 3),
(227, NULL, 7, 6.00, b'0', '+51.781s', 57, 23, 4),
(228, NULL, 8, 4.00, b'0', '+65.219s', 57, 23, 9),
(229, NULL, 9, 2.00, b'0', '+1 lap', 56, 23, 17),
(230, NULL, 10, 1.00, b'0', '+1 lap', 56, 23, 18),
-- R24: Abu Dhabi GP 2025 - Ganador: Max Verstappen
(231, NULL, 1, 25.00, b'0', '1:26:13.912', 58, 24, 5),
(232, NULL, 2, 18.00, b'0', '+7.219s', 58, 24, 2),
(233, NULL, 3, 15.00, b'0', '+12.781s', 58, 24, 1),
(234, NULL, 4, 12.00, b'0', '+21.219s', 58, 24, 7),
(235, NULL, 5, 10.00, b'0', '+30.673s', 58, 24, 8),
(236, NULL, 6, 8.00, b'0', '+41.341s', 58, 24, 3),
(237, NULL, 7, 6.00, b'0', '+53.781s', 58, 24, 4),
(238, NULL, 8, 4.00, b'0', '+67.219s', 58, 24, 15),
(239, NULL, 9, 2.00, b'0', '+1 lap', 57, 24, 17),
(240, NULL, 10, 1.00, b'0', '+1 lap', 57, 24, 18),
-- R01 2026: Australian GP - Ganador: George Russell
(241, NULL, 1, 25.00, b'0', '1:23:06.801', 58, 25, 7),
(242, NULL, 2, 18.00, b'0', '+2.974s', 58, 25, 8),
(243, NULL, 3, 15.00, b'0', '+15.519s', 58, 25, 3),
(244, NULL, 4, 12.00, b'0', '+16.144s', 58, 25, 4),
(245, NULL, 5, 10.00, b'0', '+51.741s', 58, 25, 1),
(246, NULL, 6, 8.00, b'0', '+54.617s', 58, 25, 5),
(247, NULL, 7, 6.00, b'0', '+1 lap', 57, 25, 14),
(248, NULL, 8, 4.00, b'0', '+1 lap', 57, 25, 22),
(249, NULL, 9, 2.00, b'0', '+1 lap', 57, 25, 19),
(250, NULL, 10, 1.00, b'0', '+1 lap', 57, 25, 11),
-- R02 2026: Chinese GP - Ganador: Kimi Antonelli
(251, NULL, 1, 25.00, b'0', '1:33:15.607', 56, 26, 8),
(252, NULL, 2, 18.00, b'0', '+5.515s', 56, 26, 7),
(253, NULL, 3, 15.00, b'0', '+25.267s', 56, 26, 4),
(254, NULL, 4, 12.00, b'0', '+31.894s', 56, 26, 3),
(255, NULL, 5, 10.00, b'0', '+48.321s', 56, 26, 14),
(256, NULL, 6, 8.00, b'0', '+59.107s', 56, 26, 16),
(257, NULL, 7, 6.00, b'0', '+1 lap', 55, 26, 6),
(258, NULL, 8, 4.00, b'0', '+1 lap', 55, 26, 18),
(259, NULL, 9, 2.00, b'0', '+1 lap', 55, 26, 11),
(260, NULL, 10, 1.00, b'0', '+1 lap', 55, 26, 15),
-- R03 2026: Japanese GP - Ganador: Kimi Antonelli
(261, NULL, 1, 25.00, b'0', '1:28:03.403', 53, 27, 8),
(262, NULL, 2, 18.00, b'0', '+13.722s', 53, 27, 2),
(263, NULL, 3, 15.00, b'0', '+15.270s', 53, 27, 3),
(264, NULL, 4, 12.00, b'0', '+22.814s', 53, 27, 7),
(265, NULL, 5, 10.00, b'0', '+34.619s', 53, 27, 1),
(266, NULL, 6, 8.00, b'0', '+47.382s', 53, 27, 4),
(267, NULL, 7, 6.00, b'0', '+1 lap', 52, 27, 11),
(268, NULL, 8, 4.00, b'0', '+1 lap', 52, 27, 5),
(269, NULL, 9, 2.00, b'0', '+1 lap', 52, 27, 6),
(270, NULL, 10, 1.00, b'0', '+1 lap', 52, 27, 13),
-- R04 2026: Miami GP - Ganador: Kimi Antonelli
(271, NULL, 1, 25.00, b'0', '1:33:19.273', 57, 28, 8),
(272, NULL, 2, 18.00, b'0', '+3.264s', 57, 28, 1),
(273, NULL, 3, 15.00, b'0', '+27.092s', 57, 28, 2),
(274, NULL, 4, 12.00, b'0', '+34.817s', 57, 28, 7),
(275, NULL, 5, 10.00, b'0', '+42.391s', 57, 28, 5),
(276, NULL, 6, 8.00, b'0', '+51.217s', 57, 28, 4),
(277, NULL, 7, 6.00, b'0', '+58.673s', 57, 28, 3),
(278, NULL, 8, 4.00, b'0', '+1 lap', 56, 28, 12),
(279, NULL, 9, 2.00, b'0', '+1 lap', 56, 28, 18),
(280, NULL, 10, 1.00, b'0', '+1 lap', 56, 28, 17);
-- ============================================================
-- TABLA: resultado_sprint
-- ============================================================
CREATE TABLE `resultado_sprint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrera_id` bigint(20) DEFAULT NULL,
  `piloto_id` bigint(20) DEFAULT NULL,
  `posicion_final` int(11) DEFAULT NULL,
  `puntos_obtenidos` decimal(5,2) DEFAULT NULL,
  `vueltas` int(11) DEFAULT NULL,
  `tiempo` varchar(100) DEFAULT NULL,
  `retirado` tinyint(1) DEFAULT 0,
  `motivo_retiro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrera_id` (`carrera_id`),
  KEY `piloto_id` (`piloto_id`),
  CONSTRAINT `resultado_sprint_ibfk_1` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `resultado_sprint_ibfk_2` FOREIGN KEY (`piloto_id`) REFERENCES `piloto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
INSERT INTO `resultado_sprint` (`id`, `carrera_id`, `piloto_id`, `posicion_final`, `puntos_obtenidos`, `vueltas`, `tiempo`, `retirado`, `motivo_retiro`) VALUES
-- Sprint R02 2025: Chinese GP Sprint
(1, 2, 8, 1, 8.00, 19, '25:12.731', 0, NULL),
(2, 2, 2, 2, 7.00, 19, '+1.847s', 0, NULL),
(3, 2, 5, 3, 6.00, 19, '+5.213s', 0, NULL),
(4, 2, 7, 4, 5.00, 19, '+8.641s', 0, NULL),
(5, 2, 3, 5, 4.00, 19, '+12.389s', 0, NULL),
(6, 2, 16, 6, 3.00, 19, '+18.217s', 0, NULL),
(7, 2, 4, 7, 2.00, 19, '+22.541s', 0, NULL),
(8, 2, 1, 8, 1.00, 19, '+26.873s', 0, NULL),
-- Sprint R06 2025: Miami GP Sprint
(9, 6, 5, 1, 8.00, 19, '24:58.412', 0, NULL),
(10, 6, 1, 2, 7.00, 19, '+4.217s', 0, NULL),
(11, 6, 2, 3, 6.00, 19, '+8.673s', 0, NULL),
(12, 6, 7, 4, 5.00, 19, '+13.341s', 0, NULL),
(13, 6, 8, 5, 4.00, 19, '+17.781s', 0, NULL),
(14, 6, 3, 6, 3.00, 19, '+22.219s', 0, NULL),
(15, 6, 4, 7, 2.00, 19, '+27.673s', 0, NULL),
(16, 6, 16, 8, 1.00, 19, '+33.341s', 0, NULL),
-- Sprint R13 2025: Belgian GP Sprint
(17, 13, 5, 1, 8.00, 17, '26:18.923', 0, NULL),
(18, 13, 2, 2, 7.00, 17, '+3.217s', 0, NULL),
(19, 13, 1, 3, 6.00, 17, '+7.673s', 0, NULL),
(20, 13, 7, 4, 5.00, 17, '+12.341s', 0, NULL),
(21, 13, 3, 5, 4.00, 17, '+17.781s', 0, NULL),
(22, 13, 8, 6, 3.00, 17, '+23.219s', 0, NULL),
(23, 13, 4, 7, 2.00, 17, '+29.673s', 0, NULL),
(24, 13, 20, 8, 1.00, 17, '+36.341s', 0, NULL),
-- Sprint R19 2025: United States GP Sprint
(25, 19, 5, 1, 8.00, 19, '25:06.146', 0, NULL),
(26, 19, 2, 2, 7.00, 19, '+3.882s', 0, NULL),
(27, 19, 1, 3, 6.00, 19, '+6.240s', 0, NULL),
(28, 19, 7, 4, 5.00, 19, '+11.217s', 0, NULL),
(29, 19, 8, 5, 4.00, 19, '+15.673s', 0, NULL),
(30, 19, 3, 6, 3.00, 19, '+21.341s', 0, NULL),
(31, 19, 4, 7, 2.00, 19, '+27.781s', 0, NULL),
(32, 19, 16, 8, 1.00, 19, '+34.219s', 0, NULL),
-- Sprint R21 2025: São Paulo GP Sprint
(33, 21, 1, 1, 8.00, 24, '29:46.045', 0, NULL),
(34, 21, 2, 2, 7.00, 24, '+0.593s', 0, NULL),
(35, 21, 3, 3, 6.00, 24, '+5.656s', 0, NULL),
(36, 21, 5, 4, 5.00, 24, '+6.497s', 0, NULL),
(37, 21, 4, 5, 4.00, 24, '+7.224s', 0, NULL),
(38, 21, 7, 6, 3.00, 24, '+12.475s', 0, NULL),
(39, 21, 16, 7, 2.00, 24, '+18.161s', 0, NULL),
(40, 21, 6, 8, 1.00, 24, '+18.717s', 0, NULL),
-- Sprint R23 2025: Qatar GP Sprint
(41, 23, 2, 1, 8.00, 19, '27:03.010', 0, NULL),
(42, 23, 1, 2, 7.00, 19, '+0.136s', 0, NULL),
(43, 23, 7, 3, 6.00, 19, '+0.410s', 0, NULL),
(44, 23, 5, 4, 5.00, 19, '+3.217s', 0, NULL),
(45, 23, 8, 5, 4.00, 19, '+7.673s', 0, NULL),
(46, 23, 3, 6, 3.00, 19, '+12.341s', 0, NULL),
(47, 23, 4, 7, 2.00, 19, '+17.781s', 0, NULL),
(48, 23, 6, 8, 1.00, 19, '+23.219s', 0, NULL),
-- Sprint R02 2026: Chinese GP Sprint
(49, 26, 7, 1, 8.00, 17, '23:47.312', 0, NULL),
(50, 26, 8, 2, 7.00, 17, '+2.317s', 0, NULL),
(51, 26, 3, 3, 6.00, 17, '+5.891s', 0, NULL),
(52, 26, 4, 4, 5.00, 17, '+9.234s', 0, NULL),
(53, 26, 14, 5, 4.00, 17, '+13.671s', 0, NULL),
(54, 26, 16, 6, 3.00, 17, '+18.219s', 0, NULL),
(55, 26, 6, 7, 2.00, 17, '+23.673s', 0, NULL),
(56, 26, 11, 8, 1.00, 17, '+29.341s', 0, NULL),
-- Sprint R04 2026: Miami GP Sprint
(57, 28, 1, 1, 8.00, 19, '24:18.923', 0, NULL),
(58, 28, 2, 2, 7.00, 19, '+3.766s', 0, NULL),
(59, 28, 3, 3, 6.00, 19, '+6.251s', 0, NULL),
(60, 28, 7, 4, 5.00, 19, '+12.951s', 0, NULL),
(61, 28, 8, 5, 4.00, 19, '+17.341s', 0, NULL),
(62, 28, 5, 6, 3.00, 19, '+23.781s', 0, NULL),
(63, 28, 4, 7, 2.00, 19, '+29.219s', 0, NULL),
(64, 28, 11, 8, 1.00, 19, '+35.673s', 0, NULL);
COMMIT;