-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-03-2026 a las 14:43:25
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siscalidad_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `nit`, `dir`, `fono`, `web`, `actividad`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SISCALIDAD', 'SC', 'SISCALIDAD S.A.', '1111111111', 'LOS OLIVOS #111', '2222222', '', 'ACTIVIDAD', '', '1772032591_1.png', '2026-02-16 22:21:27', '2026-02-25 15:16:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_calidads`
--

CREATE TABLE `control_calidads` (
  `id` bigint UNSIGNED NOT NULL,
  `produccion_id` bigint UNSIGNED NOT NULL,
  `nro_proceso` int NOT NULL,
  `tiempo` int DEFAULT NULL,
  `calidad` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `control_calidads`
--

INSERT INTO `control_calidads` (`id`, `produccion_id`, `nro_proceso`, `tiempo`, `calidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 30, 30, '2026-03-04 12:46:37', '2026-03-04 13:07:45'),
(2, 1, 2, 20, 70, '2026-03-04 12:46:37', '2026-03-04 14:02:24'),
(3, 1, 3, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(4, 1, 4, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(5, 1, 5, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(6, 1, 6, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(7, 1, 7, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(8, 1, 8, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(9, 1, 9, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(10, 1, 10, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(11, 1, 11, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(12, 1, 12, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(13, 1, 13, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(14, 1, 14, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(15, 1, 15, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(16, 1, 16, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(17, 1, 17, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(18, 1, 18, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(19, 1, 19, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(20, 1, 20, NULL, NULL, '2026-03-04 12:46:37', '2026-03-04 12:46:37'),
(21, 2, 1, 10, 10, '2026-03-04 13:08:59', '2026-03-04 14:02:48'),
(22, 2, 2, 20, 25, '2026-03-04 13:08:59', '2026-03-04 14:02:50'),
(23, 2, 3, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(24, 2, 4, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(25, 2, 5, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(26, 2, 6, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(27, 2, 7, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(28, 2, 8, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(29, 2, 9, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(30, 2, 10, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(31, 2, 11, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(32, 2, 12, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(33, 2, 13, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(34, 2, 14, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(35, 2, 15, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(36, 2, 16, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(37, 2, 17, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(38, 2, 18, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(39, 2, 19, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59'),
(40, 2, 20, NULL, NULL, '2026-03-04 13:08:59', '2026-03-04 13:08:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` json DEFAULT NULL,
  `datos_nuevo` json DEFAULT NULL,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 1, \"nombre\": \"PRODUCTO 1\", \"created_at\": \"2026-02-26T18:52:39.000000Z\", \"updated_at\": \"2026-02-26T18:52:39.000000Z\", \"fecha_registro\": \"26/02/2026\"}', NULL, 'PRODUCTOS', '2026-02-26', '14:52:39', '2026-02-26 18:52:39', '2026-02-26 18:52:39'),
(2, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:53:37.000000Z\", \"updated_at\": \"2026-02-26T18:53:37.000000Z\", \"fecha_registro\": \"2026-02-26\"}', NULL, 'PRODUCTOS', '2026-02-26', '14:53:37', '2026-02-26 18:53:37', '2026-02-26 18:53:37'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN PRODUCTO', '{\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:53:37.000000Z\", \"updated_at\": \"2026-02-26T18:53:37.000000Z\", \"fecha_registro\": \"2026-02-26\"}', '{\"id\": 2, \"nombre\": \"PRODUCTO 2ASD\", \"created_at\": \"2026-02-26T18:53:37.000000Z\", \"updated_at\": \"2026-02-26T18:53:41.000000Z\", \"fecha_registro\": \"2026-02-26\"}', 'PRODUCTOS', '2026-02-26', '14:53:41', '2026-02-26 18:53:41', '2026-02-26 18:53:41'),
(4, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN PRODUCTO', '{\"id\": 2, \"nombre\": \"PRODUCTO 2ASD\", \"created_at\": \"2026-02-26T18:53:37.000000Z\", \"updated_at\": \"2026-02-26T18:53:41.000000Z\", \"fecha_registro\": \"2026-02-26\", \"parametrizacions\": []}', NULL, 'PRODUCTOS', '2026-02-26', '14:57:48', '2026-02-26 18:57:48', '2026-02-26 18:57:48'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:58:30.000000Z\", \"updated_at\": \"2026-02-26T18:58:30.000000Z\", \"fecha_registro\": \"2026-02-26\"}', NULL, 'PRODUCTOS', '2026-02-26', '14:58:30', '2026-02-26 18:58:30', '2026-02-26 18:58:30'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 0, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:31:49.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": \"5\", \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:49:53.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:49:53', '2026-02-28 19:49:53', '2026-02-28 19:49:53'),
(7, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 5, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:49:53.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": \"6\", \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:50:51.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:50:51', '2026-02-28 19:50:51', '2026-02-28 19:50:51'),
(8, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 6, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:50:51.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": \"20\", \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:52:12.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:52:12', '2026-02-28 19:52:12', '2026-02-28 19:52:12'),
(9, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 0, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:52:12.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": \"1\", \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:49.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:56:49', '2026-02-28 19:56:49', '2026-02-28 19:56:49'),
(10, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 1, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:49.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": \"3\", \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:51.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:56:51', '2026-02-28 19:56:51', '2026-02-28 19:56:51'),
(11, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 3, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:51.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": \"40\", \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:53.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:56:53', '2026-02-28 19:56:53', '2026-02-28 19:56:53'),
(12, 1, 'CREACIÓN', 'EL USUARIO admin AGREGO UN REGISTRO DE PRODUCCIÓN', '{\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:29:26.000000Z\", \"updated_at\": \"2026-03-04T12:29:26.000000Z\", \"descripcion\": \"\", \"producto_id\": \"1\", \"fecha_inicio\": \"2026-03-04\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'PRODUCCIÓN', '2026-03-04', '08:29:26', '2026-03-04 12:29:26', '2026-03-04 12:29:26'),
(13, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN REGISTRO DE PRODUCCIÓN', '{\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:29:26.000000Z\", \"updated_at\": \"2026-03-04T12:29:26.000000Z\", \"descripcion\": \"\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_registro\": \"2026-03-04\"}', '{\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:29:26.000000Z\", \"updated_at\": \"2026-03-04T12:31:26.000000Z\", \"descripcion\": \"DESC\", \"producto_id\": \"1\", \"fecha_inicio\": \"2026-03-04\", \"fecha_registro\": \"2026-03-04\"}', 'PRODUCCIÓN', '2026-03-04', '08:31:26', '2026-03-04 12:31:26', '2026-03-04 12:31:26'),
(14, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN REGISTRO DE PRODUCCIÓN', '{\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:29:26.000000Z\", \"updated_at\": \"2026-03-04T12:31:26.000000Z\", \"descripcion\": \"DESC\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_registro\": \"2026-03-04\", \"control_calidads\": []}', NULL, 'PRODUCCIÓN', '2026-03-04', '08:33:15', '2026-03-04 12:33:15', '2026-03-04 12:33:15'),
(15, 1, 'CREACIÓN', 'EL USUARIO admin AGREGO UN REGISTRO DE PRODUCCIÓN', '{\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:33:51.000000Z\", \"updated_at\": \"2026-03-04T12:33:51.000000Z\", \"descripcion\": \"DESC\", \"producto_id\": \"1\", \"fecha_inicio\": \"2026-03-04\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'PRODUCCIÓN', '2026-03-04', '08:33:51', '2026-03-04 12:33:51', '2026-03-04 12:33:51'),
(16, 1, 'CREACIÓN', 'EL USUARIO admin AGREGO UN REGISTRO DE PRODUCCIÓN', '{\"id\": 2, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:34:01.000000Z\", \"updated_at\": \"2026-03-04T12:34:01.000000Z\", \"descripcion\": \"\", \"producto_id\": \"2\", \"fecha_inicio\": \"2026-04-07\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'PRODUCCIÓN', '2026-03-04', '08:34:01', '2026-03-04 12:34:01', '2026-03-04 12:34:01'),
(17, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 1, \"tiempo\": null, \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"updated_at\": \"2026-03-04T12:46:37.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 1}', '{\"id\": 1, \"tiempo\": \"30\", \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"produccion\": {\"id\": 1, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T12:33:51.000000Z\", \"updated_at\": \"2026-03-04T12:33:51.000000Z\", \"descripcion\": \"DESC\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_inicio_t\": \"04/03/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T13:06:40.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 1}', 'PRODUCCIÓN', '2026-03-04', '09:06:40', '2026-03-04 13:06:40', '2026-03-04 13:06:40'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 1, \"tiempo\": 30, \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"updated_at\": \"2026-03-04T13:06:40.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 1}', '{\"id\": 1, \"tiempo\": 30, \"calidad\": \"30\", \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"produccion\": {\"id\": 1, \"estado\": \"ENPROCESO\", \"created_at\": \"2026-03-04T12:33:51.000000Z\", \"updated_at\": \"2026-03-04T13:07:45.000000Z\", \"descripcion\": \"DESC\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_inicio_t\": \"04/03/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T13:07:45.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 1}', 'PRODUCCIÓN', '2026-03-04', '09:07:45', '2026-03-04 13:07:45', '2026-03-04 13:07:45'),
(19, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"ci\": \"123456\", \"id\": 2, \"dir\": \"LOS PEDREGALES\", \"fono\": \"78787878\", \"foto\": \"21772630076.jpg\", \"tipo\": \"ADMINISTRADOR\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"correo\": \"juan@gmail.com\", \"nombre\": \"JUAN\", \"materno\": \"\", \"paterno\": \"PERES\", \"usuario\": \"JPERES\", \"created_at\": \"2026-03-04T13:14:36.000000Z\", \"updated_at\": \"2026-03-04T13:14:36.000000Z\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'USUARIOS', '2026-03-04', '09:14:36', '2026-03-04 13:14:36', '2026-03-04 13:14:36'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', '{\"id\": 3, \"nombre\": \"PRODUCTO 3\", \"created_at\": \"2026-03-04T14:01:51.000000Z\", \"updated_at\": \"2026-03-04T14:01:51.000000Z\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'PRODUCTOS', '2026-03-04', '10:01:51', '2026-03-04 14:01:51', '2026-03-04 14:01:51'),
(21, 1, 'CREACIÓN', 'EL USUARIO admin AGREGO UN REGISTRO DE PRODUCCIÓN', '{\"id\": 3, \"estado\": \"INICIADO\", \"created_at\": \"2026-03-04T14:02:06.000000Z\", \"updated_at\": \"2026-03-04T14:02:06.000000Z\", \"descripcion\": \"\", \"producto_id\": \"3\", \"fecha_inicio\": \"2026-03-20\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'PRODUCCIÓN', '2026-03-04', '10:02:06', '2026-03-04 14:02:06', '2026-03-04 14:02:06'),
(22, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 2, \"tiempo\": null, \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"updated_at\": \"2026-03-04T12:46:37.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 1}', '{\"id\": 2, \"tiempo\": \"20\", \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"produccion\": {\"id\": 1, \"estado\": \"ENPROCESO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 1, \"nombre\": \"PRODUCTO 1\", \"created_at\": \"2026-02-26T18:52:39.000000Z\", \"updated_at\": \"2026-02-26T18:52:39.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:33:51.000000Z\", \"updated_at\": \"2026-03-04T14:02:23.000000Z\", \"calidad_pro\": null, \"descripcion\": \"DESC\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_inicio_t\": \"04/03/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:23.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 1}', 'PRODUCCIÓN', '2026-03-04', '10:02:23', '2026-03-04 14:02:23', '2026-03-04 14:02:23'),
(23, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 2, \"tiempo\": 20, \"calidad\": null, \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"updated_at\": \"2026-03-04T14:02:23.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 1}', '{\"id\": 2, \"tiempo\": 20, \"calidad\": \"70\", \"created_at\": \"2026-03-04T12:46:37.000000Z\", \"produccion\": {\"id\": 1, \"estado\": \"ENPROCESO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 1, \"nombre\": \"PRODUCTO 1\", \"created_at\": \"2026-02-26T18:52:39.000000Z\", \"updated_at\": \"2026-02-26T18:52:39.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:33:51.000000Z\", \"updated_at\": \"2026-03-04T14:02:23.000000Z\", \"calidad_pro\": null, \"descripcion\": \"DESC\", \"producto_id\": 1, \"fecha_inicio\": \"2026-03-04\", \"fecha_inicio_t\": \"04/03/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:24.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 1}', 'PRODUCCIÓN', '2026-03-04', '10:02:24', '2026-03-04 14:02:24', '2026-03-04 14:02:24'),
(24, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 21, \"tiempo\": null, \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"updated_at\": \"2026-03-04T13:08:59.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 2}', '{\"id\": 21, \"tiempo\": \"10\", \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"produccion\": {\"id\": 2, \"estado\": \"INICIADO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:58:30.000000Z\", \"updated_at\": \"2026-02-26T18:58:30.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:34:01.000000Z\", \"updated_at\": \"2026-03-04T14:02:47.000000Z\", \"calidad_pro\": null, \"descripcion\": \"\", \"producto_id\": 2, \"fecha_inicio\": \"2026-04-07\", \"fecha_inicio_t\": \"07/04/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:47.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 2}', 'PRODUCCIÓN', '2026-03-04', '10:02:47', '2026-03-04 14:02:47', '2026-03-04 14:02:47'),
(25, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 21, \"tiempo\": 10, \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"updated_at\": \"2026-03-04T14:02:47.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 2}', '{\"id\": 21, \"tiempo\": 10, \"calidad\": \"10\", \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"produccion\": {\"id\": 2, \"estado\": \"ENPROCESO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:58:30.000000Z\", \"updated_at\": \"2026-02-26T18:58:30.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:34:01.000000Z\", \"updated_at\": \"2026-03-04T14:02:48.000000Z\", \"calidad_pro\": null, \"descripcion\": \"\", \"producto_id\": 2, \"fecha_inicio\": \"2026-04-07\", \"fecha_inicio_t\": \"07/04/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:48.000000Z\", \"nro_proceso\": 1, \"produccion_id\": 2}', 'PRODUCCIÓN', '2026-03-04', '10:02:48', '2026-03-04 14:02:48', '2026-03-04 14:02:48'),
(26, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 22, \"tiempo\": null, \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"updated_at\": \"2026-03-04T13:08:59.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 2}', '{\"id\": 22, \"tiempo\": \"20\", \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"produccion\": {\"id\": 2, \"estado\": \"ENPROCESO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:58:30.000000Z\", \"updated_at\": \"2026-02-26T18:58:30.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:34:01.000000Z\", \"updated_at\": \"2026-03-04T14:02:48.000000Z\", \"calidad_pro\": null, \"descripcion\": \"\", \"producto_id\": 2, \"fecha_inicio\": \"2026-04-07\", \"fecha_inicio_t\": \"07/04/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:49.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 2}', 'PRODUCCIÓN', '2026-03-04', '10:02:49', '2026-03-04 14:02:49', '2026-03-04 14:02:49'),
(27, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UN CONTROL DE CALIDAD', '{\"id\": 22, \"tiempo\": 20, \"calidad\": null, \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"updated_at\": \"2026-03-04T14:02:49.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 2}', '{\"id\": 22, \"tiempo\": 20, \"calidad\": \"25\", \"created_at\": \"2026-03-04T13:08:59.000000Z\", \"produccion\": {\"id\": 2, \"estado\": \"ENPROCESO\", \"calidad\": \"MALA\", \"producto\": {\"id\": 2, \"nombre\": \"PRODUCTO 2\", \"created_at\": \"2026-02-26T18:58:30.000000Z\", \"updated_at\": \"2026-02-26T18:58:30.000000Z\", \"fecha_registro\": \"2026-02-26\", \"fecha_registro_t\": \"26/02/2026\"}, \"created_at\": \"2026-03-04T12:34:01.000000Z\", \"updated_at\": \"2026-03-04T14:02:48.000000Z\", \"calidad_pro\": null, \"descripcion\": \"\", \"producto_id\": 2, \"fecha_inicio\": \"2026-04-07\", \"fecha_inicio_t\": \"07/04/2026\", \"fecha_registro\": \"2026-03-04\", \"fecha_registro_t\": \"04/03/2026\"}, \"updated_at\": \"2026-03-04T14:02:50.000000Z\", \"nro_proceso\": 2, \"produccion_id\": 2}', 'PRODUCCIÓN', '2026-03-04', '10:02:50', '2026-03-04 14:02:50', '2026-03-04 14:02:50'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"ci\": \"1234567\", \"id\": 3, \"dir\": \"LOS PEDREGALES\", \"fono\": \"66464564\", \"tipo\": \"GERENTE\", \"acceso\": \"1\", \"ci_exp\": \"CB\", \"correo\": null, \"nombre\": \"MARIA\", \"materno\": \"\", \"paterno\": \"GONZALES\", \"usuario\": \"MGONZALES\", \"created_at\": \"2026-03-04T14:37:34.000000Z\", \"updated_at\": \"2026-03-04T14:37:34.000000Z\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'USUARIOS', '2026-03-04', '10:37:34', '2026-03-04 14:37:34', '2026-03-04 14:37:34'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"ci\": \"12345678\", \"id\": 4, \"dir\": \"LOS OLIVOS\", \"fono\": \"676767676\", \"tipo\": \"SUPERVISOR\", \"acceso\": \"1\", \"ci_exp\": \"CB\", \"correo\": null, \"nombre\": \"FRANZ\", \"materno\": \"\", \"paterno\": \"RAMIRES\", \"usuario\": \"FRAMIRES\", \"created_at\": \"2026-03-04T14:37:54.000000Z\", \"updated_at\": \"2026-03-04T14:37:54.000000Z\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'USUARIOS', '2026-03-04', '10:37:54', '2026-03-04 14:37:54', '2026-03-04 14:37:54'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', '{\"ci\": \"12345677\", \"id\": 5, \"dir\": \"LOS PEDREGALES\", \"fono\": \"67676767676\", \"tipo\": \"TÉCNICO\", \"acceso\": \"1\", \"ci_exp\": \"LP\", \"correo\": null, \"nombre\": \"ALEX\", \"materno\": \"\", \"paterno\": \"MARTINEZ\", \"usuario\": \"AMARTINEZ\", \"created_at\": \"2026-03-04T14:39:55.000000Z\", \"updated_at\": \"2026-03-04T14:39:55.000000Z\", \"fecha_registro\": \"2026-03-04\"}', NULL, 'USUARIOS', '2026-03-04', '10:39:55', '2026-03-04 14:39:55', '2026-03-04 14:39:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_01_31_165641_create_configuracions_table', 1),
(2, '2024_11_02_153317_create_users_table', 1),
(3, '2024_11_02_153318_create_historial_accions_table', 1),
(4, '2026_02_25_105634_create_productos_table', 1),
(5, '2026_02_25_105713_create_parametrizacions_table', 1),
(6, '2026_02_25_110023_create_produccions_table', 1),
(7, '2026_02_25_110153_create_control_calidads_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametrizacions`
--

CREATE TABLE `parametrizacions` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `nro_proceso` int NOT NULL DEFAULT '0',
  `cm_horas` int NOT NULL DEFAULT '0',
  `cm_calidad` int NOT NULL DEFAULT '0',
  `cb_horas` int NOT NULL DEFAULT '0',
  `cb_calidad` int NOT NULL DEFAULT '0',
  `ca_horas` int NOT NULL DEFAULT '0',
  `ca_calidad` int NOT NULL DEFAULT '0',
  `co_horas` int NOT NULL DEFAULT '0',
  `co_calidad` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `parametrizacions`
--

INSERT INTO `parametrizacions` (`id`, `producto_id`, `nro_proceso`, `cm_horas`, `cm_calidad`, `cb_horas`, `cb_calidad`, `ca_horas`, `ca_calidad`, `co_horas`, `co_calidad`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(4, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(5, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(6, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(7, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(8, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(9, 2, 9, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(10, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(11, 2, 11, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(12, 2, 12, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(13, 2, 13, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(14, 2, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(15, 2, 15, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(16, 2, 16, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(17, 2, 17, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(18, 2, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(19, 2, 19, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(20, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:30', '2026-02-28 19:31:30'),
(21, 1, 1, 20, 40, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:56:53'),
(22, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(23, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(24, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(25, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(26, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(27, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(28, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(29, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(30, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(31, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(32, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(33, 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(34, 1, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(35, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(36, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(37, 1, 17, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(38, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(39, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(40, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49'),
(41, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(42, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(43, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(44, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(45, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(46, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(47, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(48, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(49, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(50, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(51, 3, 11, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(52, 3, 12, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(53, 3, 13, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(54, 3, 14, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(55, 3, 15, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(56, 3, 16, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(57, 3, 17, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(58, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(59, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56'),
(60, 3, 20, 0, 0, 0, 0, 0, 0, 0, 0, '2026-03-04 14:01:56', '2026-03-04 14:01:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccions`
--

CREATE TABLE `produccions` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INICIADO',
  `calidad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calidad_pro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `produccions`
--

INSERT INTO `produccions` (`id`, `producto_id`, `fecha_inicio`, `descripcion`, `estado`, `calidad`, `calidad_pro`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, '2026-03-04', 'DESC', 'EN PROCESO', 'MALA', NULL, '2026-03-04', '2026-03-04 12:33:51', '2026-03-04 14:02:23'),
(2, 2, '2026-04-07', '', 'EN PROCESO', 'MALA', NULL, '2026-03-04', '2026-03-04 12:34:01', '2026-03-04 14:02:48'),
(3, 3, '2026-03-20', '', 'INICIADO', NULL, NULL, '2026-03-04', '2026-03-04 14:02:06', '2026-03-04 14:02:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCTO 1', '2026-02-26', '2026-02-26 18:52:39', '2026-02-26 18:52:39'),
(2, 'PRODUCTO 2', '2026-02-26', '2026-02-26 18:58:30', '2026-02-26 18:58:30'),
(3, 'PRODUCTO 3', '2026-03-04', '2026-03-04 14:01:51', '2026-03-04 14:01:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceso` int NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `correo`, `fono`, `password`, `acceso`, `tipo`, `foto`, `fecha_registro`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', '', '0', '', '', '', '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 'ADMINISTRADOR', NULL, '2025-10-01', 1, '2026-02-17 22:21:27', '2026-02-17 22:21:27'),
(2, 'JPERES', 'JUAN', 'PERES', '', '123456', 'LP', 'LOS PEDREGALES', 'juan@gmail.com', '78787878', '$2y$12$O3N99suoM7QAEoghwE25S.nJ8kPsFM6W5sWCCx9d47pq0w2lNXPYS', 1, 'ADMINISTRADOR', '21772630076.jpg', '2026-03-04', 1, '2026-03-04 13:14:36', '2026-03-04 13:14:36'),
(3, 'MGONZALES', 'MARIA', 'GONZALES', '', '1234567', 'CB', 'LOS PEDREGALES', NULL, '66464564', '$2y$12$XWbbFK5kIhgwy0MHvWp/2OGD8/EiCs46wsiTpMe7.Uzp3VRdDriFy', 1, 'GERENTE', NULL, '2026-03-04', 1, '2026-03-04 14:37:34', '2026-03-04 14:37:34'),
(4, 'FRAMIRES', 'FRANZ', 'RAMIRES', '', '12345678', 'CB', 'LOS OLIVOS', NULL, '676767676', '$2y$12$nKj/GxFqDkkWCs0Cfs9Y6uTBadutKFpUI7/VKK1Ay5OLUU.nK4lN2', 1, 'SUPERVISOR', NULL, '2026-03-04', 1, '2026-03-04 14:37:54', '2026-03-04 14:37:54'),
(5, 'AMARTINEZ', 'ALEX', 'MARTINEZ', '', '12345677', 'LP', 'LOS PEDREGALES', NULL, '67676767676', '$2y$12$FtjrXyO7Z5baC4N2CceJa.dvI77wIQbfI1ckNtZcZzD40ZWsS5LTe', 1, 'TÉCNICO', NULL, '2026-03-04', 1, '2026-03-04 14:39:55', '2026-03-04 14:39:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_calidads`
--
ALTER TABLE `control_calidads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_calidads_produccion_id_foreign` (`produccion_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_accions_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parametrizacions_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `produccions`
--
ALTER TABLE `produccions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produccions_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `control_calidads`
--
ALTER TABLE `control_calidads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `produccions`
--
ALTER TABLE `produccions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `control_calidads`
--
ALTER TABLE `control_calidads`
  ADD CONSTRAINT `control_calidads_produccion_id_foreign` FOREIGN KEY (`produccion_id`) REFERENCES `produccions` (`id`);

--
-- Filtros para la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD CONSTRAINT `historial_accions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  ADD CONSTRAINT `parametrizacions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `produccions`
--
ALTER TABLE `produccions`
  ADD CONSTRAINT `produccions_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
