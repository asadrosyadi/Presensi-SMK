-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 04:43 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(59, 'default', 'Create new area', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"bfmgDBckvOTvfxQ7JFeZk6H1HRHUBPqYOqdGcw6j\",\"id\":\"3\",\"name\":\"home\",\"address\":\"home\"}', '2022-06-11 08:41:30', '2022-06-11 08:41:30'),
(60, 'default', 'Update Profile', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"7nNcC3nHEkxyz6xmPVtUa3UEsZxRXBVT5iLcFlfJ\",\"id\":\"1\",\"name\":\"administrator\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"submit\":null,\"image\":\"1_image.png\"}', '2022-06-11 22:36:49', '2022-06-11 22:36:49'),
(61, 'default', 'Create new user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"n7lJmSNlVlBxWN5msFWIJ5W3nRVvYwMh4OyF8kkt\",\"id\":null,\"name\":\"1121\",\"email\":\"rosyadi.asad@gmail.com\",\"password\":\"$2y$10$sr6GxwuwNDFPIpcFWn.RweTiztnOMpSoCv9b8xDgi4BkhtSmhO3S6\",\"image_delete\":null,\"role\":\"2\",\"submit\":null}', '2022-06-12 03:54:43', '2022-06-12 03:54:43'),
(62, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"n7lJmSNlVlBxWN5msFWIJ5W3nRVvYwMh4OyF8kkt\",\"id\":\"22\",\"name\":\"1121\",\"class\":\"12\",\"email\":\"rosyadi.asad@gmail.com\",\"password\":\"$2y$10$sr6GxwuwNDFPIpcFWn.RweTiztnOMpSoCv9b8xDgi4BkhtSmhO3S6\",\"image_delete\":null,\"role\":\"2\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 03:55:47', '2022-06-12 03:55:47'),
(63, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"n7lJmSNlVlBxWN5msFWIJ5W3nRVvYwMh4OyF8kkt\",\"id\":\"22\",\"name\":\"1121\",\"class\":\"dd\",\"NIS\":\"12\",\"email\":\"rosyadi.asad@gmail.com\",\"password\":\"$2y$10$sr6GxwuwNDFPIpcFWn.RweTiztnOMpSoCv9b8xDgi4BkhtSmhO3S6\",\"image_delete\":null,\"role\":\"2\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 04:00:34', '2022-06-12 04:00:34'),
(64, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"1\",\"name\":\"administrator\",\"class\":\"admin\",\"NIS\":\"1\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"role\":\"1\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 04:05:31', '2022-06-12 04:05:31'),
(65, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"1\",\"name\":\"administrator\",\"class\":\"admin\",\"NIS\":\"0\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"role\":\"1\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 04:05:35', '2022-06-12 04:05:35'),
(66, 'default', 'Create new area', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"4\",\"name\":\"SMKN 1 Batu\",\"address\":\"Jl. Bromo No.11, Sisir, Kec. Batu, Kota Batu, Jawa Timur 65314\"}', '2022-06-12 04:24:00', '2022-06-12 04:24:00'),
(67, 'default', 'Update Profile', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"1\",\"name\":\"administrator\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 04:57:13', '2022-06-12 04:57:13'),
(68, 'default', 'Update Profile', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"1\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-12 04:58:53', '2022-06-12 04:58:53'),
(69, 'default', 'Update Profile', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"NFcc4EDoRg3nDRHRXExCYXw9gQoMwrmXxWagscPB\",\"id\":\"1\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"submit\":null,\"image\":\"1_image.png\"}', '2022-06-12 04:58:59', '2022-06-12 04:58:59'),
(70, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"ljxV0PUD6ILKA7JMpiB2JOz9OrKwx4naCVS1rIYZ\",\"id\":\"7\",\"name\":\"siswa\",\"class\":\"Boga\",\"NIS\":\"1\",\"email\":\"siswa@gmail.com\",\"password\":\"$2y$10$LcO4jHzLondKqIEFpnR.BuV7H1CHYdUuQitFhLTfyezgVOT\\/d5KIi\",\"image_delete\":null,\"role\":\"3\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-18 16:00:58', '2022-06-18 16:00:58'),
(71, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"Yry3fTVf5ffrFzg17IjpkjRYYmGYJb696ok6dYoK\",\"id\":\"8\",\"name\":\"Admin\",\"class\":\"0\",\"NIS\":\"0\",\"email\":\"guru@gmail.com\",\"password\":\"$2y$10$WSVMb7KgkEMt0KlaOIYmF.4X96En6LN46S7hr\\/w\\/PYvlTK3k9Bv4e\",\"image_delete\":null,\"role\":\"2\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-19 07:28:51', '2022-06-19 07:28:51'),
(72, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"avRJZryZIRXwFUoCB8rOwTX5UH4oMKN2JEu5ZBb2\",\"id\":\"22\",\"name\":\"Mohammad As\'ad Rosyadi\",\"class\":\"dd\",\"NIS\":\"12\",\"email\":\"rosyadi.asad@gmail.com\",\"password\":\"$2y$10$9ALG9MbqARJmXWX1PCWoCuljCJwmwSUFOGEaQwfkwryy3M2z50cUi\",\"image_delete\":null,\"role\":\"3\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-19 07:42:59', '2022-06-19 07:42:59'),
(73, 'default', 'Update area', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"3\",\"name\":\"home\",\"address\":\"home\"}', '2022-06-21 07:33:18', '2022-06-21 07:33:18'),
(74, 'default', 'Update area', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"3\",\"name\":\"Sakit\",\"address\":\"Sakit\"}', '2022-06-21 07:34:12', '2022-06-21 07:34:12'),
(75, 'default', 'Create new area', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"5\",\"name\":\"Izin\",\"address\":\"Izin\"}', '2022-06-21 07:37:01', '2022-06-21 07:37:01'),
(76, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"8\",\"name\":\"Guru\",\"class\":\"0\",\"NIS\":\"0\",\"email\":\"guru@gmail.com\",\"password\":\"$2y$10$WSVMb7KgkEMt0KlaOIYmF.4X96En6LN46S7hr\\/w\\/PYvlTK3k9Bv4e\",\"image_delete\":null,\"role\":\"2\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:40:58', '2022-06-21 07:40:58'),
(77, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"1\",\"name\":\"administrator\",\"class\":\"admin\",\"NIS\":\"0\",\"email\":\"administrator@gmail.com\",\"password\":\"$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe\\/2AA.kNl4kY2\",\"image_delete\":null,\"role\":\"1\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:41:21', '2022-06-21 07:41:21'),
(78, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"8\",\"name\":\"Guru\",\"class\":\"guru\",\"NIS\":\"0\",\"email\":\"guru@gmail.com\",\"password\":\"$2y$10$WSVMb7KgkEMt0KlaOIYmF.4X96En6LN46S7hr\\/w\\/PYvlTK3k9Bv4e\",\"image_delete\":null,\"role\":\"2\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:41:30', '2022-06-21 07:41:30'),
(79, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"7\",\"name\":\"siswa\",\"class\":\"X - Boga\",\"NIS\":\"1\",\"email\":\"siswa@gmail.com\",\"password\":\"$2y$10$LcO4jHzLondKqIEFpnR.BuV7H1CHYdUuQitFhLTfyezgVOT\\/d5KIi\",\"image_delete\":null,\"role\":\"3\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:41:58', '2022-06-21 07:41:58'),
(80, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"7\",\"name\":\"siswa\",\"class\":\"X Boga\",\"NIS\":\"123\",\"email\":\"siswa@gmail.com\",\"password\":\"$2y$10$LcO4jHzLondKqIEFpnR.BuV7H1CHYdUuQitFhLTfyezgVOT\\/d5KIi\",\"image_delete\":null,\"role\":\"3\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:42:22', '2022-06-21 07:42:22'),
(81, 'default', 'Update user', NULL, NULL, 'App\\Models\\User', 1, '{\"_token\":\"535mfNh5tmUmxkpQRi8DWFZJUYWK4Z5K9zmIls1r\",\"id\":\"22\",\"name\":\"Mohammad As\'ad Rosyadi\",\"class\":\"XI Boga\",\"NIS\":\"35151\",\"email\":\"rosyadi.asad@gmail.com\",\"password\":\"$2y$10$9ALG9MbqARJmXWX1PCWoCuljCJwmwSUFOGEaQwfkwryy3M2z50cUi\",\"image_delete\":null,\"role\":\"3\",\"submit\":null,\"image\":\"default-user.png\"}', '2022-06-21 07:42:54', '2022-06-21 07:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES
(3, 'Sakit', 'Sakit', '2022-06-11 08:41:30', '2022-06-21 07:34:12'),
(4, 'SMKN 1 Batu', 'Jl. Bromo No.11, Sisir, Kec. Batu, Kota Batu, Jawa Timur 65314', '2022-06-12 04:24:00', '2022-06-12 04:24:00'),
(5, 'Izin', 'Izin', '2022-06-21 07:37:01', '2022-06-21 07:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `worker_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `work_hour` time DEFAULT NULL,
  `over_time` time DEFAULT NULL,
  `late_time` time DEFAULT NULL,
  `early_out_time` time DEFAULT NULL,
  `in_location_id` int(10) UNSIGNED DEFAULT NULL,
  `out_location_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) NOT NULL,
  `lat` float(9,6) NOT NULL,
  `longt` float(9,6) NOT NULL,
  `area_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `lat`, `longt`, `area_id`) VALUES
(15, -8.383628, 123.408630, 1),
(16, -8.383453, 123.409126, 1),
(17, -8.383414, 123.409294, 1),
(18, -8.384156, 123.409767, 1),
(19, -8.384507, 123.409416, 1),
(46, -7.867672, 112.527023, 4),
(47, -7.868076, 112.527000, 4),
(48, -7.868119, 112.527367, 4),
(49, -7.868012, 112.527390, 4),
(50, -7.868066, 112.527550, 4),
(51, -7.867864, 112.527603, 4),
(52, -7.867726, 112.527618, 4),
(89, 9.905769, 93.265518, 3),
(90, 9.385882, 153.910049, 3),
(91, -13.387795, 154.261612, 3),
(92, -12.617067, 93.529190, 3),
(93, 11.275544, 92.905380, 5),
(94, -13.229095, 92.817490, 5),
(95, -12.972286, 153.725693, 5),
(96, 10.930563, 153.549911, 5);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('026d1044316b8a1e9a15aeb1f2930a5213ad18e19a8bf2b687347da5ae6672f5362e9641e864d420', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:25:30', '2022-06-11 20:25:30', '2023-06-12 03:25:30'),
('051119479df3b36ee7f486a8474334f7992a8e0acf1327a8f0f8bdb244619e9614b9e0f05f5ae806', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:21:41', '2022-06-11 20:21:41', '2023-06-12 03:21:41'),
('07e9edb480927633ca00fe782bfa9ed60aee430de04e763790d861e4f9b1be81fd8596dad4c54b64', 22, 1, 'nApp', '[]', 0, '2022-06-21 05:37:17', '2022-06-21 05:37:17', '2023-06-21 12:37:17'),
('193e4be531bb16bb4032d86e07d00046f9273f48a94924d38b9abed13e0b1fa7b919a0f39e72374b', 7, 1, 'nApp', '[]', 0, '2022-06-11 17:28:30', '2022-06-11 17:28:30', '2023-06-12 00:28:30'),
('250f10f77d0bc048c90a7e4b0f27fa964bdbe18abd879e70f5eb7be4f07ee413e1fc26443e7c50ea', 7, 1, 'nApp', '[]', 0, '2022-06-12 03:19:55', '2022-06-12 03:19:55', '2023-06-12 10:19:55'),
('320be15af1c2baf5e375ec8aaa45c220f49d36e7853e263ff479c46fb70b339f2a3613a2793ba142', 7, 1, 'nApp', '[]', 0, '2022-06-11 19:16:17', '2022-06-11 19:16:17', '2023-06-12 02:16:17'),
('4e3028c3175f450c68a0a5a0a8971232f8c088a03e14b58ee9873c218dc0d299d5281d630322569e', 7, 1, 'nApp', '[]', 0, '2022-06-11 19:16:02', '2022-06-11 19:16:02', '2023-06-12 02:16:02'),
('55bab511940c07d5ecb624d0a831eca6554dd5705b3299bb78244a4467fc8c246db73dcd5481b772', 7, 1, 'nApp', '[]', 0, '2022-06-11 14:51:38', '2022-06-11 14:51:38', '2023-06-11 21:51:38'),
('5dd376f3d5621617d0266cd559ca1effda090df6be79ef8284ad2b26f93862f15490bbbf108e4f3e', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:08:03', '2022-06-11 20:08:03', '2023-06-12 03:08:03'),
('602b3fb2150cbebebade5f1dd44a3b7744e93612778f98d1909d6f623e91a0bce04df5c95955ccd3', 7, 1, 'nApp', '[]', 0, '2022-06-11 15:07:12', '2022-06-11 15:07:12', '2023-06-11 22:07:12'),
('66bf475b90aa8390d633e25a4d497f2251e0ce10b54eae72632caa39779e4ddac3cdaab47c705515', 7, 1, 'nApp', '[]', 0, '2022-06-11 18:33:26', '2022-06-11 18:33:26', '2023-06-12 01:33:26'),
('699d82276603e3848e0e3d59b7d3a6d9a0334ac7d46364ea0459d596ddf4ad7024ab1108a57922ae', 7, 1, 'nApp', '[]', 0, '2022-06-11 18:30:54', '2022-06-11 18:30:54', '2023-06-12 01:30:54'),
('69c0ac268f9f6a4efe5a8e07be15668220ac9bfef4a8a93e9eb929fdc48c09f07be2dd846511db01', 7, 1, 'nApp', '[]', 0, '2022-06-12 05:12:57', '2022-06-12 05:12:57', '2023-06-12 12:12:57'),
('732e33fadef37b0ea0cc502fc31743d215adccccd2b4b3b180e3eac6938a180f2c71bebe656f0317', 7, 1, 'nApp', '[]', 0, '2022-06-11 16:07:52', '2022-06-11 16:07:52', '2023-06-11 23:07:52'),
('733013355b15eddaf3d53bbeec8723d95973a605f6f07568655f112919d5ad4d6657b72003c1384b', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:28:44', '2022-06-11 20:28:44', '2023-06-12 03:28:44'),
('80d0a66a081af1f66b5398602460ca61b9f947c2b023e5a40574bde95b559e39d2ea91cc44048b43', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:29:07', '2022-06-11 20:29:07', '2023-06-12 03:29:07'),
('863324858c4db825ca32f23daef06ca52eb5f268555a774b07fdf4557d38fb75223ef2fb4bdb2235', 7, 1, 'nApp', '[]', 0, '2022-06-11 19:22:48', '2022-06-11 19:22:48', '2023-06-12 02:22:48'),
('8d1e326feb3ac81252f4bcff138d48de1daac35381bbdd109fcad19e83b9e21cb9c54d675bd48125', 7, 1, 'nApp', '[]', 0, '2022-06-11 15:23:56', '2022-06-11 15:23:56', '2023-06-11 22:23:56'),
('8f417169bdb5a97a3c89e4808e166b7c0f9c7ecf7cb49d817f8df73e77fef13f7e6c8726de976da6', 7, 1, 'nApp', '[]', 0, '2022-06-11 18:42:20', '2022-06-11 18:42:20', '2023-06-12 01:42:20'),
('904080e94c8ae198a37802ae11ef92f5615aa80df0d352de7b00a03ab11e5bf813a4908964944887', 22, 1, 'nApp', '[]', 0, '2022-06-19 07:43:44', '2022-06-19 07:43:44', '2023-06-19 14:43:44'),
('99f46ec6830ec0377d496b348a924838a00fbbd93a243b4b0ee0f9a6ec31f192c7c77e669a2082db', 7, 1, 'nApp', '[]', 0, '2022-06-11 18:48:27', '2022-06-11 18:48:27', '2023-06-12 01:48:27'),
('9a59d4b1b1bc031e14e58a485872f472068f53c847b63e3c5417f6ef3449692333e6b52798c4946a', 7, 1, 'nApp', '[]', 0, '2022-06-18 16:40:48', '2022-06-18 16:40:48', '2023-06-18 23:40:48'),
('a89b56b6862483568289f408af1dce55846867cc5cfe86af4a13a82884274c234b56492c90be3609', 7, 1, 'nApp', '[]', 0, '2022-06-11 15:06:38', '2022-06-11 15:06:38', '2023-06-11 22:06:38'),
('b0db2a4813a2b7df3556d07895fdc2a84810f0dcba64a4d79a3c0d8183fbf0a37765c988c4c1b11a', 7, 1, 'nApp', '[]', 0, '2022-06-11 19:38:09', '2022-06-11 19:38:09', '2023-06-12 02:38:09'),
('b393aa9273904dba63805bd115b79c57e7528ff59997707ebc14e90a520bc64fc99cc50479127e1d', 7, 1, 'nApp', '[]', 0, '2022-06-11 17:29:18', '2022-06-11 17:29:18', '2023-06-12 00:29:18'),
('b9fb4f4ed7efd3cae7f18ba70ccc00d8fde355f69c9c0d360e17ae68d095b6c58eb2a927a1202689', 7, 1, 'nApp', '[]', 0, '2022-06-11 18:57:57', '2022-06-11 18:57:57', '2023-06-12 01:57:57'),
('db9ca44bb0aed0038df4e57e34d3cca2ea0dcfd43ee4e31ec8aee92125a5bd281c4a2ec0017662f7', 22, 1, 'nApp', '[]', 0, '2022-06-21 05:36:28', '2022-06-21 05:36:28', '2023-06-21 12:36:28'),
('dcf15c3bf3f39c5b5fd9e35eb6be4dde2d27a0c7f2d93abc131f0b9e1c50a02815dd7d0ad267be3b', 7, 1, 'nApp', '[]', 0, '2022-06-11 16:11:55', '2022-06-11 16:11:55', '2023-06-11 23:11:55'),
('e36b09f6349fd14983be1a0d10e61277fc046cc9d45dc1c786fe94a9783ceabc312d90c68134efb6', 7, 1, 'nApp', '[]', 0, '2022-06-11 19:26:56', '2022-06-11 19:26:56', '2023-06-12 02:26:56'),
('ec9823ff8792a3f220708c1f2b99d13cbf34ac5f018751ad3c59d9008b3e27ec9fbd8c5a0f880a26', 7, 1, 'nApp', '[]', 0, '2022-06-11 16:05:59', '2022-06-11 16:05:59', '2023-06-11 23:05:59'),
('ee90140c4fc0eec969fe19c275725f331705a53a3328cbd9e68966628fb3699691ebaf8f643d3209', 7, 1, 'nApp', '[]', 0, '2022-06-11 20:22:33', '2022-06-11 20:22:33', '2023-06-12 03:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Attendance Fingerprint Personal Access Client', 'CKwXiB5WgAkfIYQFhwktZoygtyEIubnaCaKKPBqB', 'http://localhost', 1, 0, 0, '2021-04-14 04:54:18', '2021-04-14 04:54:18'),
(2, NULL, 'Attendance Fingerprint Password Grant Client', 'xNEP33rB1XEWW1cwkE6bKBdQ7kvgfkplywAVr900', 'http://localhost', 0, 1, 0, '2021-04-14 04:54:18', '2021-04-14 04:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-04-14 04:54:18', '2021-04-14 04:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'Administrator', 'Administrator role', '2020-03-25 03:56:42', '2020-03-25 03:56:45'),
(2, 'admin', 'Guru', 'Admin role', '2020-03-25 03:56:53', '2020-03-25 03:56:53'),
(3, 'staff', 'Siswa/i', 'Staff role', '2020-03-25 03:57:16', '2020-03-25 03:57:16'),
(4, 'guest', 'Guest', 'Guest role', '2020-03-25 03:57:52', '2020-03-25 03:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `user_type`) VALUES
(1, 1, 'App\\Models\\User'),
(3, 7, 'App\\Models\\User'),
(2, 8, 'App\\Models\\User'),
(3, 22, 'App\\Models\\User'),
(3, 23, 'App\\Models\\User');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `out_time` time NOT NULL,
  `key_app` text NOT NULL,
  `timezone` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `start_time`, `out_time`, `key_app`, `timezone`, `created_at`, `updated_at`) VALUES
(1, '07:00:00', '09:00:00', '3k3u2oW2zX13xyPJiyBQwSE2QyFRvF0Cf2FbovqG', 'Asia/Jakarta', '2021-04-08 13:48:26', '2022-06-11 08:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NIS` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `NIS`, `class`, `email`, `email_verified_at`, `password`, `remember_token`, `image`, `role`, `created_at`, `updated_at`) VALUES
(1, 'administrator', '0', 'admin', 'administrator@gmail.com', NULL, '$2y$10$HuSU5aUWtaipXLvSPtYM8ewE1YhmV9B9EOmer4ECe/2AA.kNl4kY2', 'mJV8VnsBubb6qFtQPyxRCMyLpvCNtN28enCkABYQxCMRdIgHt5ZsRc9NMs3p', 'default-user.png', 1, '2020-03-24 17:37:36', '2022-06-21 07:41:21'),
(7, 'siswa', '123', 'X Boga', 'siswa@gmail.com', NULL, '$2y$10$LcO4jHzLondKqIEFpnR.BuV7H1CHYdUuQitFhLTfyezgVOT/d5KIi', NULL, 'default-user.png', 3, '2021-04-08 06:54:53', '2022-06-21 07:42:22'),
(8, 'Guru', '0', 'guru', 'guru@gmail.com', NULL, '$2y$10$WSVMb7KgkEMt0KlaOIYmF.4X96En6LN46S7hr/w/PYvlTK3k9Bv4e', NULL, 'default-user.png', 2, '2021-04-08 07:09:09', '2022-06-21 07:41:30'),
(22, 'Mohammad As\'ad Rosyadi', '35151', 'XI Boga', 'rosyadi.asad@gmail.com', NULL, '$2y$10$9ALG9MbqARJmXWX1PCWoCuljCJwmwSUFOGEaQwfkwryy3M2z50cUi', NULL, 'default-user.png', 3, '2022-06-12 03:54:43', '2022-06-21 07:42:54'),
(23, 'Test Testing', '535345', 'XII Boga', 'test@gmail.com', NULL, '$2y$10$YeWKW/RadHbRm3FbtxhvuOSiy0EtnARZBx7KfZggdMtp2QRSfNFDi', NULL, 'default-user.png', 3, '2022-06-12 04:05:03', '2022-06-12 04:05:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_worker_id_users_id` (`worker_id`),
  ADD KEY `fk_in_location_id_attendances_area_id` (`in_location_id`),
  ADD KEY `fk_out_location_id_attendances_area_id` (`out_location_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `permission_user_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `fk_in_location_id_attendances_area_id` FOREIGN KEY (`in_location_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_out_location_id_attendances_area_id` FOREIGN KEY (`out_location_id`) REFERENCES `areas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_worker_id_users_id` FOREIGN KEY (`worker_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
