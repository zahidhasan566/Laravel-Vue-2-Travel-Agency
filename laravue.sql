-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2021 at 12:24 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravue`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `created_by`, `title`, `content`, `photo`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'happy new year', 'happy new year details', 'D5GanUlnIdJxSLx4CcoLaSbK8e6TFs.png', 'http://localhost:8000/storage/D5GanUlnIdJxSLx4CcoLaSbK8e6TFs.png', '2021-11-23 03:05:41', '2021-11-23 03:05:41'),
(2, 1, 'friday Offer', 'family offfer', 'VuI3UkeuTWLuOGeLXzK0kqtxDTnp1D.jpeg', 'http://localhost:8000/storage/VuI3UkeuTWLuOGeLXzK0kqtxDTnp1D.jpeg', '2021-11-23 03:06:07', '2021-11-23 03:06:07'),
(3, 1, 'Big Sunday', 'sunday project', 'XH2HnScnUdx0EthT12Rh5OuN8P27zO.jpg', 'http://localhost:8000/storage/XH2HnScnUdx0EthT12Rh5OuN8P27zO.jpg', '2021-11-23 03:06:34', '2021-11-23 03:06:34'),
(4, 1, 'new Deal', 'new offer', 'Sje8q8z2Z7dsuhgv7gNcfOroeLGxRp.png', 'http://localhost:8000/storage/Sje8q8z2Z7dsuhgv7gNcfOroeLGxRp.png', '2021-11-23 03:07:22', '2021-11-23 03:07:22'),
(5, 1, 'independence  day', '16th december', '1oSZ2NG7Tg0Q6vua658i0UIYwJtxOI.jpg', 'http://localhost:8000/storage/1oSZ2NG7Tg0Q6vua658i0UIYwJtxOI.jpg', '2021-11-23 03:08:05', '2021-11-23 03:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `chat_room_id`, `user_id`, `message`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL, '2021-11-23 02:14:44', '2021-11-23 02:14:44'),
(2, 2, 2, 'hi', 'customer', '2021-11-23 02:14:51', '2021-11-23 02:14:51'),
(3, 2, 2, 'hlw', 'customer', '2021-11-23 02:16:02', '2021-11-23 02:16:02'),
(4, 2, 1, 'admin', 'admin', '2021-11-23 02:16:19', '2021-11-23 02:16:19'),
(5, 2, 1, 'hlw from admin', 'admin', '2021-11-23 02:24:40', '2021-11-23 02:24:40'),
(6, 2, 2, 'hlw from customer', 'customer', '2021-11-23 02:25:01', '2021-11-23 02:25:01'),
(7, 2, 1, '12', 'admin', '2021-11-23 02:25:15', '2021-11-23 02:25:15'),
(8, 2, 2, '13', 'customer', '2021-11-23 02:25:19', '2021-11-23 02:25:19'),
(9, 2, 1, '14', 'admin', '2021-11-23 02:25:25', '2021-11-23 02:25:25'),
(10, 2, 2, '15', 'customer', '2021-11-23 02:25:28', '2021-11-23 02:25:28'),
(11, 2, 1, '16', 'admin', '2021-11-23 02:25:37', '2021-11-23 02:25:37'),
(12, 2, 2, '17', 'customer', '2021-11-23 02:25:40', '2021-11-23 02:25:40'),
(13, 2, 1, '18', 'admin', '2021-11-23 02:45:16', '2021-11-23 02:45:16'),
(14, 2, 2, NULL, NULL, '2021-11-23 03:06:57', '2021-11-23 03:06:57'),
(15, 2, 2, NULL, NULL, '2021-11-23 22:41:15', '2021-11-23 22:41:15'),
(16, 2, 2, '24 november', 'customer', '2021-11-23 22:41:35', '2021-11-23 22:41:35'),
(17, 2, 1, 'hi', 'admin', '2021-11-23 22:41:47', '2021-11-23 22:41:47'),
(18, 2, 2, 'hlw', 'customer', '2021-11-23 22:42:31', '2021-11-23 22:42:31'),
(19, 2, 1, 'whats up?', 'admin', '2021-11-23 22:42:47', '2021-11-23 22:42:47'),
(20, 2, 2, NULL, NULL, '2021-11-24 00:13:03', '2021-11-24 00:13:03'),
(21, 2, 2, NULL, NULL, '2021-11-24 00:24:21', '2021-11-24 00:24:21'),
(22, 2, 2, 'hlw from cs', 'customer', '2021-11-24 00:25:39', '2021-11-24 00:25:39'),
(23, 5, 5, NULL, NULL, '2021-11-24 00:29:39', '2021-11-24 00:29:39'),
(24, 5, 5, 'Alisha speaks !!!', 'customer', '2021-11-24 00:30:00', '2021-11-24 00:30:00'),
(25, 5, 1, 'hi alisha', 'admin', '2021-11-24 00:30:20', '2021-11-24 00:30:20'),
(26, 5, 5, 'i need a ticket emergency', 'customer', '2021-11-24 00:30:48', '2021-11-24 00:30:48'),
(27, 5, 1, 'ok whats ur desitantion?', 'admin', '2021-11-24 00:31:00', '2021-11-24 00:31:00'),
(28, 5, 5, 'Bangkok', 'customer', '2021-11-24 00:31:33', '2021-11-24 00:31:33'),
(29, 5, 1, 'Ok give me some moment i will inform u', 'admin', '2021-11-24 00:31:55', '2021-11-24 00:31:55'),
(30, 5, 5, 'ok', 'customer', '2021-11-24 00:32:00', '2021-11-24 00:32:00'),
(31, 5, 1, 'hlw', 'admin', '2021-11-24 00:43:46', '2021-11-24 00:43:46'),
(32, 5, 5, 'did you found any ticket?', 'customer', '2021-11-24 00:44:11', '2021-11-24 00:44:11'),
(33, 5, 1, 'yes', 'admin', '2021-11-24 00:44:20', '2021-11-24 00:44:20'),
(34, 5, 1, 'ok', 'admin', '2021-11-24 00:46:56', '2021-11-24 00:46:56'),
(35, 5, 5, 'hum', 'customer', '2021-11-24 00:47:37', '2021-11-24 00:47:37'),
(36, 2, 2, NULL, NULL, '2021-11-24 00:50:04', '2021-11-24 00:50:04'),
(37, 5, 5, NULL, NULL, '2021-11-24 00:50:24', '2021-11-24 00:50:24'),
(38, 5, 5, NULL, NULL, '2021-11-24 00:53:03', '2021-11-24 00:53:03'),
(39, 5, 1, '23', 'admin', '2021-11-24 00:54:34', '2021-11-24 00:54:34'),
(40, 5, 5, NULL, NULL, '2021-11-24 00:54:38', '2021-11-24 00:54:38'),
(41, 5, 5, '24', 'customer', '2021-11-24 00:54:48', '2021-11-24 00:54:48'),
(42, 5, 1, '25', 'admin', '2021-11-24 00:54:55', '2021-11-24 00:54:55'),
(43, 5, 1, '26', 'admin', '2021-11-24 00:56:23', '2021-11-24 00:56:23'),
(44, 2, 2, NULL, NULL, '2021-11-24 00:56:40', '2021-11-24 00:56:40'),
(45, 5, 5, NULL, NULL, '2021-11-24 00:57:29', '2021-11-24 00:57:29'),
(46, 2, 2, NULL, NULL, '2021-11-24 04:02:48', '2021-11-24 04:02:48'),
(47, 5, 5, NULL, NULL, '2021-11-24 04:04:04', '2021-11-24 04:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fk_user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `select_sms` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`id`, `fk_user_id`, `name`, `age`, `select_sms`, `transport`, `gender`, `priority`, `comments`, `created_at`, `updated_at`) VALUES
(1, 2, 'sopno', '34', 'SendMail', 'plane', 'Female', 'Medium', 'ok', '2021-11-23 02:14:28', '2021-11-23 02:14:28'),
(2, 5, 'alisha', '17', 'SendMail', 'plane', 'Female', 'High', 'ok', '2021-11-24 00:29:06', '2021-11-24 00:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_10_25_102314_create_customer_details_table', 1),
(7, '2021_11_02_065133_create_permission_tables', 1),
(8, '2021_11_04_082900_create_blog_posts_table', 1),
(9, '2021_11_16_084017_create_chat_rooms_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'browser', '081d7c32c78c75c4e17d1ae359dba6f47147017bb82d53ad433d9f1b0ef45b6e', '[\"*\"]', '2021-11-23 02:32:02', '2021-11-23 01:56:12', '2021-11-23 02:32:02'),
(2, 'App\\Models\\User', 1, 'browser', '854d175657b18bf4061391ca23a2a357942f7501ed5cbe27e9a46f119c314d8d', '[\"*\"]', '2021-11-24 03:45:35', '2021-11-23 22:40:46', '2021-11-24 03:45:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2021-11-23 01:55:46', '2021-11-23 01:55:46'),
(2, 'Super Admin', 'web', '2021-11-23 01:55:46', '2021-11-23 01:55:46'),
(3, 'Customer', 'web', '2021-11-23 01:55:46', '2021-11-23 01:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'superadmin@com.bd', NULL, '$2y$10$nOVpp9LBgrh2uHY/bhBtkuBmf8N2qn4K5j6SPpbAYuKK1ELgpJLm2', NULL, '2021-11-23 01:54:58', '2021-11-23 01:54:58'),
(2, 'sopno', 'sopno@com.bd', NULL, '$2y$10$vBCX265KgYRyfVsQSPE8VO6UBT9C4jIi6XABPY9MA7g3AC.RR8ikO', NULL, '2021-11-23 02:14:28', '2021-11-23 02:14:28'),
(5, 'alisha', 'alisha@com.bd', NULL, '$2y$10$fU6VKpr39tKGUosZHENbNuqyWa0l6Nlkih./aSH/t75Facv4wmccm', NULL, '2021-11-24 00:29:06', '2021-11-24 00:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_posts_created_by_foreign` (`created_by`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_rooms_user_id_foreign` (`user_id`);

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_details_fk_user_id_foreign` (`fk_user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

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
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `customer_details`
--
ALTER TABLE `customer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD CONSTRAINT `chat_rooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD CONSTRAINT `customer_details_fk_user_id_foreign` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
