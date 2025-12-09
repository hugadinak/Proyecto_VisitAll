-- Adminer 4.8.1 MySQL 10.11.6-MariaDB-0+deb12u1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1,	'Turismo cultural',	'2025-02-03 19:49:53',	'2025-02-03 19:49:53'),
(2,	'Turismo deportivo y de eventos',	'2025-02-03 19:50:13',	'2025-02-03 19:50:13'),
(3,	'Turismo sostenible',	'2025-02-03 19:50:32',	'2025-02-03 19:50:32'),
(4,	'Turismo de aventura',	'2025-02-03 19:50:56',	'2025-02-03 19:50:56'),
(5,	'Turismo recreativo o viajes de ocio',	'2025-02-03 19:54:53',	'2025-02-03 19:54:53'),
(6,	'Turismo de negocios o corporativo',	'2025-02-03 19:55:15',	'2025-02-03 19:55:15'),
(7,	'Turismo rural',	'2025-02-03 19:55:35',	'2025-02-03 19:55:35');

DROP TABLE IF EXISTS `demandantes`;
CREATE TABLE `demandantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumidor_id` int(11) NOT NULL,
  `nombre_actividad` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_actividad` varchar(50) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `lugar` varchar(100) DEFAULT NULL,
  `necesidades_especiales` text DEFAULT NULL,
  `fecha_solicitud` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `consumidor_id` (`consumidor_id`),
  CONSTRAINT `demandantes_ibfk_1` FOREIGN KEY (`consumidor_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `demandantes` (`id`, `consumidor_id`, `nombre_actividad`, `descripcion`, `tipo_actividad`, `fecha_inicio`, `fecha_fin`, `lugar`, `necesidades_especiales`, `fecha_solicitud`) VALUES
(1,	2,	'Visita cultural a Sevilla',	'Recorrido por los principales monumentos históricos de Sevilla.',	'Turismo cultural',	'2025-12-01 09:00:00',	'2025-12-01 18:00:00',	'Sevilla',	'Acceso adaptado para silla de ruedas',	'2025-11-22 20:48:35'),
(2,	4,	'Excursión de senderismo en Sierra Nevada',	'Ruta de 10 km para todos los niveles con guía profesional.',	'Turismo de aventura',	'2025-12-05 08:00:00',	'2025-12-05 16:00:00',	'Granada',	'Se requiere buen calzado y agua suficiente',	'2025-11-22 20:48:35'),
(3,	23,	'Visita a bodegas de La Rioja',	'Degustación y recorrido por bodegas tradicionales.',	'Turismo enológico',	'2025-12-10 10:00:00',	'2025-12-10 18:00:00',	'La Rioja',	'No apto para menores de 18 años',	'2025-11-22 20:48:35'),
(4,	24,	'Ruta gastronómica en Valencia',	'Descubre la gastronomía local con guía experto.',	'Turismo gastronómico',	'2025-12-15 11:00:00',	'2025-12-15 20:00:00',	'Valencia',	'Opciones vegetarianas disponibles',	'2025-11-22 20:48:35'),
(5,	25,	'Visita a museos de Madrid',	'Recorrido por los museos más emblemáticos de Madrid.',	'Turismo cultural',	'2025-12-20 09:30:00',	'2025-12-20 18:00:00',	'Madrid',	'Entrada gratuita para estudiantes',	'2025-11-22 20:48:35'),
(6,	4,	'popoopo322',	'yesssssssssssss',	'popoopo2323',	'2025-11-05 00:00:00',	'2025-11-11 00:00:00',	'paris',	'no',	'2025-11-23 17:18:04');

DROP TABLE IF EXISTS `gestores`;
CREATE TABLE `gestores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `gestores_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `gestores` (`id`, `perfil_id`, `nombre`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1,	1,	'Nombre Administrador ',	'admin@email.com',	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	'2025-02-03 19:56:56',	'2025-02-03 19:56:56'),
(2,	2,	'Nombre Gestor',	'gestor@email.com',	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	'2025-02-03 19:57:34',	'2025-02-03 19:57:34'),
(4,	2,	'huuo',	'gesto2r@email.com',	'$2y$10$2PytLoDjPIfGB13u0vTtTuH8vjjz.Lx4K0Jj/IPqUBemBQtHisCrW',	'2025-02-25 11:19:50',	'2025-02-25 11:19:50'),
(5,	2,	'darkraiasa',	'a@gaaoi.com',	'$2y$10$/wm19qzauoQja6DUR.TXneHg1Arjv5GqkngiTgtXr4xYX45ljGMMW',	'2025-02-28 11:16:31',	'2025-02-28 11:25:05'),
(6,	2,	'xxsawe',	'a@gaaafhfgsaoi.com',	'$2y$10$vIY60fGdbjrXyKeob3HrrelvgTyRKlgQS0BnpxuSC1dwO2I2674MG',	'2025-03-01 17:17:59',	'2025-03-02 18:59:22'),
(7,	2,	'dsasa',	'gdgor@email.com',	'$2y$10$eEAJKG0B5wl9J7WDKVpMtu3NK1J2RMHzl7wEqQx6b8C.UIOt/.SMe',	'2025-03-02 19:03:46',	'2025-03-03 09:56:57'),
(9,	2,	'Juan Maaasd',	'ncp06693bgf@omeie.com',	'$2y$10$yjE941APitcyF4pfqQLlHOdOWpVGlBcYnDH7FezEjBUNgMM3DavEa',	'2025-03-03 09:57:02',	'2025-03-03 10:41:46'),
(11,	2,	'Juaasda',	'ncp06693@omeie.com',	'$2y$10$GNAKtFk8erEKqvrfSwLwuOso2kdQjWdnpk2kd5nbSs61wlVhbLiVO',	'2025-03-03 10:43:54',	'2025-03-03 10:44:33'),
(12,	2,	'Juan Mario',	'juan@gmail.com',	'$2y$10$TFrD2b.2UO5SaUer1Eee3uniDJn1KLbwEc1ub4gT9g58s3uwM7Z5e',	'2025-11-16 19:14:16',	'2025-11-16 19:14:16');

DROP TABLE IF EXISTS `ofertas`;
CREATE TABLE `ofertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `fecha_actividad` datetime NOT NULL,
  `aforo` int(11) NOT NULL,
  `visada` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `ofertas_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ofertas` (`id`, `usuario_id`, `categoria_id`, `nombre`, `descripcion`, `fecha_actividad`, `aforo`, `visada`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'Concierto: octavo del Gran Sinfónico de la ROSS en Sevilla 2024-2025',	'El jueves 3 y el viernes 4 de abril de 2025 en el Teatro de la Maestranza de Sevilla octavo concierto del ciclo Gran Sinfónico de la Real Orquesta Sinfónica (ROSS).',	'2025-04-03 21:10:37',	100,	1,	'2025-02-03 20:10:37',	'2025-02-03 20:10:37'),
(2,	1,	1,	'\"Luces de Bohemia\", de Ramón del Valle-Inclán',	'Este mes el #clublecturatextosdramaticos de Sevilla analiza la obra Luces de bohemia, escrita por el dramaturgo español Ramón del Valle-Inclán, obra esencial para entender la literatura española del s. XX.',	'2025-04-04 21:13:00',	50,	1,	'2025-02-03 20:13:00',	'2025-02-03 20:13:00'),
(3,	3,	7,	'EXPLORANDO EL CORAZON DE CAZORLA',	'Solo para senderistas expert@s estaremos en el interior del parque natural alojados a una hora de el pueblo mas proximo, solo 15 personas',	'2025-02-14 21:20:13',	15,	1,	'2025-02-03 20:20:13',	'2025-02-03 20:20:13'),
(4,	3,	7,	'Tierras de José María el Tempranillo - Sendero del Paraje Natural del Embalse de Malpasillo- Ermira de Nuestra Señora de la Fuensanta',	'Este sendero forma parte de la red de senderos de la Ruta Tierras de José María el Tempranillo, su recorrido circular, permite al senderista descubrir lugares de gran belleza, como el Paraje Natural del Embalse de Malpasillo, el Meandro que el Río',	'2025-02-14 21:20:13',	20,	1,	'2025-02-03 20:24:58',	'2025-02-03 20:24:58'),
(5,	1,	5,	'Excursión de un día a Gibraltar desde Sevilla',	'lo que sea ',	'2025-03-05 11:25:00',	25,	1,	'2025-02-05 10:25:00',	'2025-02-05 10:25:00'),
(6,	3,	4,	'Senderismo en el Caminito del Rey desde Sevilla',	'Una vez conocido como el camino más peligroso de senderismo en todo el mundo, el Caminito del Rey es ahora uno de las atracciones más populares en España. Asegúrese la entrada al reservar con antelación.',	'2025-03-15 11:33:04',	10,	1,	'2025-02-05 10:33:04',	'2025-02-05 10:33:04'),
(18,	1,	1,	'sdg',	'gdsg',	'2025-03-12 00:00:00',	123,	0,	'2025-03-03 10:46:45',	'2025-03-03 10:46:45'),
(19,	1,	2,	'asdasdasd',	'dfdf',	'2025-10-29 00:00:00',	12111,	0,	'2025-11-15 17:49:58',	'2025-11-15 17:49:58'),
(20,	1,	1,	'xfvcgb',	'papapapap',	'2025-11-19 00:00:00',	233,	0,	'2025-11-16 19:14:38',	'2025-11-16 19:14:38'),
(21,	1,	5,	'xfvcgb323',	'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',	'2025-11-05 00:00:00',	23323,	0,	'2025-11-22 17:11:45',	'2025-11-22 17:11:45'),
(22,	1,	5,	'xfvcgb323',	'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa',	'2025-11-11 00:00:00',	23323,	0,	'2025-11-22 17:11:45',	'2025-11-22 17:11:45'),
(23,	1,	1,	'pppppppppppppp',	'ppppppppp',	'2025-11-04 00:00:00',	12121,	0,	'2025-11-22 17:23:33',	'2025-11-22 17:23:33'),
(24,	1,	1,	'admin',	'adminadminadminadminadminadminadmin',	'2025-10-28 00:00:00',	1,	1,	'2025-11-22 17:32:44',	'2025-11-22 17:32:44'),
(25,	3,	1,	'cvcb',	'cvcbn',	'2025-10-29 00:00:00',	7777,	0,	'2025-11-29 18:14:45',	'2025-11-29 18:14:45'),
(26,	61,	1,	'6dic',	'6dic',	'2025-12-06 00:00:00',	6122025,	0,	'2025-12-06 17:10:52',	'2025-12-06 17:10:52');

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `perfiles` (`id`, `perfil`, `created_at`, `updated_at`) VALUES
(1,	'administrador',	'2025-02-03 19:43:19',	'2025-02-03 19:43:19'),
(2,	'gestor',	'2025-02-03 19:43:53',	'2025-02-03 19:43:53'),
(3,	'ofertante',	'2025-02-03 19:44:14',	'2025-02-03 19:44:14'),
(4,	'demandante',	'2025-02-03 19:44:39',	'2025-02-03 19:44:39');

DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE `solicitudes` (
  `oferta_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`oferta_id`,`usuario_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`oferta_id`) REFERENCES `ofertas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `solicitudes` (`oferta_id`, `usuario_id`, `fecha_solicitud`, `created_at`, `updated_at`) VALUES
(1,	1,	'2025-12-05 10:49:25',	'2025-12-05 09:49:25',	'2025-12-05 09:49:25'),
(1,	2,	'2025-02-03 21:27:46',	'2025-02-03 20:27:46',	'2025-02-03 20:27:46'),
(1,	3,	'2025-02-28 11:39:31',	'2025-02-28 10:39:31',	'2025-02-28 10:39:31'),
(1,	4,	'2025-03-02 23:00:47',	'2025-03-02 22:00:47',	'2025-03-02 22:00:47'),
(1,	61,	'2025-12-06 18:12:47',	'2025-12-06 17:12:47',	'2025-12-06 17:12:47'),
(2,	2,	'2025-02-03 21:28:38',	'2025-02-03 20:28:38',	'2025-02-03 20:28:38'),
(3,	1,	'2025-03-02 20:02:21',	'2025-03-02 19:02:21',	'2025-03-02 19:02:21'),
(3,	4,	'2025-02-03 21:28:49',	'2025-02-03 20:28:49',	'2025-02-03 20:28:49'),
(4,	2,	'2025-02-03 21:29:33',	'2025-02-03 20:29:33',	'2025-02-03 20:29:33'),
(4,	4,	'2025-02-03 21:29:44',	'2025-02-03 20:29:44',	'2025-02-03 20:29:44'),
(4,	61,	'2025-12-06 18:12:48',	'2025-12-06 17:12:48',	'2025-12-06 17:12:48'),
(5,	1,	'2025-03-02 20:02:23',	'2025-03-02 19:02:23',	'2025-03-02 19:02:23'),
(6,	61,	'2025-12-06 18:12:50',	'2025-12-06 17:12:50',	'2025-12-06 17:12:50'),
(24,	1,	'2025-11-22 18:46:10',	'2025-11-22 17:46:10',	'2025-11-22 17:46:10');

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `password` varchar(256) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `token` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `perfil_id`, `password`, `activo`, `token`, `created_at`, `updated_at`) VALUES
(1,	'Nombre Ofertante 1',	'ofertante1@email.com',	3,	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	1,	'68fd71bc7e982bf3945d6a829f238b6d',	'2025-02-03 20:03:52',	'2025-02-03 20:03:52'),
(2,	'Nombre Demandante 1',	'demandante1@email.com',	4,	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	1,	'68fd71bc7e982bf3945d6a829f238b6d',	'2025-02-03 20:04:52',	'2025-02-03 20:04:52'),
(3,	'Nombre Ofertante 2',	'ofertante2@email.com',	3,	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	1,	'68fd71bc7e982bf3945d6a829f238b6d',	'2025-02-03 20:06:51',	'2025-02-03 20:06:51'),
(4,	'Nombre Demandante 2',	'demandante2@email.com',	4,	'$2y$10$W35AGHEZPahUUwLQQ9nnyOL3eu6esjvUcE2Mue63OeoEtfK89C1GK',	1,	'68fd71bc7e982bf3945d6a829f238b6d',	'2025-02-03 20:07:40',	'2025-02-03 20:07:40'),
(5,	'huuo',	'admisan@email.com',	2,	'$2y$10$DYJzf0qqy7/HF0lK94ndZOSdL/4x9mvY/Zi8..jjsTkGwhTjH0Diy',	0,	'b498b5ad383aabd36306eb704565da59',	'2025-02-24 19:08:56',	'2025-02-24 19:08:56'),
(6,	'huuo',	'adqwqwmin@email.com',	2,	'$2y$10$bf6jpZ5VIIUAQ9wa30r87eFmXWzJ0JwvBWj/YxTP6Nx2sBPcB5C5G',	0,	'918bb2831ff8049a616b309b493e6704',	'2025-02-24 19:09:30',	'2025-02-24 19:09:30'),
(7,	'huuo',	'asas@gmail.com',	2,	'$2y$10$RI4FqKkcr4H6tfgXRhtU1eXhdROkXuSwY4c4wfwq0zn7LTVuTK25S',	0,	'44cfa08dd50a9ea0da07592054b4bfcd',	'2025-02-24 19:11:20',	'2025-02-24 19:11:20'),
(8,	'asas',	'aassas@gmail.com',	1,	'$2y$10$KhwFSlcE1av2rVmIz0OM0.kryPAXAwR.NITbpIc03oYrcH1jEkHsO',	0,	'9589403a076aeac2e55ab05ea9ed6c29',	'2025-02-24 19:12:26',	'2025-02-24 19:12:26'),
(9,	'asas',	'aassasas@gmail.com',	1,	'$2y$10$Mb2zFVwGm822oOW.dJgNleAVdPIjhfZrmyldtpw7cLQYzzGRAdPQK',	0,	'5e449e609690d54abf2fb3bc912e0b99',	'2025-02-24 19:13:17',	'2025-02-24 19:13:17'),
(23,	'Juan Mario ',	'ncpzxsad06693@omeie.com',	4,	'$2y$10$hO7JbdAsZBhvlfJ6RFPcxO5j7muKST6hc2myP7UVsMmbXuf3IINSu',	1,	'',	'2025-02-28 11:52:41',	'2025-02-28 11:52:41'),
(24,	'Juan Mario xc',	'ncpzxsadxcxc06693@omeie.com',	4,	'$2y$10$iwOZq1czLcYaq59RBgmZC.tYQk3w5bMqgLIu4MmNDGHrdvah660Tm',	1,	'',	'2025-02-28 11:58:36',	'2025-02-28 11:58:36'),
(25,	'hugos',	'asasdg@gmail.com',	4,	'$2y$10$sjcM3iY2m2FLUdX2LQ0J0O0lMwRXu1MkfL4.cAJsgtJSadBd8h8XS',	1,	'3c5f916976cb32097ee0d4da00654838',	'2025-02-28 12:02:27',	'2025-02-28 12:02:27'),
(26,	'hugos',	'asadfsdasag@gmail.com',	3,	'$2y$10$wBv/RDpxiCqUxP3RjI6dDuI4GS3zCm4DAcEmutde89qQ7mKl5hmkW',	1,	'445a77f0e7716a4ac85bb012454efca4',	'2025-02-28 16:44:19',	'2025-02-28 16:44:19'),
(34,	'lolhghfas',	'ofertadfnte1@email.com',	4,	'$2y$10$fqLgWf6IXfynW40GNXuq4.7B6t4qzm8JUNCnhBV.MBSGuj4pGSjqi',	0,	'fe10a65cdc6a86eff7f6463d344892c5',	'2025-03-02 10:13:22',	'2025-03-02 10:13:22'),
(35,	'lolhgdshfas',	'a@gadsaoi.com',	3,	'$2y$10$vWcWsNHzZxCBCZ1Hd/3w4uKgKcx6F.wslpcxJAHjSev4jNT59qdXi',	0,	'2ddc61538154bab320ae6a1535d9e8e7',	'2025-03-02 10:15:58',	'2025-03-02 10:15:58'),
(36,	'sdasdg',	'hugoinfadsdntee@gmail.com',	4,	'$2y$10$Kzn08y9pd6GtC26rIBSlw.xAH4p.4XTo7WTfy6IN.guhXH2P0dx1S',	0,	'01e623813dabe6d1e8b054a0a6167d62',	'2025-03-02 10:16:32',	'2025-03-02 10:16:32'),
(37,	'sdasd',	'gesdstor@email.com',	3,	'$2y$10$/a6GzYq7Na5gy1wwZHDIS.SvQjpIGTD6lbqcM14nf2B./353WRUn.',	0,	'1e9e51e60069b7ab7da47907c1cab73f',	'2025-03-02 10:21:33',	'2025-03-02 10:21:33'),
(38,	'Juan Mario hgj',	'asafddasdghsdsas@gmail.com',	3,	'$2y$10$0Gt.J4zIRry0f71NNqo8hu4IKpfAjkns6mubWDAcwib7WpnIMxCva',	0,	'057935924113b0332b8616afc7449b27',	'2025-03-02 11:45:49',	'2025-03-02 11:45:49'),
(39,	'adriana',	'adminadriana@email.com',	3,	'$2y$10$uj3ISrGw5fbxCF5edpxlb.W02CfEMfd228DrUagSbTD6xfKp0ZhES',	0,	'882215663ed228746757dbc64e34056a',	'2025-03-02 11:53:02',	'2025-03-02 11:53:02'),
(40,	'Juan Mario hgj',	'alhsdsas@gmail.com',	3,	'$2y$10$eYQliUB7kYJ01Zsu7iNTOeLxfSEWwf4IPLWv.Ny4Gj5LEHHOacrE2',	0,	'bc3e4f4d68e7f5f7555c45f0b6e534be',	'2025-03-02 11:54:57',	'2025-03-02 11:54:57'),
(41,	'Juan Mario hgj',	'alhsdsasd@gmail.com',	3,	'$2y$10$BKeln7dL8sH.ivPkV.kYCO1TFyBJ7CIhYRZloZVTH8Ng7K03nOJoy',	1,	'99cd31aa5cbad188423e6a205f7b298b',	'2025-03-02 11:56:04',	'2025-03-02 11:56:04'),
(42,	'Juan Mario hgj',	'alhsdsdasdasd@gmail.com',	3,	'$2y$10$VkRytxZyO27uyBEZ1y0uZOYs0Rz.5kS/DwR35LyksjWqqnAqBkM.y',	1,	'7ffb7bc78fb0f287a1e2983149bca8d3',	'2025-03-02 12:21:33',	'2025-03-02 12:21:33'),
(43,	'Juan Mario hgj',	'alhsdsdasdgfasd@gmail.com',	4,	'$2y$10$eyUw.9abwSaR9XtGrHdm1OlbPqNL0OYm0tVr96Z1DfBHlJ4pFTuoS',	0,	'3b1c1c4fd0a6362c39c6167a5db50f54',	'2025-03-02 12:24:29',	'2025-03-02 12:24:29'),
(44,	'kohjso',	'asasewe@gmail.come',	4,	'$2y$10$IpI92M1jnd8FRMxL7IYm2uoYCvdm2bjcTcUe3Jggeyq9/HisdCm4u',	1,	'b84068bfe8369b942ec94ad10e0d7039',	'2025-03-02 12:24:53',	'2025-03-02 12:24:53'),
(45,	'huuo',	'asasas@gmail.com',	3,	'$2y$10$kUlTsBK4dGq0XRPn9aYa6.o.gbKqOritlCs91vXsYyXhhFgliCiUS',	0,	'44ae9c8c2054963094c4ffe3e185afaa',	'2025-03-02 16:34:25',	'2025-03-02 16:34:25'),
(46,	'sadv',	'pruebasa2@email.com',	3,	'$2y$10$ijrFP7booNlbhHIjawEgMeexKlsb3srGJUg49V8XOelihcCkofZHO',	0,	'b71782c9b6e10727b17c790280c14e58',	'2025-03-02 16:36:23',	'2025-03-02 16:36:23'),
(47,	'huuo',	'corresao@ejemplo.com',	3,	'$2y$10$8c9ZQhk4d2rCBvdqYZvUd.3JriHChbj78geN0ktlcYeQk7vNFHBKy',	1,	'4098e3998f8837fd87360672ad442359',	'2025-03-02 16:36:59',	'2025-03-02 16:36:59'),
(48,	'huuo',	'admiasan3@email.com',	4,	'$2y$10$nw0tZ./8qKM2eLPG5H5F9ufESj5GnJTmTKTGZ1KGCT8erg86PQfrm',	1,	'c5ee73fdbe996e4522a6d0c60b684dd5',	'2025-03-02 16:37:36',	'2025-03-02 16:37:36'),
(49,	'kohjsofs',	'assdfsewe@gmail.come',	3,	'$2y$10$Pg9L51zxMmFhazKaOYjhieQgGBGg.w61.32H6fBcniK9ueuvAh/MW',	0,	'1221a14836082aee8c97085a72c7a8c0',	'2025-03-03 10:47:38',	'2025-03-03 10:47:38'),
(50,	'kohjsofs',	'assdfsewdfe@gmail.come',	4,	'$2y$10$.OcJ/4EW2AwRpf1adsQvtelNKoFjfCAyLbeISyy69wTrnK/QD2iyW',	1,	'ab53258957cc63de338326099b53155d',	'2025-03-03 10:48:09',	'2025-03-03 10:48:09'),
(51,	'30sep',	'30sep@gmail.com',	3,	'$2y$10$ULcqbubXKHGxwpoIB4cFve4m4wBgKiC0vOC3oFuQ7RRC478YoVv8y',	0,	'b0838cc8882e6e67b2c2e5eb5112ae7d',	'2025-09-30 16:07:07',	'2025-09-30 16:07:07'),
(52,	'30sep2',	'30sep2@gmail.com',	3,	'$2y$10$XkSq4XaekNO50gQS4g2mj.V7igpcs4w8o19xG.NjKwR//5s3AcT0W',	1,	'aa737eda6b2a7df2de1ca5b703ced381',	'2025-09-30 16:12:27',	'2025-09-30 16:12:27'),
(53,	'1oct',	'1oct@gmail.com',	3,	'$2y$10$2aV57CIL22l6eyyOY4fZbeffjRqr/S0mrL67K5eBdH0kvuS6yW2re',	0,	'e4a2c9b1bccdcbb94a46da29338e80d1',	'2025-10-01 17:31:10',	'2025-10-01 17:31:10'),
(54,	'22nov',	'22nov@gmail.com',	3,	'$2y$10$F7bgynasHq/wqn4qb/ZfTOXn9WF/.sk6dvx7AHPN4F4qSbY8vF40i',	1,	'2d3ea09dc219546d9a9bcfdd07ce1758',	'2025-11-22 12:07:58',	'2025-11-22 12:07:58'),
(55,	'22nov',	'29nov@gmail.com',	4,	'$2y$10$QMaFPknY57b3/StlanULa.Zl5G4iq2IKr2gD017G6XtHqBMbJ89R2',	0,	'a5e453a124e441406d4ef7c6b61d11fb',	'2025-11-29 20:19:19',	'2025-11-29 20:19:19'),
(56,	'22nov',	'29nov2@gmail.com',	3,	'$2y$10$IsHsGyP9OoNsSEeWs6cHpuqMNDHpfIvTq.iGRXyb6jmj08YCpIEYW',	1,	'72bb72b2ab78c67c05fcde60a6167d21',	'2025-11-29 20:24:28',	'2025-11-29 20:24:28'),
(57,	'5dic',	'5dic@gmail.com',	3,	'$2y$10$YTH02tzq0zC19MgcuWlOFO1wa7vXnSPUtP.QvY7mP4hV47N8nb9Wa',	1,	'e81541a3158f4c994526360c83cfd97a',	'2025-12-05 09:38:03',	'2025-12-05 09:38:03'),
(58,	'5dic2',	'5dic2@gmail.com',	3,	'$2y$10$qu4ZzBEoBw/gCu.Amk8KWOoegxbNPCf2j8UMAdzgbpqDDuYO5zwqq',	0,	'47465fcd550fa8e0e5d439141b7184e8',	'2025-12-05 09:43:54',	'2025-12-05 09:43:54'),
(59,	'5dic3',	'5dic3@gmail.com',	3,	'$2y$10$VXJ5Nf/V0LpJ5Z8VZwNwAumstqxPDvswg2pa8RP7IltKvnQ4/wI2G',	1,	'a8346b3a560ec5511ee443f671105cab',	'2025-12-05 09:53:50',	'2025-12-05 09:53:50'),
(60,	'5dic5',	'5dic5@gmail.com',	3,	'$2y$10$BjJH2FFMetl95.QATJ8f1eA9F.31q3VU6vyMniH8HVRedHCqUyG9m',	1,	'938414f352229a1273ccd035f75d980a',	'2025-12-06 16:07:10',	'2025-12-06 16:07:10'),
(61,	'6dic1',	'6dic1@gmail.com',	3,	'$2y$10$qURLFEKUhp87Sf104peaQeUVXPzX95GrWpfcQvRyl8BFARe2srGCK',	1,	'7ccb6672ac5ca263b79b4f408a94364e',	'2025-12-06 17:00:38',	'2025-12-06 17:00:38'),
(62,	'7dic1',	'7dic1@gmail.com',	3,	'$2y$10$jrGA5VNhqtCi/yJ1YUbWmupj5vTzD/H34ejpboaMcQEd1yoxVadc6',	0,	'5ad6f3d3d4d92ff61f4b62a3692990e0',	'2025-12-07 18:36:34',	'2025-12-07 18:36:34'),
(63,	'7dic2',	'7dic2@gmail.com',	3,	'$2y$10$8HorLcy1h74CYUKfP2RQbeXLPf2Ic3Tf6pkR1WmwymwQ40lLEWxgq',	1,	'4f12d5cbb9a32682bc31a0fabe7dc73b',	'2025-12-07 18:39:33',	'2025-12-07 18:39:33');

-- 2025-12-08 21:21:20
