-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2021 at 09:56 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_04_09_164334_starts', 1),
(5, '2021_04_09_164354_stops', 1),
(6, '2021_04_09_164411_stations', 1),
(7, '2021_04_12_172720_add_time_train_to_stations_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `starts`
--

CREATE TABLE `starts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `starts`
--

INSERT INTO `starts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Kraljevo', '2021-04-09 18:35:49', NULL),
(2, 'Novi Sad', NULL, NULL),
(3, 'Pozega', NULL, NULL),
(4, 'Kragujevac', NULL, NULL),
(5, 'Nis', NULL, NULL),
(6, 'Beograd', NULL, NULL),
(7, 'Loznica', NULL, NULL),
(8, 'Smederevo', NULL, NULL),
(9, 'Zrenjanin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_id` bigint(20) UNSIGNED NOT NULL,
  `stop_id` bigint(20) UNSIGNED NOT NULL,
  `time` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `train_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `created_at`, `updated_at`, `start_id`, `stop_id`, `time`, `train_number`) VALUES
(1, 'Kraljevo', NULL, NULL, 1, 1, '10:00', '4832'),
(2, 'Adrani', NULL, NULL, 1, 1, '10:08', '4832'),
(3, 'Mrsac', NULL, NULL, 1, 1, '10:12', '4832'),
(4, 'Samaila', NULL, NULL, 1, 1, '10:16', '4832'),
(5, 'Goricani', NULL, NULL, 1, 1, '10:21', '4832'),
(6, 'Mrsinci', NULL, NULL, 1, 1, '10:26', '4832'),
(7, 'Kukici', NULL, NULL, 1, 1, '10:30', '4832'),
(8, 'Zablace', NULL, NULL, 1, 1, '10:34', '4832'),
(9, 'Baluga', NULL, NULL, 1, 1, '10:39', '4832'),
(10, 'Cacak', NULL, NULL, 1, 1, '10:45', '4832'),
(11, 'Novi Sad', NULL, NULL, 2, 2, '15:00', '4404'),
(12, 'Kisac', NULL, NULL, 2, 2, '15:15', '4404'),
(13, 'Stepanovicevo', NULL, NULL, 2, 2, '15:22', '4404'),
(14, 'Zmajevo', NULL, NULL, 2, 2, '15:28', '4404'),
(15, 'Vrbas', NULL, NULL, 2, 2, '15:48', '4404'),
(16, 'Lovcenac', NULL, NULL, 2, 2, '16:00', '4404'),
(17, 'Mali Idjos', NULL, NULL, 2, 2, '16:09', '4404'),
(18, 'Backa Topola', NULL, NULL, 2, 2, '16:32', '4404'),
(19, 'Zednik', NULL, NULL, 2, 2, '16:54', '4404'),
(20, 'Subotica', NULL, NULL, 2, 2, '17:26', '4404'),
(21, 'Pozega', NULL, NULL, 3, 1, '07:40', '4831'),
(22, 'Boracko', NULL, NULL, 3, 1, '07:46', '4831'),
(23, 'Gugalj', NULL, NULL, 3, 1, '07:49', '4831'),
(24, 'Dragacevo', NULL, NULL, 3, 1, '07:52', '4831'),
(25, 'Jelen DO', NULL, NULL, 3, 1, '07:55', '4831'),
(26, 'Ovcar Banja', NULL, NULL, 3, 1, '08:02', '4831'),
(27, 'Prijevor', NULL, NULL, 3, 1, '08:09', '4831'),
(28, 'Trbusani', NULL, NULL, 3, 1, '08:13', '4831'),
(29, 'Cacak', NULL, NULL, 3, 1, '08:17', '4831'),
(30, 'Kragujevac', NULL, NULL, 4, 3, '11:58', '3811'),
(31, 'Zavod', NULL, NULL, 4, 3, '12:04', '3811'),
(32, 'Grosnica', NULL, NULL, 4, 3, '12:10', '3811'),
(33, 'Dragobraca', NULL, NULL, 4, 3, '12:20', '3811'),
(34, 'Knic', NULL, NULL, 4, 3, '12:34', '3811'),
(35, 'Gruza', NULL, NULL, 4, 3, '12:45', '3811'),
(36, 'Guberevac', NULL, NULL, 4, 3, '12:59', '3811'),
(37, 'Tomica Brdo', NULL, NULL, 4, 3, '13:10', '3811'),
(38, 'Vitkovac', NULL, NULL, 4, 3, '13:14', '3811'),
(39, 'Milavcici', NULL, NULL, 4, 3, '13:22', '3811'),
(40, 'Vitanovac', NULL, NULL, 4, 3, '13:30', '3811'),
(41, 'Sumarice', NULL, NULL, 4, 3, '13:43', '3811'),
(42, 'Sirca', NULL, NULL, 4, 3, '13:51', '3811'),
(43, 'Kraljevo', NULL, NULL, 4, 3, '13:57', '3811'),
(44, 'Kraljevo', NULL, NULL, 1, 4, '14:50', '3833'),
(45, 'Mataruska Banja', NULL, NULL, 1, 4, '15:02', '3833'),
(46, 'Progorelica', NULL, NULL, 1, 4, '15:08', '3833'),
(47, 'Bogutovacka Banja', NULL, NULL, 1, 4, '15:14', '3833'),
(48, 'Polumir', NULL, NULL, 1, 4, '15:34', '3833'),
(49, 'Pusto Polje', NULL, NULL, 1, 4, '15:43', '3833'),
(50, 'Usce', NULL, NULL, 1, 4, '15:49', '3833'),
(51, 'Lozno', NULL, NULL, 1, 4, '15:58', '3833'),
(52, 'Josanicka Banja', NULL, NULL, 1, 4, '16:04', '3833'),
(53, 'Piskanja', NULL, NULL, 1, 4, '16:08', '3833'),
(54, 'Brvenik', NULL, NULL, 1, 4, '16:15', '3833'),
(55, 'Rvati', NULL, NULL, 1, 4, '16:22', '3833'),
(56, 'Raska', NULL, NULL, 1, 4, '16:30', '3833'),
(57, 'Nis', NULL, NULL, 5, 5, '11:45', '4953'),
(58, 'Medjurovo', NULL, NULL, 5, 5, '11:55', '4953'),
(59, 'Belotince', NULL, NULL, 5, 5, '12:01', '4953'),
(60, 'Capljinac', NULL, NULL, 5, 5, '12:05', '4953'),
(61, 'Maloliste', NULL, NULL, 5, 5, '12:09', '4953'),
(62, 'Doljevac', NULL, NULL, 5, 5, '12:15', '4953'),
(63, 'Kocane', NULL, NULL, 5, 5, '12:19', '4953'),
(64, 'Pukovac', NULL, NULL, 5, 5, '12:24', '4953'),
(65, 'Brestovac', NULL, NULL, 5, 5, '12:29', '4953'),
(66, 'Lipovica', NULL, NULL, 5, 5, '12:34', '4953'),
(67, 'Pecenjevce', NULL, NULL, 5, 5, '12:41', '4953'),
(68, 'Zivkovo', NULL, NULL, 5, 5, '12:46', '4953'),
(69, 'Priboj Leskovacki', NULL, NULL, 5, 5, '12:50', '4953'),
(70, 'Leskovac', NULL, NULL, 5, 5, '12:56', '4953'),
(71, 'Beograd', NULL, NULL, 6, 6, '13:05', '2905'),
(72, 'Rakovica', NULL, NULL, 6, 6, '13:13', '2905'),
(73, 'Resnik', NULL, NULL, 6, 6, '13:20', '2905'),
(74, 'Ripanj', NULL, NULL, 6, 6, '13:35', '2905'),
(75, 'Ralja', NULL, NULL, 6, 6, '13:56', '2905'),
(76, 'Sopot Kosmajski', NULL, NULL, 6, 6, '14:05', '2905'),
(77, 'Mladenovac', NULL, NULL, 6, 6, '14:15', '2905'),
(78, 'Loznica', NULL, NULL, 7, 7, '05:50', '5221'),
(79, 'Loznica Fabrika', NULL, NULL, 7, 7, '05:54', '5221'),
(80, 'Koviljaca', NULL, NULL, 7, 7, '05:58', '5221'),
(82, 'Gornja Koviljaca', NULL, NULL, 7, 7, '06:04', '5221'),
(83, 'Brasina', NULL, NULL, 7, 7, '06:09', '5221'),
(84, 'Donja Borina', NULL, NULL, 7, 7, '06:13', '5221'),
(85, 'Radalj', NULL, NULL, 7, 7, '06:19', '5221'),
(86, 'Zvornik', NULL, NULL, 7, 7, '06:24', '5221'),
(87, 'Smederevo', NULL, NULL, 8, 8, '07:10', '6753'),
(88, 'Godomin', NULL, NULL, 8, 8, '07:17', '6753'),
(89, 'Radinac', NULL, NULL, 8, 8, '07:23', '6753'),
(90, 'Vranovo', NULL, NULL, 8, 8, '07:31', '6753'),
(91, 'Mala Krsna', NULL, NULL, 8, 8, '07:36', '6753'),
(92, 'Ljubicevski Most', NULL, NULL, 8, 8, '07:10', '6753'),
(93, 'Pozarevac', NULL, NULL, 8, 8, '08:03', '6753'),
(94, 'Zrenjanin', NULL, NULL, 9, 9, '07:20', '2520'),
(95, 'Elemir', NULL, NULL, 9, 9, '07:36', '2520'),
(96, 'Melenci', NULL, NULL, 9, 9, '07:51', '2520'),
(97, 'Kumane', NULL, NULL, 9, 9, '08:04', '2520'),
(98, 'Novi Becej', NULL, NULL, 9, 9, '08:14', '2520'),
(99, 'Banat Milosevo Polje', NULL, NULL, 9, 9, '08:30', '2520'),
(100, 'Banatsko Milosevo', NULL, NULL, 9, 9, '08:36', '2520'),
(101, 'Kikinda', NULL, NULL, 9, 9, '08:55', '2520');

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cacak', '2021-04-09 18:34:08', NULL),
(2, 'Subotica', NULL, NULL),
(3, 'Kraljevo', NULL, NULL),
(4, 'Raska', NULL, NULL),
(5, 'Leskovac', NULL, NULL),
(6, 'Mladenovac', NULL, NULL),
(7, 'Zvornik', NULL, NULL),
(8, 'Pozarevac', NULL, NULL),
(9, 'Kikinda', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `starts`
--
ALTER TABLE `starts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stations_start_id_foreign` (`start_id`),
  ADD KEY `stations_stop_id_foreign` (`stop_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `starts`
--
ALTER TABLE `starts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stations`
--
ALTER TABLE `stations`
  ADD CONSTRAINT `stations_start_id_foreign` FOREIGN KEY (`start_id`) REFERENCES `starts` (`id`),
  ADD CONSTRAINT `stations_stop_id_foreign` FOREIGN KEY (`stop_id`) REFERENCES `stops` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
