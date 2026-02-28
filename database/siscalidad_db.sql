-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-02-2026 a las 19:57:22
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
(11, 1, 'MODIFICACIÓN', 'EL USUARIO admin ACTUALIZÓ UNA PARAMETRIZACIÓN', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": 3, \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:51.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', '{\"id\": 21, \"ca_horas\": 0, \"cb_horas\": 0, \"cm_horas\": 20, \"co_horas\": 0, \"ca_calidad\": 0, \"cb_calidad\": 0, \"cm_calidad\": \"40\", \"co_calidad\": 0, \"created_at\": \"2026-02-28T19:31:49.000000Z\", \"updated_at\": \"2026-02-28T19:56:53.000000Z\", \"nro_proceso\": 1, \"producto_id\": 1}', 'PARAMETRIZACIÓN', '2026-02-28', '15:56:53', '2026-02-28 19:56:53', '2026-02-28 19:56:53');

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
(40, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, '2026-02-28 19:31:49', '2026-02-28 19:31:49');

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
  `fecha_registro` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 'PRODUCTO 2', '2026-02-26', '2026-02-26 18:58:30', '2026-02-26 18:58:30');

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
(1, 'admin', 'admin', 'admin', '', '0', '', '', '', '', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 1, 'ADMINISTRADOR', NULL, '2025-10-01', 1, '2026-02-17 22:21:27', '2026-02-17 22:21:27');

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `parametrizacions`
--
ALTER TABLE `parametrizacions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `produccions`
--
ALTER TABLE `produccions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
