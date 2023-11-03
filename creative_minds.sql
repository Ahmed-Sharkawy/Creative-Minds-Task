-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2023 at 05:39 PM
-- Server version: 5.7.40
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creative_minds`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_08_08_100000_create_telescope_entries_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE IF NOT EXISTS `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries`
--

INSERT INTO `telescope_entries` (`sequence`, `uuid`, `batch_id`, `family_hash`, `should_display_on_index`, `type`, `content`, `created_at`) VALUES
(1, '9a86ad15-9a6a-41fd-9cdb-19d52173e922', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"a75f3f172bfb296f2e10cbfc6dfc1883\",\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:21'),
(2, '9a86ad15-b179-4d57-be50-e7dd5bcf9689', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select count(*) as aggregate from `users` where `phone` = \'01068173169\'\",\"time\":\"20.76\",\"slow\":false,\"file\":\"C:\\\\Users\\\\Ahmed Sharkawy\\\\Desktop\\\\Creative Minds\\\\public\\\\index.php\",\"line\":52,\"hash\":\"bbfb5d10749714bcc483e45afb90bc47\",\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:21'),
(3, '9a86ad16-6b8a-47e5-bcb6-70249ea5ccfe', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `users` (`password`, `code`, `username`, `phone`, `updated_at`, `created_at`) values (\'y$O5KZ.r53jn29sQBeMkis3uxglxHTqFc1feEuf1ZDJos\\/TcYmosj6C\', 460583, \'asdasd\', \'01068173169\', \'2023-11-03 17:23:22\', \'2023-11-03 17:23:22\')\",\"time\":\"2.01\",\"slow\":false,\"file\":\"C:\\\\Users\\\\Ahmed Sharkawy\\\\Desktop\\\\Creative Minds\\\\app\\\\Http\\\\Controllers\\\\Api\\\\AuthController.php\",\"line\":24,\"hash\":\"a2ea49d6523dd20e303bb3c15324ce7d\",\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:22'),
(4, '9a86ad16-6c29-444c-bdda-4865761d6a93', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'model', '{\"action\":\"created\",\"model\":\"App\\\\Models\\\\User:22\",\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:22'),
(5, '9a86ad1a-4b75-4ede-a95c-c73508bdd169', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'client_request', '{\"method\":\"POST\",\"uri\":\"https:\\/\\/api.twilio.com\\/2010-04-01\\/Accounts\\/ACcc94b7f22d60f3ff894db87b9ed35006\\/Messages.json\",\"headers\":{\"content-length\":\"50\",\"user-agent\":\"GuzzleHttp\\/7\",\"authorization\":\"********\",\"host\":\"api.twilio.com\",\"content-type\":\"application\\/x-www-form-urlencoded\"},\"payload\":{\"From\":\"+13346506264\",\"To\":\"+201068173169\",\"Body\":\"460583\"},\"response_status\":201,\"response_headers\":{\"date\":\"Fri, 03 Nov 2023 17:23:23 GMT\",\"content-type\":\"application\\/json\",\"content-length\":\"809\",\"connection\":\"keep-alive\",\"twilio-request-id\":\"RQ8af02b4fd2811b2cf63689cd751d42c7\",\"twilio-request-duration\":\"0.143\",\"access-control-allow-origin\":\"*\",\"access-control-allow-headers\":\"Accept, Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, Idempotency-Key\",\"access-control-allow-methods\":\"GET, POST, DELETE, OPTIONS\",\"access-control-expose-headers\":\"ETag\",\"access-control-allow-credentials\":\"true\",\"x-powered-by\":\"AT-5000\",\"strict-transport-security\":\"max-age=31536000\",\"twilio-concurrent-requests\":\"1\",\"x-shenanigans\":\"none\",\"x-home-region\":\"us1\",\"x-api-domain\":\"api.twilio.com\"},\"response\":{\"body\":\"Sent from your Twilio trial account - 460583\",\"num_segments\":\"1\",\"direction\":\"outbound-api\",\"from\":\"+13346506264\",\"date_updated\":\"Fri, 03 Nov 2023 17:23:23 +0000\",\"price\":null,\"error_message\":null,\"uri\":\"\\/2010-04-01\\/Accounts\\/ACcc94b7f22d60f3ff894db87b9ed35006\\/Messages\\/SM8af02b4fd2811b2cf63689cd751d42c7.json\",\"account_sid\":\"ACcc94b7f22d60f3ff894db87b9ed35006\",\"num_media\":\"0\",\"to\":\"+201068173169\",\"date_created\":\"Fri, 03 Nov 2023 17:23:23 +0000\",\"status\":\"queued\",\"sid\":\"SM8af02b4fd2811b2cf63689cd751d42c7\",\"date_sent\":null,\"messaging_service_sid\":null,\"error_code\":null,\"price_unit\":\"USD\",\"api_version\":\"2010-04-01\",\"subresource_uris\":{\"media\":\"\\/2010-04-01\\/Accounts\\/ACcc94b7f22d60f3ff894db87b9ed35006\\/Messages\\/SM8af02b4fd2811b2cf63689cd751d42c7\\/Media.json\"}},\"duration\":1303,\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:24'),
(6, '9a86ad1b-f715-4f41-989e-385379ab0216', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'cache', '{\"type\":\"missed\",\"key\":\"H97PPVzwaIZrMKZQ\",\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:25'),
(7, '9a86ad1c-17c6-4808-a79f-6b2ea4094af5', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'cache', '{\"type\":\"hit\",\"key\":\"a75f3f172bfb296f2e10cbfc6dfc1883\",\"value\":1,\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:25'),
(8, '9a86ad1c-1868-424d-b232-7ac8e5f9154d', '9a86ad1c-19db-4d24-a14b-42f4024d7c11', NULL, 1, 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/api\\/register\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Api\\\\AuthController@register\",\"middleware\":[\"api\"],\"headers\":{\"accept\":\"application\\/json\",\"authorization\":\"********\",\"user-agent\":\"PostmanRuntime\\/7.34.0\",\"postman-token\":\"29e94730-c797-4851-92e2-acd389acc462\",\"host\":\"127.0.0.1:8000\",\"accept-encoding\":\"gzip, deflate, br\",\"connection\":\"keep-alive\",\"content-type\":\"multipart\\/form-data; boundary=--------------------------609922088280872021605558\",\"content-length\":\"531\"},\"payload\":{\"username\":\"asdasd\",\"phone\":\"01068173169\",\"password\":\"********\",\"password_confirmation\":\"********\"},\"session\":[],\"response_status\":201,\"response\":{\"statusType\":true,\"status\":201,\"message\":\"Success\",\"data\":{\"id\":22,\"username\":\"asdasd\",\"phone\":\"01068173169\",\"phone_verified_at\":null,\"created_at\":\"2023 11 03\",\"updated_at\":\"2023 11 03\",\"expiration_token\":1699035805,\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjk5MDMyMjA1LCJleHAiOjE2OTkwMzU4MDUsIm5iZiI6MTY5OTAzMjIwNSwianRpIjoiSDk3UFBWendhSVpyTUtaUSIsInN1YiI6IjIyIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.RmiDwriSVzgR7v1wuU1wt0Q6gwxZGDxxVEvpWgjjXcU\"}},\"duration\":4372,\"memory\":6,\"hostname\":\"DESKTOP-AK2O6V9\"}', '2023-11-03 17:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE IF NOT EXISTS `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `telescope_entries_tags`
--

INSERT INTO `telescope_entries_tags` (`entry_uuid`, `tag`) VALUES
('9a86ad16-6c29-444c-bdda-4865761d6a93', 'App\\Models\\User:22');

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE IF NOT EXISTS `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `phone`, `admin`, `code`, `phone_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '123456789', 1, NULL, '2023-11-03 15:20:18', '$2y$12$0sD.DBZRi/wI37b2RRRS7u0rKDOX.iFMPoOYdYuvQM8eVh8hkTfHy', NULL, '2023-11-03 15:20:18', '2023-11-03 15:20:18'),
(2, 'Darron Littel PhD', '+1-425-299-3555', 0, NULL, '2023-11-03 15:20:18', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'meBuCrJzCM', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(3, 'Jennie Reichert', '1-775-342-0820', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'UvJvIx0Vg8', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(4, 'Savannah Koss III', '+1-870-797-4638', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'DkShb6akMg', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(5, 'Harmony Eichmann', '1-351-518-0163', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'x7Gp8jeZua', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(6, 'Frida Bosco DDS', '934-879-1903', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'z8iQClmufx', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(7, 'Jose Becker', '331-406-9793', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'grzYzGX5dP', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(8, 'Savion Schmidt', '339.957.1834', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'eVjT9P1wLO', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(9, 'Domenica Ebert', '+1-336-343-5052', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'hALjvahOyQ', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(10, 'Mr. Jamir Hilpert Jr.', '662-645-3724', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 's6ilRGudMb', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(11, 'Bonnie Murphy', '+1-220-512-0074', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'zE6AqQNiCG', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(12, 'Bernhard Gerlach DVM', '+17757100967', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'OF06S7pxDZ', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(13, 'Emmet Russel', '+1.501.726.4819', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'GyknSoimw6', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(14, 'Virginia Hansen', '1-913-640-2095', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'H2OOYMX6fY', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(15, 'Donnell Lockman IV', '316-631-1777', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'NWHwb0ptjX', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(16, 'Dr. Lila Balistreri IV', '+1 (205) 239-5261', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'tV7G9i6jo0', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(17, 'Destiny Waters', '1-563-582-8688', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 't3yivlCerK', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(18, 'Maurine Weimann PhD', '+1-281-695-7203', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'ZqFXbYnERN', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(19, 'Victor Treutel', '+1-878-761-5592', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'vadJJKCA0i', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(20, 'Dangelo Monahan', '+1-225-862-1533', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'LLWaeZydiW', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(21, 'Tate Marvin', '+1-281-522-6734', 0, NULL, '2023-11-03 15:20:19', '$2y$12$Gv9NkU7cZIVmDrW9flOV7OJEJVWwu7US2nj653uxfKd9hZpT4o7sS', 'rFj9SA7o8r', '2023-11-03 15:20:19', '2023-11-03 15:20:19'),
(22, 'asdasd', '01068173169', 0, '460583', NULL, '$2y$12$O5KZ.r53jn29sQBeMkis3uxglxHTqFc1feEuf1ZDJos/TcYmosj6C', NULL, '2023-11-03 15:23:22', '2023-11-03 15:23:22');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
