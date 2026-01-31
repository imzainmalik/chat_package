-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2026 at 03:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ocean_dashboard2`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_doc`
--

CREATE TABLE `bank_doc` (
  `id` int(11) NOT NULL,
  `doc_type` varchar(122) NOT NULL,
  `title` varchar(122) NOT NULL,
  `message` varchar(122) NOT NULL,
  `family_owner_id` int(11) NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank_doc`
--

INSERT INTO `bank_doc` (`id`, `doc_type`, `title`, `message`, `family_owner_id`, `uploader_id`, `created_at`, `updated_at`) VALUES
(18, '4', 'Qui neque nesciunt', 'Ut cillum quasi iust', 27, 27, '2026-01-02 17:14:03', '2026-01-02 22:14:03'),
(19, '4', 'Eligendi ut odit tem', 'Provident est velit', 27, 27, '2026-01-02 17:22:50', '2026-01-02 22:22:50'),
(20, '4', 'Vel ut culpa odio a', 'Laborum A animi cu', 27, 27, '2026-01-02 17:23:58', '2026-01-02 22:23:58'),
(21, '4', 'Consequatur minima', 'Quia ab commodi est', 27, 27, '2026-01-02 17:33:41', '2026-01-02 22:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `assigned_to` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(122) NOT NULL,
  `type` int(11) NOT NULL,
  `status` varchar(112) NOT NULL DEFAULT 'pending',
  `is_deleted` int(11) DEFAULT 0 COMMENT '0=not deleted, 1=deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `owner_id`, `assigned_to`, `title`, `details`, `amount`, `payment_method`, `type`, `status`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 5, 2, 'Adipisicing eum ut v', 'Eveniet qui suscipi', 92.00, 'paypal', 0, 'pending', 0, '2025-10-08 07:08:10', '2025-10-08 07:08:10'),
(2, 5, 2, 'Adipisicing eum ut v', 'Eveniet qui suscipi', 92.00, 'paypal', 0, 'pending', 0, '2025-10-08 07:08:55', '2025-10-08 07:08:55'),
(3, 1, 2, 'Autem non et quos co', 'Dolore sit sint in a', 52.00, 'cashapp', 1, 'approved', 0, '2025-10-08 07:10:45', '2025-10-08 07:42:50'),
(4, 1, 3, 'ad ssdsd sdad', 'da dsd d\r\ndsa\r\n \r\n\r\ndasdasd sdsdsd', 800.00, 'paypal', 0, 'approved', 0, '2025-10-28 22:09:27', '2025-10-28 22:13:24'),
(5, 1, 3, 'adsadsd', 'dasdsa', 78.00, 'zelle', 0, 'approved', 0, '2025-10-28 22:21:25', '2025-10-28 22:25:08'),
(6, 1, 10, 'Quia temporibus ipsu', 'Sapiente mollit omni', 54.00, 'cashapp', 0, 'approved', 0, '2025-11-13 21:15:30', '2025-11-28 20:50:40'),
(7, 1, 10, 'Fugit repudiandae d', 'Sunt vero quo ex ip', 51.00, 'other', 1, 'approved', 0, '2025-11-15 02:33:09', '2025-11-15 02:38:58'),
(8, 27, 28, 'Dad\'s home electricity Bill', 'sdsdsd', 230.00, 'bank_transfer', 0, 'declined', 0, '2025-12-02 19:59:15', '2025-12-02 19:59:35'),
(9, 27, 28, 'dad\'s electricity bill', 'sdfdsfsdf', 250.00, 'bank_transfer', 0, 'approved', 0, '2025-12-02 20:01:04', '2025-12-02 20:03:49'),
(10, 27, 29, 'Totam qui architecto', 'dsds', 31.00, 'bank_transfer', 0, 'approved', 0, '2025-12-02 20:45:09', '2025-12-03 17:41:34'),
(11, 27, 29, 'Therapy', 'Therapy session Dr. John', 300.00, 'bank_transfer', 1, 'approved', 0, '2025-12-03 17:36:44', '2025-12-03 17:41:21'),
(12, 27, 29, 'Test Appointment', 'Test Appointment', 500.00, 'bank_transfer', 1, 'declined', 0, '2025-12-03 18:40:09', '2025-12-03 18:48:15'),
(13, 27, 29, 'Test Appointment', 'Test Appointment', 500.00, 'bank_transfer', 0, 'approved', 0, '2025-12-03 18:50:41', '2025-12-30 23:01:22'),
(14, 27, 28, 'Eye doctor', 'Eye doctor', 350.00, 'bank_transfer', 1, 'approved', 0, '2025-12-03 22:45:18', '2025-12-03 22:52:55'),
(15, 27, 28, 'Groceries', 'Groceries', 99.00, 'bank_transfer', 0, 'declined', 0, '2025-12-03 23:04:30', '2025-12-03 23:23:03'),
(16, 27, 29, 'Groceries', 'Groceries', 500.00, 'bank_transfer', 0, 'approved', 0, '2025-12-03 23:24:08', '2025-12-30 23:01:35'),
(17, 27, 28, 'Tester1234', 'Tester1234', 1220.00, 'bank_transfer', 0, 'pending', 0, '2025-12-04 22:45:37', '2025-12-04 22:45:37'),
(18, 27, 29, 'Tester1234', 'Tester1234', 1000.00, 'bank_transfer', 0, 'pending', 0, '2025-12-04 22:52:11', '2025-12-04 22:52:11'),
(19, 1, 1, 'Aut eiusmod ipsa ex', 'Cupiditate rerum dol', 23.00, 'other', 0, 'pending', 0, '2025-12-09 00:06:30', '2025-12-09 00:06:30'),
(20, 27, 29, 'Officia debitis quas', 'Tempore laborum No', 64.00, 'paypal', 1, 'approved', 0, '2025-12-30 23:26:28', '2026-01-13 17:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bills_id` bigint(20) UNSIGNED NOT NULL,
  `payer_id` bigint(20) UNSIGNED NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `confirmation_number` varchar(255) NOT NULL,
  `receipt_path` varchar(255) NOT NULL,
  `type` int(11) DEFAULT 0 COMMENT '0=contribution, 1=shortfall',
  `note` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0=submitted, 1=approved,2=declined',
  `owner_remarks` text DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_payments`
--

INSERT INTO `bill_payments` (`id`, `bills_id`, `payer_id`, `amount_paid`, `payment_method`, `confirmation_number`, `receipt_path`, `type`, `note`, `status`, `owner_remarks`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 3, 5, 36.00, 'paypal', 'Quis autem ipsam per', '1759882882dasdsad.png', 1, NULL, 0, NULL, 0, '2025-10-08 07:21:22', '2025-10-08 07:21:22'),
(2, 3, 5, 74.00, 'bank_transfer', 'Facilis sed neque nu', '1759882897dasdsad.png', 0, NULL, 0, NULL, 0, '2025-10-08 07:21:37', '2025-10-08 07:21:37'),
(3, 3, 5, 32.00, 'paypal', 'Non et suscipit eos', '1759882936image 2 (1).png', 1, NULL, 0, NULL, 0, '2025-10-08 07:22:16', '2025-10-08 07:22:16'),
(4, 3, 2, 72.00, 'other', 'Dolor consequatur ad', '1761673026dasdsad.png', 0, NULL, 0, NULL, 0, '2025-10-28 21:37:06', '2025-10-28 21:37:06'),
(5, 3, 3, 27.00, 'other', 'Perspiciatis labori', '1761674314image 2 (1).png', 0, NULL, 0, NULL, 0, '2025-10-28 21:58:34', '2025-10-28 21:58:34'),
(6, 4, 3, 62.00, 'cashapp', 'Dignissimos amet bl', '1761675158image 2 (1) (1).png', 0, NULL, 0, NULL, 0, '2025-10-28 22:12:38', '2025-10-28 22:12:38'),
(7, 5, 3, 80.00, 'zelle', 'Exercitation sit eos', '1761675808dasdsad.png', 0, NULL, 1, NULL, 0, '2025-10-28 22:23:28', '2025-10-28 22:25:08'),
(8, 5, 3, 78.00, 'zelle', '4343443', '1761675900logo01.png', 0, NULL, 1, NULL, 0, '2025-10-28 22:25:00', '2025-10-28 22:25:08'),
(9, 7, 10, 51.00, 'paypal', '4343443', '1763156261shop_18985965.png', 0, NULL, 0, NULL, 0, '2025-11-15 02:37:41', '2025-11-15 02:37:41'),
(10, 9, 28, 250.00, 'zelle', 'dsd', '1764709245shop_18985965.png', 0, NULL, 0, NULL, 0, '2025-12-02 21:00:45', '2025-12-02 21:00:45'),
(11, 9, 28, 250.00, 'zelle', 'dsad', '1764709727image 2 (1) (1).png', 0, NULL, 0, NULL, 0, '2025-12-02 21:08:47', '2025-12-02 21:08:47'),
(12, 10, 29, 125.00, 'cashapp', '545444', '1764783246backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 17:34:06', '2025-12-03 17:34:06'),
(13, 11, 29, 150.00, 'bank_transfer', '544897', '1764783450backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 17:37:30', '2025-12-03 17:37:30'),
(14, 8, 28, 140.00, 'paypal', '7896541', '1764783627backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 17:40:27', '2025-12-03 17:40:27'),
(15, 12, 29, 500.00, 'bank_transfer', 'sdsds', '1764787245backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 18:40:45', '2025-12-03 18:40:45'),
(16, 12, 29, 250.00, 'paypal', '78965422', '1764787394backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 18:43:14', '2025-12-03 18:43:14'),
(17, 13, 29, 8.00, 'cashapp', 'sddsd', '1764788301278-2783229_credit-card-icons-hd-png-download.png', 0, NULL, 0, NULL, 0, '2025-12-03 18:58:21', '2025-12-03 18:58:21'),
(18, 14, 28, 200.00, 'cashapp', '85236', '1764801977backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 22:46:17', '2025-12-03 22:46:17'),
(19, 13, 29, 150.00, 'paypal', '78945', '1764802821backpacking-on-a-budget-gear.jpg', 0, NULL, 0, NULL, 0, '2025-12-03 23:00:21', '2025-12-03 23:00:21'),
(20, 17, 28, 100.00, 'bank_transfer', '43434433', '1764888537Picture4.png', 0, NULL, 0, NULL, 0, '2025-12-04 22:48:57', '2025-12-04 22:48:57'),
(21, 18, 29, 1000.00, 'cashapp', '4343443', '1764888938Picture6.png', 0, NULL, 0, NULL, 0, '2025-12-04 22:55:38', '2025-12-04 22:55:38'),
(22, 18, 29, 38.00, 'paypal', 'Rerum do ad quas per', '1767138936Picture5.png', 0, NULL, 0, NULL, 0, '2025-12-30 23:55:36', '2025-12-30 23:55:36'),
(23, 18, 29, 53.00, 'other', 'Autem atque ipsum f', '1767139306Picture4.jpg', 0, NULL, 0, NULL, 0, '2025-12-31 00:01:46', '2025-12-31 00:01:46'),
(24, 18, 29, 46.00, 'zelle', 'Non eos repudiandae', '1767140390Picture6.png', 0, NULL, 0, NULL, 0, '2025-12-31 00:19:50', '2025-12-31 00:19:50'),
(25, 20, 29, 64.00, 'cashapp', '5666', '1768585112https___v13.webtestsdev.com_public_banking_documents_P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', 0, NULL, 0, NULL, 0, '2026-01-16 17:38:32', '2026-01-16 17:38:32'),
(26, 18, 29, 1000.00, 'cashapp', 'dsd', '1768587127https___v13.webtestsdev.com_public_banking_documents_P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', 0, NULL, 0, NULL, 0, '2026-01-16 18:12:07', '2026-01-16 18:12:07'),
(27, 18, 29, 16.00, 'other', 'Molestiae Nam optio', '1768587235https___v13.webtestsdev.com_public_banking_documents_P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', 0, NULL, 0, NULL, 0, '2026-01-16 18:13:55', '2026-01-16 18:13:55'),
(28, 18, 29, 5.00, 'zelle', 'Dolor voluptate mini', '1768588051https___v13.webtestsdev.com_public_banking_documents_P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', 0, NULL, 0, NULL, 0, '2026-01-16 18:27:31', '2026-01-16 18:27:31'),
(29, 17, 28, 42.00, 'bank_transfer', 'Libero laudantium o', '1769030253https___v13.webtestsdev.com_public_banking_documents_P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', 0, NULL, 0, NULL, 0, '2026-01-21 21:17:33', '2026-01-21 21:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carewatcher`
--

CREATE TABLE `carewatcher` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `family_memer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `carewatcher`
--

INSERT INTO `carewatcher` (`id`, `owner_id`, `family_memer_id`, `created_at`, `updated_at`) VALUES
(37, 27, 28, '2026-01-19 19:31:18', '2026-01-20 00:31:18'),
(38, 27, 35, '2026-01-19 19:31:24', '2026-01-20 00:31:24'),
(39, 27, 28, '2026-01-19 19:35:24', '2026-01-20 00:35:24'),
(40, 27, 29, '2026-01-21 15:51:15', '2026-01-21 20:51:15'),
(41, 27, 35, '2026-01-21 15:51:18', '2026-01-21 20:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `chatify_conversations`
--

CREATE TABLE `chatify_conversations` (
  `id` char(36) NOT NULL,
  `type` enum('private','group') NOT NULL DEFAULT 'private',
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatify_conversations`
--

INSERT INTO `chatify_conversations` (`id`, `type`, `name`, `avatar`, `created_by`, `created_at`, `updated_at`) VALUES
('058e9c2b-8ec3-4bea-bf7e-77f674bab087', 'private', NULL, NULL, 27, '2026-01-31 00:17:25', '2026-01-31 00:17:25'),
('4eac966d-ffad-4968-b6b2-cbffe41f5918', 'private', NULL, NULL, 27, '2026-01-29 03:52:21', '2026-01-29 03:52:21'),
('59107422-87da-41ee-95b6-1ec27a72e767', 'private', NULL, NULL, 27, '2026-01-29 03:53:56', '2026-01-29 03:53:56'),
('5ad9cc79-2e8b-4a62-87b9-c5359f1843d7', 'private', NULL, NULL, 27, '2026-01-29 03:49:32', '2026-01-29 03:49:32'),
('9f0c2167-db2f-474e-97df-ffbc2e98b239', 'private', NULL, NULL, 27, '2026-01-29 04:41:53', '2026-01-29 04:41:53'),
('ba81d87d-c32b-41a5-8c7d-b6f333ce4eec', 'private', NULL, NULL, 27, '2026-01-29 03:58:55', '2026-01-29 03:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `chatify_messages`
--

CREATE TABLE `chatify_messages` (
  `id` char(36) NOT NULL,
  `conversation_id` char(36) NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `reply_to_id` varchar(110) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `type` enum('TEXT','IMAGE','VOICE','FILE') NOT NULL DEFAULT 'TEXT',
  `attachment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`attachment`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatify_messages`
--

INSERT INTO `chatify_messages` (`id`, `conversation_id`, `sender_id`, `reply_to_id`, `content`, `type`, `attachment`, `created_at`, `updated_at`, `deleted_at`) VALUES
('02056877-0315-4d10-b23f-76ce8528b207', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sd', 'TEXT', NULL, '2026-01-30 21:02:54', '2026-01-30 21:02:54', NULL),
('0571bbeb-fd6c-4e3f-8069-eef5eca7b252', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '123', 'TEXT', NULL, '2026-01-30 21:19:36', '2026-01-30 21:19:36', NULL),
('05d2ea5e-0392-4712-b349-355046209240', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:19:56', '2026-01-30 21:19:56', NULL),
('06643684-216d-41b9-8ea9-af63f8d09eca', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769811533_voice_msg.ogg\"', '2026-01-31 01:18:53', '2026-01-31 01:18:53', NULL),
('07c30f9a-6cde-47fc-b50e-1be606d4762e', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 03:29:05', '2026-01-30 03:29:05', NULL),
('0a7f9107-e01d-45f5-8d0f-847b52d63770', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ad', 'TEXT', NULL, '2026-01-30 22:05:53', '2026-01-30 22:05:53', NULL),
('0d602819-a89b-4772-b69f-f6828cbcaeda', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, 'dsadsa', 'TEXT', NULL, '2026-01-30 04:52:24', '2026-01-30 04:52:24', NULL),
('1a0d5f71-340c-49f7-9d2e-ac53c4e3cfd6', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'dsdsa', 'TEXT', NULL, '2026-01-30 22:11:05', '2026-01-30 22:11:05', NULL),
('1b5dec55-573a-4f3b-888b-c5e84900c5de', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 20:48:38', '2026-01-30 20:48:38', NULL),
('1caf226c-8179-4159-9ad3-31ed70245efe', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:02:58', '2026-01-30 21:02:58', NULL),
('25d26b47-d41b-4e9c-8dfe-86fe1ce18d43', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sad', 'TEXT', NULL, '2026-01-30 21:43:57', '2026-01-30 21:43:57', NULL),
('32e0db43-c36e-4229-992b-9e1ae6b02a0c', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, '25d26b47-d41b-4e9c-8dfe-86fe1ce18d43', 'sdadsa', 'TEXT', NULL, '2026-01-31 01:18:25', '2026-01-31 01:18:25', NULL),
('358d28c3-068b-44eb-8a06-03e9fc4ffd7b', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769733701_voice_msg.ogg\"', '2026-01-30 03:41:41', '2026-01-30 03:41:41', NULL),
('39524021-0d5d-4358-b732-ace78c449ad7', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sda', 'TEXT', NULL, '2026-01-30 22:14:42', '2026-01-30 22:14:42', NULL),
('41c0e4ec-3850-44d2-a300-4e1fdf9c4f2a', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, '895400f4-f319-4946-b07a-6b5e12bea45e', 'dsads', 'TEXT', NULL, '2026-01-31 01:17:47', '2026-01-31 01:17:47', NULL),
('46aeca5e-4719-4845-ab9d-96b3857df0af', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 23:51:23', '2026-01-30 23:51:23', NULL),
('46fef457-54ce-42f6-9226-af49e6929e05', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:03:52', '2026-01-30 21:03:52', NULL),
('497b1456-5469-4ba4-a2e0-fb8f2be36fa7', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769733549_voice_msg.ogg\"', '2026-01-30 03:39:09', '2026-01-30 03:39:09', NULL),
('4ceb06bd-d4ca-4474-ad68-fee1dad0062f', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769733294_voice_msg.ogg\"', '2026-01-30 03:34:54', '2026-01-30 03:34:54', NULL),
('549c927e-0c9b-41c6-93de-f21441fc2fb6', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '123', 'TEXT', NULL, '2026-01-30 21:05:09', '2026-01-30 21:05:09', NULL),
('55f94424-ad77-4620-8b13-ba2bd1fa6366', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, 'bb359767-ea69-4281-a982-a9aa51876dbd', 'dsada', 'TEXT', NULL, '2026-01-30 20:29:16', '2026-01-30 20:29:16', NULL),
('5744bcdf-00c0-4c60-bd79-a6ff7f5bf608', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 21:22:03', '2026-01-30 21:22:03', NULL),
('5d034397-bea3-41cc-9bbc-ac4e73c066ad', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, 'dsds', 'TEXT', NULL, '2026-01-30 04:51:45', '2026-01-30 04:51:45', NULL),
('5f393284-acca-4675-b52a-c41aa0aaa438', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'fdsffs', 'TEXT', NULL, '2026-01-31 02:19:44', '2026-01-31 02:19:44', NULL),
('629ff755-2d7a-48d6-b312-75ee01fb0d56', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 22:14:47', '2026-01-30 22:14:47', NULL),
('63e5658e-40fb-41f9-97d4-4a527315365e', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'das', 'TEXT', NULL, '2026-01-30 21:01:50', '2026-01-30 21:01:50', NULL),
('658a22d7-674d-4277-b0e2-b1bbe35c4450', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:22:34', '2026-01-30 21:22:34', NULL),
('67106815-a981-42f9-8ed4-a210c1c1b5f3', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '123', 'TEXT', NULL, '2026-01-30 21:27:37', '2026-01-30 21:27:37', NULL),
('6bdff157-45ff-4b7e-ae30-8b117bf98f90', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'dsadsa', 'TEXT', NULL, '2026-01-30 04:09:39', '2026-01-30 04:09:39', NULL),
('790f60c6-e6ef-4b08-a497-ad84293a055b', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 22:03:57', '2026-01-30 22:03:57', NULL),
('79db810c-91f8-46e3-9ebf-ab1952a19ab6', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sss', 'TEXT', NULL, '2026-01-30 21:44:09', '2026-01-30 21:44:09', NULL),
('82456b30-e9e1-406c-9efe-5c7055036e71', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:19:25', '2026-01-30 21:19:25', NULL),
('886d032c-88d5-4a54-b3a6-895a06650955', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769730944_voice_msg.ogg\"', '2026-01-30 02:55:44', '2026-01-30 02:55:44', NULL),
('895400f4-f319-4946-b07a-6b5e12bea45e', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'das', 'TEXT', NULL, '2026-01-30 22:07:56', '2026-01-30 22:07:56', NULL),
('8b12d51e-c921-400b-abf3-0eda941ca084', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'da', 'TEXT', NULL, '2026-01-30 22:03:48', '2026-01-30 22:03:48', NULL),
('94df57ca-5170-4706-b887-77e4be804d80', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 04:52:18', '2026-01-30 04:52:18', NULL),
('95feed4c-bb3d-406e-bbe4-a25711dc5211', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769738113_voice_msg.ogg\"', '2026-01-30 04:55:13', '2026-01-30 04:55:13', NULL),
('967fdfdf-270c-40d7-a74e-80b90479e262', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'wq', 'TEXT', NULL, '2026-01-30 23:51:25', '2026-01-30 23:51:25', NULL),
('97c34bad-dd84-4d6e-8250-70fb072bf0f8', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769732796_voice_msg.ogg\"', '2026-01-30 03:26:36', '2026-01-30 03:26:36', NULL),
('9a53e210-8456-4530-92a1-1b44a5dbddc5', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'das', 'TEXT', NULL, '2026-01-30 03:31:01', '2026-01-30 03:31:01', NULL),
('9f3c09f0-1b1e-4a89-9589-b53cbd146802', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sasdads', 'TEXT', NULL, '2026-01-30 04:51:49', '2026-01-30 04:51:49', NULL),
('a3af77c7-f5b2-4d5b-b910-d4198dd3230b', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 04:54:15', '2026-01-30 04:54:15', NULL),
('a7138797-2c1d-422c-a588-92a17c06a3ae', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769795830_voice_msg.ogg\"', '2026-01-30 20:57:10', '2026-01-30 20:57:10', NULL),
('a82700f3-5890-4388-ac98-53b1d759a915', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'da', 'TEXT', NULL, '2026-01-30 03:32:33', '2026-01-30 03:32:33', NULL),
('ab57d567-3ce2-4f18-a742-f4a34a2827da', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769732636_voice_msg.ogg\"', '2026-01-30 03:23:56', '2026-01-30 03:23:56', NULL),
('b55ad616-dc4e-4842-aff1-9105c8edb5fd', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'dsdas', 'TEXT', NULL, '2026-01-30 04:04:43', '2026-01-30 04:04:43', NULL),
('b7cd2dd7-2ce7-4589-b406-7f3d1e590da1', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sd', 'TEXT', NULL, '2026-01-30 22:06:15', '2026-01-30 22:06:15', NULL),
('bb359767-ea69-4281-a982-a9aa51876dbd', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, NULL, '123', 'TEXT', NULL, '2026-01-30 04:54:40', '2026-01-30 04:54:40', NULL),
('c4f02f96-a3f4-48f5-ad38-882e861250ae', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '1222', 'TEXT', NULL, '2026-01-30 21:01:18', '2026-01-30 21:01:18', NULL),
('cac6677a-2a11-43c9-bff1-c1e84b23764f', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'sad', 'FILE', '\"uploads\\/chat\\/1769795852_index.txt\"', '2026-01-30 20:57:32', '2026-01-30 20:57:32', NULL),
('d1a94ecf-67ba-4244-afd4-eb60eae8d6e7', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '2', 'TEXT', NULL, '2026-01-30 21:28:25', '2026-01-30 21:28:25', NULL),
('d3c0a448-8b68-48dd-b669-5daf483cd8cf', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'dsa', 'TEXT', NULL, '2026-01-30 20:44:47', '2026-01-30 20:44:47', NULL),
('d8ca002c-719b-40d0-a424-95d2a6ebeb17', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769732895_voice_msg.ogg\"', '2026-01-30 03:28:15', '2026-01-30 03:28:15', NULL),
('da74775f-0d9d-4cea-8a86-74ab4d75c794', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '++', 'TEXT', NULL, '2026-01-30 21:22:21', '2026-01-30 21:22:21', NULL),
('e19b1178-d3e2-43c4-999e-b3af68d787cd', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:04:55', '2026-01-30 21:04:55', NULL),
('e4acd2b2-4f18-4433-acc2-6791ea2a13a8', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'sasas', 'TEXT', NULL, '2026-01-30 02:55:29', '2026-01-30 02:55:29', NULL),
('e557c4a5-535e-41b3-8cf8-93cd001a38c2', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 21:03:54', '2026-01-30 21:03:54', NULL),
('e7499f8b-96dd-484b-8178-5984aa79a129', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, '95feed4c-bb3d-406e-bbe4-a25711dc5211', 'dsads', 'TEXT', NULL, '2026-01-30 20:29:01', '2026-01-30 20:29:01', NULL),
('ee9568e1-54a1-4519-8062-9c031d3d6dd8', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, NULL, 'VOICE', '\"uploads\\/chat\\/1769733415_voice_msg.ogg\"', '2026-01-30 03:36:55', '2026-01-30 03:36:55', NULL),
('f33f1b13-a71f-4705-812a-70568310e39c', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, '2323', 'TEXT', NULL, '2026-01-30 21:21:55', '2026-01-30 21:21:55', NULL),
('f372450c-85dc-4687-96d7-9d3521647653', '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, NULL, 'dsd', 'TEXT', NULL, '2026-01-30 02:56:23', '2026-01-30 02:56:23', NULL),
('f3c986bd-b040-4e12-97d0-e596fd9f0ef1', '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, NULL, 'ds', 'TEXT', NULL, '2026-01-30 04:50:15', '2026-01-30 04:50:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chatify_message_status`
--

CREATE TABLE `chatify_message_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('SENT','DELIVERED','READ') NOT NULL DEFAULT 'DELIVERED',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatify_message_status`
--

INSERT INTO `chatify_message_status` (`id`, `message_id`, `user_id`, `status`, `updated_at`) VALUES
(1, 'ef10f3e4-d148-4d1c-9465-00f2fb1fe355', 27, 'SENT', '2026-01-29 03:51:41'),
(2, '8dd2e94f-f98f-4ac1-8165-703277ea0840', 27, 'SENT', '2026-01-29 04:09:18'),
(3, '8639abfb-ea44-4141-a16f-1129e7cace10', 27, 'SENT', '2026-01-29 04:09:36'),
(4, 'ac451cc2-5209-4f87-a0ef-3241e9a75805', 27, 'SENT', '2026-01-29 04:14:20'),
(5, '915a63b7-14c2-43f4-8272-4fc2fa209953', 27, 'SENT', '2026-01-29 04:22:31'),
(6, '9cfdbe3c-ddef-482f-a4a1-9a52931c14f8', 27, 'SENT', '2026-01-29 04:26:26'),
(7, '21cfd091-919e-4ad6-b306-3289cbe80178', 27, 'SENT', '2026-01-29 04:31:32'),
(8, 'bd010d96-ac4e-460a-b40b-a3b940b0506a', 27, 'SENT', '2026-01-29 04:31:38'),
(9, '302a63f1-5af2-43af-9517-33014dda8eb7', 27, 'SENT', '2026-01-29 04:33:35'),
(10, '5ac611d0-83f7-40ad-8785-1a8af779bdcc', 27, 'SENT', '2026-01-29 04:33:40'),
(11, 'e4a5da2a-03f0-463a-8dd6-18c66cfb1968', 27, 'SENT', '2026-01-29 04:34:42'),
(12, '7b6908f4-0d20-462d-b7c5-971203b29afe', 27, 'SENT', '2026-01-29 04:36:50'),
(13, '7d369ce3-0b92-4be5-8f59-dc93810a0cb2', 27, 'SENT', '2026-01-29 04:40:04'),
(14, 'fbabf53d-932d-48df-b75a-9ec0df88e5a1', 27, 'SENT', '2026-01-29 04:41:05'),
(15, '2330e6a4-6634-4760-ac73-221d35cd5a16', 27, 'SENT', '2026-01-29 04:42:02'),
(16, '64f6bf4e-a0c6-486a-be6f-7000b515d65c', 27, 'SENT', '2026-01-29 04:42:05'),
(17, '64417dc1-9c0e-4605-9b44-c359e97d8691', 27, 'SENT', '2026-01-29 04:42:44'),
(18, 'ab5728bd-7e3b-4238-8e2d-7a1e3a22fad2', 27, 'SENT', '2026-01-29 04:43:10'),
(19, '8502faaf-eab3-4be5-bd2c-7715a0fe922b', 27, 'SENT', '2026-01-29 04:48:01'),
(20, '73236cc9-445c-4866-9d54-8da89c39c251', 27, 'SENT', '2026-01-29 04:48:10'),
(21, 'd47f5960-2ab3-4db2-9890-94242f8609d1', 27, 'SENT', '2026-01-29 04:48:17'),
(22, '467f378a-ef1c-4222-bdcc-0fec28fe1da5', 27, 'SENT', '2026-01-29 04:50:40'),
(23, 'f9ff8b93-f125-4af8-b8aa-b2cf1c870625', 27, 'SENT', '2026-01-29 04:50:58'),
(24, 'fe9cb9b3-29bf-4623-b984-e76a9ff161f9', 27, 'SENT', '2026-01-29 05:00:29'),
(25, 'e9be174f-28c9-494f-a4a4-4ead4ca6d44f', 27, 'SENT', '2026-01-29 05:00:54'),
(26, '4690de8d-cf7f-42a5-a4be-c5218f263969', 27, 'SENT', '2026-01-30 02:03:33'),
(27, '57f8d082-4d1b-484c-8e81-9b33fe44a881', 27, 'SENT', '2026-01-30 02:05:13'),
(28, 'e4acd2b2-4f18-4433-acc2-6791ea2a13a8', 27, 'SENT', '2026-01-30 02:55:29'),
(29, '886d032c-88d5-4a54-b3a6-895a06650955', 27, 'SENT', '2026-01-30 02:55:44'),
(30, 'f372450c-85dc-4687-96d7-9d3521647653', 27, 'SENT', '2026-01-30 02:56:23'),
(31, 'ab57d567-3ce2-4f18-a742-f4a34a2827da', 27, 'SENT', '2026-01-30 03:23:56'),
(32, '97c34bad-dd84-4d6e-8250-70fb072bf0f8', 27, 'SENT', '2026-01-30 03:26:36'),
(33, 'd8ca002c-719b-40d0-a424-95d2a6ebeb17', 27, 'SENT', '2026-01-30 03:28:15'),
(34, '07c30f9a-6cde-47fc-b50e-1be606d4762e', 27, 'SENT', '2026-01-30 03:29:05'),
(35, '9a53e210-8456-4530-92a1-1b44a5dbddc5', 27, 'SENT', '2026-01-30 03:31:01'),
(36, 'a82700f3-5890-4388-ac98-53b1d759a915', 27, 'SENT', '2026-01-30 03:32:33'),
(37, '4ceb06bd-d4ca-4474-ad68-fee1dad0062f', 27, 'SENT', '2026-01-30 03:34:54'),
(38, 'ee9568e1-54a1-4519-8062-9c031d3d6dd8', 27, 'SENT', '2026-01-30 03:36:55'),
(39, '497b1456-5469-4ba4-a2e0-fb8f2be36fa7', 27, 'SENT', '2026-01-30 03:39:09'),
(40, '358d28c3-068b-44eb-8a06-03e9fc4ffd7b', 27, 'SENT', '2026-01-30 03:41:41'),
(41, 'b55ad616-dc4e-4842-aff1-9105c8edb5fd', 27, 'SENT', '2026-01-30 04:04:43'),
(42, '6bdff157-45ff-4b7e-ae30-8b117bf98f90', 27, 'SENT', '2026-01-30 04:09:39'),
(43, 'f3c986bd-b040-4e12-97d0-e596fd9f0ef1', 27, 'SENT', '2026-01-30 04:50:15'),
(44, '5d034397-bea3-41cc-9bbc-ac4e73c066ad', 27, 'SENT', '2026-01-30 04:51:45'),
(45, '9f3c09f0-1b1e-4a89-9589-b53cbd146802', 27, 'SENT', '2026-01-30 04:51:49'),
(46, '94df57ca-5170-4706-b887-77e4be804d80', 27, 'SENT', '2026-01-30 04:52:18'),
(47, '0d602819-a89b-4772-b69f-f6828cbcaeda', 27, 'SENT', '2026-01-30 04:52:24'),
(48, 'a3af77c7-f5b2-4d5b-b910-d4198dd3230b', 27, 'SENT', '2026-01-30 04:54:15'),
(49, 'bb359767-ea69-4281-a982-a9aa51876dbd', 27, 'SENT', '2026-01-30 04:54:40'),
(50, '95feed4c-bb3d-406e-bbe4-a25711dc5211', 27, 'SENT', '2026-01-30 04:55:13'),
(51, 'e7499f8b-96dd-484b-8178-5984aa79a129', 27, 'SENT', '2026-01-30 20:29:01'),
(52, '55f94424-ad77-4620-8b13-ba2bd1fa6366', 27, 'SENT', '2026-01-30 20:29:16'),
(53, 'd3c0a448-8b68-48dd-b669-5daf483cd8cf', 27, 'SENT', '2026-01-30 20:44:47'),
(54, '1b5dec55-573a-4f3b-888b-c5e84900c5de', 27, 'SENT', '2026-01-30 20:48:38'),
(55, 'a7138797-2c1d-422c-a588-92a17c06a3ae', 27, 'SENT', '2026-01-30 20:57:10'),
(56, 'cac6677a-2a11-43c9-bff1-c1e84b23764f', 27, 'SENT', '2026-01-30 20:57:32'),
(57, 'c4f02f96-a3f4-48f5-ad38-882e861250ae', 27, 'SENT', '2026-01-30 21:01:18'),
(58, '63e5658e-40fb-41f9-97d4-4a527315365e', 27, 'SENT', '2026-01-30 21:01:50'),
(59, '02056877-0315-4d10-b23f-76ce8528b207', 27, 'SENT', '2026-01-30 21:02:54'),
(60, '1caf226c-8179-4159-9ad3-31ed70245efe', 27, 'SENT', '2026-01-30 21:02:58'),
(61, '46fef457-54ce-42f6-9226-af49e6929e05', 27, 'SENT', '2026-01-30 21:03:52'),
(62, 'e557c4a5-535e-41b3-8cf8-93cd001a38c2', 27, 'SENT', '2026-01-30 21:03:54'),
(63, 'e19b1178-d3e2-43c4-999e-b3af68d787cd', 27, 'SENT', '2026-01-30 21:04:55'),
(64, '549c927e-0c9b-41c6-93de-f21441fc2fb6', 27, 'SENT', '2026-01-30 21:05:09'),
(65, '82456b30-e9e1-406c-9efe-5c7055036e71', 27, 'SENT', '2026-01-30 21:19:25'),
(66, '0571bbeb-fd6c-4e3f-8069-eef5eca7b252', 27, 'SENT', '2026-01-30 21:19:36'),
(67, '05d2ea5e-0392-4712-b349-355046209240', 27, 'SENT', '2026-01-30 21:19:56'),
(68, 'f33f1b13-a71f-4705-812a-70568310e39c', 27, 'SENT', '2026-01-30 21:21:55'),
(69, '5744bcdf-00c0-4c60-bd79-a6ff7f5bf608', 27, 'SENT', '2026-01-30 21:22:03'),
(70, 'da74775f-0d9d-4cea-8a86-74ab4d75c794', 27, 'SENT', '2026-01-30 21:22:21'),
(71, '658a22d7-674d-4277-b0e2-b1bbe35c4450', 27, 'SENT', '2026-01-30 21:22:35'),
(72, '67106815-a981-42f9-8ed4-a210c1c1b5f3', 27, 'SENT', '2026-01-30 21:27:37'),
(73, 'd1a94ecf-67ba-4244-afd4-eb60eae8d6e7', 27, 'SENT', '2026-01-30 21:28:25'),
(74, '25d26b47-d41b-4e9c-8dfe-86fe1ce18d43', 27, 'SENT', '2026-01-30 21:43:57'),
(75, '79db810c-91f8-46e3-9ebf-ab1952a19ab6', 27, 'SENT', '2026-01-30 21:44:09'),
(76, '8b12d51e-c921-400b-abf3-0eda941ca084', 27, 'SENT', '2026-01-30 22:03:48'),
(77, '790f60c6-e6ef-4b08-a497-ad84293a055b', 27, 'SENT', '2026-01-30 22:03:57'),
(78, '0a7f9107-e01d-45f5-8d0f-847b52d63770', 27, 'SENT', '2026-01-30 22:05:53'),
(79, 'b7cd2dd7-2ce7-4589-b406-7f3d1e590da1', 27, 'SENT', '2026-01-30 22:06:15'),
(80, '895400f4-f319-4946-b07a-6b5e12bea45e', 27, 'SENT', '2026-01-30 22:07:56'),
(81, '1a0d5f71-340c-49f7-9d2e-ac53c4e3cfd6', 27, 'SENT', '2026-01-30 22:11:05'),
(82, '39524021-0d5d-4358-b732-ace78c449ad7', 27, 'SENT', '2026-01-30 22:14:42'),
(83, '629ff755-2d7a-48d6-b312-75ee01fb0d56', 27, 'SENT', '2026-01-30 22:14:48'),
(84, '46aeca5e-4719-4845-ab9d-96b3857df0af', 27, 'SENT', '2026-01-30 23:51:23'),
(85, '967fdfdf-270c-40d7-a74e-80b90479e262', 27, 'SENT', '2026-01-30 23:51:25'),
(86, '41c0e4ec-3850-44d2-a300-4e1fdf9c4f2a', 27, 'SENT', '2026-01-31 01:17:47'),
(87, '32e0db43-c36e-4229-992b-9e1ae6b02a0c', 27, 'SENT', '2026-01-31 01:18:25'),
(88, '06643684-216d-41b9-8ea9-af63f8d09eca', 27, 'SENT', '2026-01-31 01:18:53'),
(89, '5f393284-acca-4675-b52a-c41aa0aaa438', 27, 'SENT', '2026-01-31 02:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `chatify_participants`
--

CREATE TABLE `chatify_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('admin','member') NOT NULL DEFAULT 'member',
  `last_read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatify_participants`
--

INSERT INTO `chatify_participants` (`id`, `conversation_id`, `user_id`, `role`, `last_read_at`, `created_at`, `updated_at`) VALUES
(1, '5ad9cc79-2e8b-4a62-87b9-c5359f1843d7', 27, 'member', NULL, '2026-01-29 03:49:32', '2026-01-29 03:49:32'),
(2, '5ad9cc79-2e8b-4a62-87b9-c5359f1843d7', 9, 'member', NULL, '2026-01-29 03:49:32', '2026-01-29 03:49:32'),
(3, '4eac966d-ffad-4968-b6b2-cbffe41f5918', 27, 'member', NULL, '2026-01-29 03:52:21', '2026-01-29 03:52:21'),
(4, '4eac966d-ffad-4968-b6b2-cbffe41f5918', 8, 'member', NULL, '2026-01-29 03:52:21', '2026-01-29 03:52:21'),
(5, '59107422-87da-41ee-95b6-1ec27a72e767', 27, 'member', NULL, '2026-01-29 03:53:56', '2026-01-29 03:53:56'),
(6, '59107422-87da-41ee-95b6-1ec27a72e767', 2, 'member', NULL, '2026-01-29 03:53:56', '2026-01-29 03:53:56'),
(7, 'ba81d87d-c32b-41a5-8c7d-b6f333ce4eec', 27, 'member', NULL, '2026-01-29 03:58:55', '2026-01-29 03:58:55'),
(8, 'ba81d87d-c32b-41a5-8c7d-b6f333ce4eec', 5, 'member', NULL, '2026-01-29 03:58:55', '2026-01-29 03:58:55'),
(9, '9f0c2167-db2f-474e-97df-ffbc2e98b239', 27, 'member', NULL, '2026-01-29 04:41:53', '2026-01-29 04:41:53'),
(10, '9f0c2167-db2f-474e-97df-ffbc2e98b239', 29, 'member', NULL, '2026-01-29 04:41:53', '2026-01-29 04:41:53'),
(11, '058e9c2b-8ec3-4bea-bf7e-77f674bab087', 27, 'member', NULL, '2026-01-31 00:17:25', '2026-01-31 00:17:25'),
(12, '058e9c2b-8ec3-4bea-bf7e-77f674bab087', 4, 'member', NULL, '2026-01-31 00:17:25', '2026-01-31 00:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `chatify_reactions`
--

CREATE TABLE `chatify_reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `emoji` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chatify_reactions`
--

INSERT INTO `chatify_reactions` (`id`, `message_id`, `user_id`, `emoji`, `created_at`, `updated_at`) VALUES
(2, 'd8ca002c-719b-40d0-a424-95d2a6ebeb17', 27, '😂', '2026-01-30 03:30:55', '2026-01-30 03:30:55'),
(5, '07c30f9a-6cde-47fc-b50e-1be606d4762e', 27, '🙏', '2026-01-30 03:32:58', '2026-01-30 03:32:58'),
(6, '4ceb06bd-d4ca-4474-ad68-fee1dad0062f', 27, '🙏', '2026-01-30 03:35:02', '2026-01-30 03:35:02'),
(7, '4ceb06bd-d4ca-4474-ad68-fee1dad0062f', 27, '❤️', '2026-01-30 03:35:16', '2026-01-30 03:35:16'),
(8, '9a53e210-8456-4530-92a1-1b44a5dbddc5', 27, '🙏', '2026-01-30 03:35:29', '2026-01-30 03:35:29'),
(10, 'a82700f3-5890-4388-ac98-53b1d759a915', 27, '😢', '2026-01-30 03:35:37', '2026-01-30 03:35:37'),
(11, 'e4acd2b2-4f18-4433-acc2-6791ea2a13a8', 27, '🙏', '2026-01-30 04:04:37', '2026-01-30 04:04:37'),
(13, 'b55ad616-dc4e-4842-aff1-9105c8edb5fd', 27, '🙏', '2026-01-30 04:11:36', '2026-01-30 04:11:36'),
(14, '497b1456-5469-4ba4-a2e0-fb8f2be36fa7', 27, '🙏', '2026-01-30 04:11:42', '2026-01-30 04:11:42'),
(15, '94df57ca-5170-4706-b887-77e4be804d80', 29, '😢', '2026-01-30 04:54:11', '2026-01-30 04:54:11'),
(17, 'a3af77c7-f5b2-4d5b-b910-d4198dd3230b', 29, '❤️', '2026-01-30 04:55:02', '2026-01-30 04:55:02'),
(19, '95feed4c-bb3d-406e-bbe4-a25711dc5211', 29, '😢', '2026-01-30 04:56:29', '2026-01-30 04:56:29'),
(22, '9f3c09f0-1b1e-4a89-9589-b53cbd146802', 27, '🙏', '2026-01-30 20:27:40', '2026-01-30 20:27:40'),
(24, 'bb359767-ea69-4281-a982-a9aa51876dbd', 27, '❤️', '2026-01-30 20:29:32', '2026-01-30 20:29:32'),
(26, '55f94424-ad77-4620-8b13-ba2bd1fa6366', 27, '🙏', '2026-01-30 20:57:03', '2026-01-30 20:57:03'),
(27, '79db810c-91f8-46e3-9ebf-ab1952a19ab6', 29, '😂', '2026-01-31 01:17:36', '2026-01-31 01:17:36'),
(28, '1a0d5f71-340c-49f7-9d2e-ac53c4e3cfd6', 29, '👍', '2026-01-31 01:18:02', '2026-01-31 01:18:02'),
(29, '967fdfdf-270c-40d7-a74e-80b90479e262', 29, '😮', '2026-01-31 01:42:07', '2026-01-31 01:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `chat_files`
--

CREATE TABLE `chat_files` (
  `id` int(11) NOT NULL,
  `convo_id` varchar(200) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `file_url` varchar(210) NOT NULL,
  `file_name` varchar(210) NOT NULL,
  `file_type` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` int(11) NOT NULL,
  `room_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

CREATE TABLE `contributions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` int(11) NOT NULL,
  `family_member_id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `receipt_path` varchar(250) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'contribution',
  `payment_method` varchar(122) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=not deleted, 1=deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contributions`
--

INSERT INTO `contributions` (`id`, `family_owner_id`, `family_member_id`, `bill_id`, `receipt_path`, `amount`, `type`, `payment_method`, `note`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 5, '', 85.00, '0', '', 'Sunt totam Nam amet', 0, '2025-10-28 23:21:56', '2025-10-28 23:21:56'),
(2, 1, 3, 4, '', 76.00, '0', '', 'Qui laboriosam qui', 0, '2025-10-28 23:22:53', '2025-10-28 23:22:53'),
(3, 1, 3, 5, '1761688425dasdsad.png', 94.00, '1', '', 'Fugiat neque qui omn', 0, '2025-10-29 01:53:45', '2025-10-29 01:53:45'),
(4, 1, 2, 3, '1763155887shop_18985965.png', 12.00, '0', '', NULL, 0, '2025-11-15 02:31:27', '2025-11-15 02:31:27'),
(5, 27, 28, 8, '1764705972backpacking-on-a-budget-gear.jpg', 230.00, '0', '', NULL, 0, '2025-12-02 20:06:12', '2025-12-02 20:06:12'),
(6, 27, 29, 13, '1764788436backpacking-on-a-budget-gear.jpg', 250.00, '0', '', 'I am paying this bill half way', 0, '2025-12-03 19:00:36', '2025-12-03 19:00:36'),
(7, 27, 29, 14, '1764802090backpacking-on-a-budget-gear.jpg', 150.00, '1', '', 'Eye Dr', 0, '2025-12-03 22:48:10', '2025-12-03 22:48:10'),
(8, 27, 29, 15, '1764803145backpacking-on-a-budget-gear.jpg', 99.00, '0', '', 'Groceries', 0, '2025-12-03 23:05:45', '2025-12-03 23:05:45'),
(9, 27, 28, 16, '1764888178Picture4.png', 300.00, '1', '', NULL, 0, '2025-12-04 22:42:58', '2025-12-04 22:42:58'),
(10, 27, 29, 17, '1764888455Picture4.png', 1000.00, '1', '', NULL, 0, '2025-12-04 22:47:35', '2025-12-04 22:47:35'),
(11, 27, 28, 18, '1764888835Picture4.png', 500.00, '0', '', 'ds', 0, '2025-12-04 22:53:55', '2025-12-04 22:53:55'),
(12, 27, 35, 16, '1767120516Picture6.png', 13.00, '1', '', 'Dolor laboris eiusmo', 0, '2025-12-30 18:48:36', '2025-12-30 18:48:36'),
(13, 27, 29, 14, '1767140563Picture6.png', 64.00, 'Contribution', '', 'Laboriosam id reici', 0, '2025-12-31 00:22:43', '2025-12-31 00:22:43'),
(14, 27, 29, 18, '1767140592Picture6.png', 64.00, 'Contribution', '', 'Laboriosam id reici', 0, '2025-12-31 00:23:12', '2025-12-31 00:23:12'),
(15, 27, 29, 15, '1767141542Picture5.png', 28.00, 'Contribution', 'other', 'Iste dolorem incidun', 0, '2025-12-31 00:39:02', '2025-12-31 00:39:02'),
(16, 27, 29, 18, '1767141573Picture6.png', 81.00, 'Shortfall', 'cashapp', 'Commodi est non itaq', 0, '2025-12-31 00:39:33', '2025-12-31 00:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `document_requests`
--

CREATE TABLE `document_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `target_user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  `status` enum('pending','submitted','expired','cancelled') NOT NULL DEFAULT 'pending',
  `document_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0=normal doc, 1=medical, 2=insurance, 3=emegency',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_requests`
--

INSERT INTO `document_requests` (`id`, `family_owner_id`, `requester_id`, `target_user_id`, `title`, `message`, `expires_at`, `status`, `document_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 'Natus cupidatat cons', 'Voluptatem qui vero', '2025-11-01 12:53:00', 'pending', NULL, 1, '2025-10-29 21:32:00', '2025-10-29 21:32:00'),
(2, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 09:38:13', 'pending', NULL, 0, '2025-10-29 21:33:13', '2025-10-29 21:33:13'),
(3, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 09:38:28', 'pending', NULL, 0, '2025-10-29 21:33:28', '2025-10-29 21:33:28'),
(4, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:07:16', 'pending', NULL, 0, '2025-10-29 22:02:16', '2025-10-29 22:02:16'),
(5, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:08:02', 'pending', NULL, 0, '2025-10-29 22:03:02', '2025-10-29 22:03:02'),
(6, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:08:21', 'pending', NULL, 0, '2025-10-29 22:03:21', '2025-10-29 22:03:21'),
(7, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:08:43', 'pending', NULL, 0, '2025-10-29 22:03:43', '2025-10-29 22:03:43'),
(8, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:09:04', 'expired', NULL, 0, '2025-10-29 22:04:04', '2025-11-04 21:03:35'),
(9, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:09:36', 'pending', NULL, 0, '2025-10-29 22:04:36', '2025-10-29 22:04:36'),
(10, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:09:50', 'pending', NULL, 0, '2025-10-29 22:04:50', '2025-10-29 22:04:50'),
(11, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:11:07', 'pending', NULL, 0, '2025-10-29 22:06:07', '2025-10-29 22:06:07'),
(12, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:12:08', 'pending', NULL, 0, '2025-10-29 22:07:08', '2025-10-29 22:07:08'),
(13, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:14:48', 'pending', NULL, 0, '2025-10-29 22:09:48', '2025-10-29 22:09:48'),
(14, 1, 1, 10, 'Occaecat architecto', 'Consequatur fugit i', '2025-11-04 10:15:49', 'expired', NULL, 0, '2025-10-29 22:10:49', '2025-11-04 19:29:15'),
(15, 1, 1, 13, '12', NULL, '2025-11-04 17:03:28', 'pending', NULL, 0, '2025-11-04 21:03:28', '2025-11-04 21:03:28'),
(16, 1, 1, 12, 'q3q', NULL, '2025-11-04 18:54:23', 'pending', NULL, 1, '2025-11-04 22:54:23', '2025-11-04 22:54:23'),
(17, 27, 27, 30, 'Health Insurance Documentation', 'Please upload all the documents for the Insurance claim', '2025-11-26 00:24:38', 'submitted', 2, 2, '2025-11-26 00:24:38', '2025-11-26 00:25:24'),
(18, 27, 27, 28, 'Insurance doc', NULL, '2025-12-02 15:07:10', 'submitted', 3, 2, '2025-12-02 19:52:10', '2025-12-02 19:54:44'),
(19, 27, 27, 28, 'Blood work reports', NULL, '2025-12-03 19:30:42', 'submitted', 4, 1, '2025-12-03 22:30:42', '2025-12-03 22:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `document_responses`
--

CREATE TABLE `document_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_id` bigint(20) UNSIGNED NOT NULL,
  `uploader_id` bigint(20) UNSIGNED NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `disk_path` varchar(255) NOT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_documents`
--

CREATE TABLE `emergency_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uploader_id` int(11) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `disk_path` varchar(255) NOT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergency_documents`
--

INSERT INTO `emergency_documents` (`id`, `uploader_id`, `original_name`, `disk_path`, `mime`, `size`, `is_private`, `created_at`, `updated_at`) VALUES
(2, 30, 'Angie kelli ref.PNG', 'emergency_documents/Dhb3FxFVPxKMFF0AJXrutefIszCDfArEZ8DX0JO5.png', 'image/png', 45954, 1, '2025-11-26 00:25:24', '2025-11-26 00:25:24'),
(3, 28, 'Bridge Linq360.docx', 'emergency_documents/MYNCDO5ZVH6OBYWjokdhYtuktWZpALnXHjUikz7H.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 18226, 1, '2025-12-02 19:54:44', '2025-12-02 19:54:44'),
(4, 28, 'backpacking-on-a-budget-gear.jpg', 'emergency_documents/dYPGH1L30LptQDRkSEuMLu1VFllVp37FfPrieArp.jpg', 'image/jpeg', 30925, 1, '2025-12-03 22:39:04', '2025-12-03 22:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('vacation','outing') NOT NULL DEFAULT 'outing',
  `agenda` varchar(500) NOT NULL,
  `cover_image` varchar(210) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `type`, `agenda`, `cover_image`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(11, 'vacation', 'Sunt ea velit aliqui', '1761238896_dasdsad.png', 'Optio doloribus sin', '2020-04-20', '2026-03-18', '2025-10-23 21:01:36', '2025-10-23 21:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `event_comments`
--

CREATE TABLE `event_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_comments`
--

INSERT INTO `event_comments` (`id`, `event_id`, `family_owner_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 10, 9, 'fggf', '2025-10-23 03:25:19', '2025-10-23 03:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `event_senior`
--

CREATE TABLE `event_senior` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `senior_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_senior`
--

INSERT INTO `event_senior` (`id`, `owner_id`, `event_id`, `senior_id`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 3, '2025-10-23 03:15:14', '2025-10-23 03:15:14'),
(2, 1, 10, 3, '2025-10-23 03:15:32', '2025-10-23 03:15:32'),
(3, 1, 11, 3, '2025-10-23 21:01:36', '2025-10-23 21:01:36'),
(4, 1, 11, 10, '2025-10-23 22:54:15', '2025-10-23 22:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_notes`
--

CREATE TABLE `family_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` int(11) NOT NULL,
  `family_member_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` enum('note','feedback') NOT NULL DEFAULT 'note',
  `visibility` enum('private','family') NOT NULL DEFAULT 'family',
  `priority` enum('High','Medium','Low') NOT NULL DEFAULT 'Medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `family_notes`
--

INSERT INTO `family_notes` (`id`, `family_owner_id`, `family_member_id`, `title`, `content`, `type`, `visibility`, `priority`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'Quae suscipit sunt t', 'Officia amet nemo s', 'note', 'private', 'Medium', '2025-10-08 06:05:53', '2025-10-08 06:05:53'),
(3, 27, 27, 'Dec 5th', 'Activities fulfilled', 'note', 'private', 'Medium', '2025-12-02 19:50:51', '2025-12-02 19:50:51'),
(4, 27, 27, 'Appointment successful', 'Appointment successful', 'feedback', 'private', 'Medium', '2025-12-03 22:22:15', '2025-12-29 22:32:17'),
(5, 27, 27, 'In et amet atque eo', 'Aut sit nihil volup', 'feedback', 'private', 'Medium', '2025-12-29 22:17:18', '2025-12-29 22:32:04'),
(6, 27, 27, '445646', 'Ducimus doloribus i', 'feedback', 'family', 'Medium', '2025-12-29 22:17:50', '2025-12-29 22:33:45'),
(7, 27, 29, 'Earum id aliqua Et', 'Et fugit laboris op', 'note', 'private', 'Medium', '2025-12-30 01:00:43', '2025-12-30 01:00:43'),
(8, 27, 29, 'Officia unde alias e', 'Et temporibus ducimu', 'feedback', 'private', 'Medium', '2025-12-30 01:01:28', '2025-12-30 01:01:28'),
(9, 27, 29, 'Quos sunt odio quas', 'Quasi enim ducimus', 'note', 'private', 'Low', '2025-12-30 01:02:14', '2025-12-30 01:02:14');

-- --------------------------------------------------------

--
-- Table structure for table `family_owners`
--

CREATE TABLE `family_owners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `plan` enum('standard','family_plus') NOT NULL DEFAULT 'standard',
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `primary_senior_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `bank_doc_id` int(11) NOT NULL,
  `file_path` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `bank_doc_id`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 17, 'banking_documents/Fv13ubvmSA6TNoOkB4CH7icbrKRi3ZhMtVQzyPho.png', '2026-01-02 17:13:08', '2026-01-02 22:13:08'),
(2, 18, 'banking_documents/iQ2RiavyIzSOVtot4QKshXK8t8ZbOTzYx5h6UsC3.jpg', '2026-01-02 17:14:03', '2026-01-02 22:14:03'),
(3, 18, 'banking_documents/JoDKxQPovkaVdC24ntqTvrrbSLwIMr4ShPFUs9hk.png', '2026-01-02 17:14:03', '2026-01-02 22:14:03'),
(4, 18, 'banking_documents/IBMBPqe5txYcmpYEyCYaFX5Q0OnKOcPmADZbAE5f.png', '2026-01-02 17:14:03', '2026-01-02 22:14:03'),
(5, 19, 'banking_documents/P8FEJzdQSObyqMkxDzgSNXIcWE6Xr82iSs7c7khT.jpg', '2026-01-02 17:22:50', '2026-01-02 22:22:50'),
(6, 19, 'banking_documents/1SKr500qxVCZt4TPk8cL6cMU6Q3oaKypDKLPqtrG.png', '2026-01-02 17:22:50', '2026-01-02 22:22:50'),
(7, 19, 'banking_documents/4T3gv9cFxLY5B0HLefOGcHbOQ4sT7UIxCq4N8UVv.png', '2026-01-02 17:22:50', '2026-01-02 22:22:50'),
(8, 19, 'banking_documents/JuFm0Fk6T9B8N6SFrF28BenkPle3Pp4d75PH3jhx.png', '2026-01-02 17:22:50', '2026-01-02 22:22:50'),
(9, 20, 'banking_documents/TXFLmvEsrr75DcqgUhKQV547BXB4GvlCTWIKNl9r.png', '2026-01-02 17:23:58', '2026-01-02 22:23:58'),
(10, 20, 'banking_documents/phZfHIZbIL48eqkHAMEH9DpclxhDgxMAxlegfaiY.png', '2026-01-02 17:23:58', '2026-01-02 22:23:58'),
(11, 20, 'banking_documents/qn1urg4A5jYVm6CYMqngqWhCVp1k037AamI8RiFc.png', '2026-01-02 17:23:58', '2026-01-02 22:23:58'),
(12, 21, 'banking_documents/7yQp7rkp19WezikznAYSBUvVGarpLisgtMGZbZsJ.jpg', '2026-01-02 17:33:41', '2026-01-02 22:33:41'),
(13, 21, 'banking_documents/k0eD3ashTB6RvKoeMdfbpKQYM4AwGPO9wxohSlfV.png', '2026-01-02 17:33:41', '2026-01-02 22:33:41'),
(14, 21, 'banking_documents/WHZj3rbJ1x7B4gK5tl9vEZdT9WEUDgMweSNOijkJ.png', '2026-01-02 17:33:41', '2026-01-02 22:33:41'),
(15, 21, 'banking_documents/syGGDwmrKPZk5RpqFjCZ9mUk5gSRcjFN5fw0AhKc.png', '2026-01-02 17:33:41', '2026-01-02 22:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"fcbb0391-0887-4b1b-b396-1dd91f03850f\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"ef10f3e4-d148-4d1c-9465-00f2fb1fe355\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769647902,\"delay\":null}', 0, NULL, 1769647902, 1769647902),
(2, 'default', '{\"uuid\":\"a6a0bf8b-b67e-416c-9b3c-cae1be7359ee\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"8dd2e94f-f98f-4ac1-8165-703277ea0840\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769648958,\"delay\":null}', 0, NULL, 1769648958, 1769648958),
(3, 'default', '{\"uuid\":\"56400b91-7e20-4015-89a5-6f01c5f706cd\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"8639abfb-ea44-4141-a16f-1129e7cace10\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769648976,\"delay\":null}', 0, NULL, 1769648976, 1769648976),
(4, 'default', '{\"uuid\":\"f80c19fe-9cb5-4b7b-937b-d1876591d296\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"ac451cc2-5209-4f87-a0ef-3241e9a75805\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769649260,\"delay\":null}', 0, NULL, 1769649260, 1769649260),
(5, 'default', '{\"uuid\":\"d171e87a-6f6f-41c9-9608-3f525a09cd4e\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"915a63b7-14c2-43f4-8272-4fc2fa209953\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769649751,\"delay\":null}', 0, NULL, 1769649751, 1769649751),
(6, 'default', '{\"uuid\":\"6528920f-bba8-4d2d-b586-d582ca31233b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"9cfdbe3c-ddef-482f-a4a1-9a52931c14f8\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769649986,\"delay\":null}', 0, NULL, 1769649986, 1769649986),
(7, 'default', '{\"uuid\":\"d5439c4f-8781-4a4c-933d-effc642547f5\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"21cfd091-919e-4ad6-b306-3289cbe80178\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650292,\"delay\":null}', 0, NULL, 1769650292, 1769650292),
(8, 'default', '{\"uuid\":\"9a2068d9-3517-4723-ad63-08664abca25a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"bd010d96-ac4e-460a-b40b-a3b940b0506a\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650298,\"delay\":null}', 0, NULL, 1769650298, 1769650298),
(9, 'default', '{\"uuid\":\"6a1c3a11-4230-45be-8fea-6e9b5973a879\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"302a63f1-5af2-43af-9517-33014dda8eb7\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650415,\"delay\":null}', 0, NULL, 1769650415, 1769650415),
(10, 'default', '{\"uuid\":\"75679309-70cb-4851-a981-34c0aa675398\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"5ac611d0-83f7-40ad-8785-1a8af779bdcc\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650420,\"delay\":null}', 0, NULL, 1769650420, 1769650420),
(11, 'default', '{\"uuid\":\"5e566d75-69af-4825-939d-ae15b57c8e4a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e4a5da2a-03f0-463a-8dd6-18c66cfb1968\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650482,\"delay\":null}', 0, NULL, 1769650482, 1769650482),
(12, 'default', '{\"uuid\":\"8efbd3ce-7490-4ffa-a05a-073718e1a500\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"7b6908f4-0d20-462d-b7c5-971203b29afe\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650610,\"delay\":null}', 0, NULL, 1769650610, 1769650610),
(13, 'default', '{\"uuid\":\"a96357d5-e01b-4100-a423-0791e2c5cfd1\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"7d369ce3-0b92-4be5-8f59-dc93810a0cb2\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650804,\"delay\":null}', 0, NULL, 1769650804, 1769650804),
(14, 'default', '{\"uuid\":\"f8f3ce23-6fb4-4944-8f5a-dac16ac2cf89\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"fbabf53d-932d-48df-b75a-9ec0df88e5a1\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650865,\"delay\":null}', 0, NULL, 1769650865, 1769650865),
(15, 'default', '{\"uuid\":\"632abf37-6e4b-4184-aa84-bba6b19ee042\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"2330e6a4-6634-4760-ac73-221d35cd5a16\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650922,\"delay\":null}', 0, NULL, 1769650922, 1769650922),
(16, 'default', '{\"uuid\":\"e09d9028-5127-43ef-b90b-d0bcb6ca0f02\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"64f6bf4e-a0c6-486a-be6f-7000b515d65c\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650925,\"delay\":null}', 0, NULL, 1769650925, 1769650925),
(17, 'default', '{\"uuid\":\"f7d329d5-09b9-4438-abb9-de39e0c11bc1\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"64417dc1-9c0e-4605-9b44-c359e97d8691\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650964,\"delay\":null}', 0, NULL, 1769650964, 1769650964),
(18, 'default', '{\"uuid\":\"88db7cf6-65ab-47ce-9f88-402a1686c60d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"ab5728bd-7e3b-4238-8e2d-7a1e3a22fad2\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769650990,\"delay\":null}', 0, NULL, 1769650990, 1769650990),
(19, 'default', '{\"uuid\":\"e265c309-5b92-4902-b21b-75b5797a9155\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"8502faaf-eab3-4be5-bd2c-7715a0fe922b\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769651281,\"delay\":null}', 0, NULL, 1769651281, 1769651281),
(20, 'default', '{\"uuid\":\"5bc2fa87-12f2-401f-9aa6-b44a48cb2d5d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"73236cc9-445c-4866-9d54-8da89c39c251\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769651290,\"delay\":null}', 0, NULL, 1769651290, 1769651290),
(21, 'default', '{\"uuid\":\"ed511527-e47c-411d-9a88-0f48dbeb8fd5\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"d47f5960-2ab3-4db2-9890-94242f8609d1\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769651297,\"delay\":null}', 0, NULL, 1769651297, 1769651297),
(22, 'default', '{\"uuid\":\"4cf3b8ca-9573-4ae8-81f1-8fec2e898854\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"467f378a-ef1c-4222-bdcc-0fec28fe1da5\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769651440,\"delay\":null}', 0, NULL, 1769651440, 1769651440),
(23, 'default', '{\"uuid\":\"6896d6d3-c111-4804-b6d8-240fdc02b48e\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"f9ff8b93-f125-4af8-b8aa-b2cf1c870625\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769651458,\"delay\":null}', 0, NULL, 1769651458, 1769651458),
(24, 'default', '{\"uuid\":\"b7eba2ba-ba64-4ed2-b35e-1986b377db00\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"fe9cb9b3-29bf-4623-b984-e76a9ff161f9\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769652029,\"delay\":null}', 0, NULL, 1769652029, 1769652029),
(25, 'default', '{\"uuid\":\"54e616d7-8205-4535-a07c-579ace87667c\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e9be174f-28c9-494f-a4a4-4ead4ca6d44f\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769652054,\"delay\":null}', 0, NULL, 1769652054, 1769652054),
(26, 'default', '{\"uuid\":\"9ec54e04-7759-482b-9d49-ed548df3357b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"4690de8d-cf7f-42a5-a4be-c5218f263969\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769727813,\"delay\":null}', 0, NULL, 1769727813, 1769727813),
(27, 'default', '{\"uuid\":\"a0bf3c9b-b7da-436b-ad80-73462cf30700\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"57f8d082-4d1b-484c-8e81-9b33fe44a881\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769727913,\"delay\":null}', 0, NULL, 1769727913, 1769727913),
(28, 'default', '{\"uuid\":\"a0365efa-d228-44ae-81a1-50879d99b0d9\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e4acd2b2-4f18-4433-acc2-6791ea2a13a8\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769730929,\"delay\":null}', 0, NULL, 1769730929, 1769730929),
(29, 'default', '{\"uuid\":\"61f34e8b-3cd2-4627-b359-c37bffa2d37d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"886d032c-88d5-4a54-b3a6-895a06650955\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769730944,\"delay\":null}', 0, NULL, 1769730944, 1769730944),
(30, 'default', '{\"uuid\":\"d31eedd6-34c7-4ba4-9925-89f5f16348ef\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"f372450c-85dc-4687-96d7-9d3521647653\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769730983,\"delay\":null}', 0, NULL, 1769730983, 1769730983),
(31, 'default', '{\"uuid\":\"d3eae696-30f3-4c19-b359-c4799e12ebff\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"ab57d567-3ce2-4f18-a742-f4a34a2827da\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769732636,\"delay\":null}', 0, NULL, 1769732636, 1769732636),
(32, 'default', '{\"uuid\":\"d78ef60e-171a-4165-a0a1-9153a4bbda61\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"97c34bad-dd84-4d6e-8250-70fb072bf0f8\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769732796,\"delay\":null}', 0, NULL, 1769732796, 1769732796),
(33, 'default', '{\"uuid\":\"222aacc4-6cdf-46f2-b0fb-8db01f7f7483\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"d8ca002c-719b-40d0-a424-95d2a6ebeb17\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769732895,\"delay\":null}', 0, NULL, 1769732895, 1769732895),
(34, 'default', '{\"uuid\":\"065e0d03-7880-4a2a-a709-ef716b1afd06\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"07c30f9a-6cde-47fc-b50e-1be606d4762e\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769732945,\"delay\":null}', 0, NULL, 1769732945, 1769732945),
(35, 'default', '{\"uuid\":\"a23218e7-bb2b-448d-bd80-6418a482a298\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"9a53e210-8456-4530-92a1-1b44a5dbddc5\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733061,\"delay\":null}', 0, NULL, 1769733061, 1769733061);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(36, 'default', '{\"uuid\":\"10555980-f850-4aa9-98f8-76383978163a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"a82700f3-5890-4388-ac98-53b1d759a915\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733153,\"delay\":null}', 0, NULL, 1769733153, 1769733153),
(37, 'default', '{\"uuid\":\"b90d7e90-2dc3-40b0-a616-327489f5fda9\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"4ceb06bd-d4ca-4474-ad68-fee1dad0062f\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733294,\"delay\":null}', 0, NULL, 1769733294, 1769733294),
(38, 'default', '{\"uuid\":\"e2e294b4-f630-4772-b4a5-84c20f1a0db7\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"ee9568e1-54a1-4519-8062-9c031d3d6dd8\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733415,\"delay\":null}', 0, NULL, 1769733415, 1769733415),
(39, 'default', '{\"uuid\":\"a1ab1360-0dfd-422d-978f-42dde74b024a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"497b1456-5469-4ba4-a2e0-fb8f2be36fa7\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733549,\"delay\":null}', 0, NULL, 1769733549, 1769733549),
(40, 'default', '{\"uuid\":\"be91907d-c2eb-476f-8d82-01a8908322b8\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"358d28c3-068b-44eb-8a06-03e9fc4ffd7b\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769733701,\"delay\":null}', 0, NULL, 1769733701, 1769733701),
(41, 'default', '{\"uuid\":\"2d1d5865-33a0-4b67-b107-4a4a46ad089d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"b55ad616-dc4e-4842-aff1-9105c8edb5fd\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769735083,\"delay\":null}', 0, NULL, 1769735083, 1769735083),
(42, 'default', '{\"uuid\":\"e1b55a18-c4a6-4833-99fd-45fb9a9da265\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"6bdff157-45ff-4b7e-ae30-8b117bf98f90\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769735379,\"delay\":null}', 0, NULL, 1769735379, 1769735379),
(43, 'default', '{\"uuid\":\"e00cddd1-45f9-4a55-93f3-7971732b6f74\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"f3c986bd-b040-4e12-97d0-e596fd9f0ef1\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"socket\\\";s:14:\\\"74749.21562972\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769737815,\"delay\":null}', 0, NULL, 1769737815, 1769737815),
(44, 'default', '{\"uuid\":\"977f5b33-ecf8-40ac-a109-5e3552cfe41a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"5d034397-bea3-41cc-9bbc-ac4e73c066ad\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"socket\\\";s:14:\\\"74736.21190169\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769737905,\"delay\":null}', 0, NULL, 1769737905, 1769737905),
(45, 'default', '{\"uuid\":\"ade9d04f-545c-4fbb-9f2e-af1e63ee984f\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"9f3c09f0-1b1e-4a89-9589-b53cbd146802\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"socket\\\";s:14:\\\"74749.21562972\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769737909,\"delay\":null}', 0, NULL, 1769737909, 1769737909),
(46, 'default', '{\"uuid\":\"78184a17-53f9-474d-b756-aea4ee4bb21b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"94df57ca-5170-4706-b887-77e4be804d80\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"socket\\\";s:13:\\\"74900.3090464\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769737938,\"delay\":null}', 0, NULL, 1769737938, 1769737938),
(47, 'default', '{\"uuid\":\"315ac862-af8f-4e5b-8058-d62e447661b6\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":2:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"0d602819-a89b-4772-b69f-f6828cbcaeda\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"socket\\\";s:13:\\\"74900.3090464\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769737944,\"delay\":null}', 0, NULL, 1769737944, 1769737944),
(48, 'default', '{\"uuid\":\"9fa61439-9bb0-4809-af2e-71c40c2dc142\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"a3af77c7-f5b2-4d5b-b910-d4198dd3230b\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769738055,\"delay\":null}', 0, NULL, 1769738055, 1769738055),
(49, 'default', '{\"uuid\":\"8c08c9e1-4def-4635-ab18-8e5409927e1d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"bb359767-ea69-4281-a982-a9aa51876dbd\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769738080,\"delay\":null}', 0, NULL, 1769738080, 1769738080),
(50, 'default', '{\"uuid\":\"3a07721e-2e80-417e-a6ac-60acbe192e37\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"95feed4c-bb3d-406e-bbe4-a25711dc5211\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769738113,\"delay\":null}', 0, NULL, 1769738113, 1769738113),
(51, 'default', '{\"uuid\":\"3145472d-bc97-4b47-b57c-2046603f0bc5\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e7499f8b-96dd-484b-8178-5984aa79a129\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769794142,\"delay\":null}', 0, NULL, 1769794142, 1769794142),
(52, 'default', '{\"uuid\":\"6765cacf-80f1-42b1-86fb-59a7bb9765a3\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"55f94424-ad77-4620-8b13-ba2bd1fa6366\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769794156,\"delay\":null}', 0, NULL, 1769794156, 1769794156),
(53, 'default', '{\"uuid\":\"2659f35d-3770-4604-8e49-6612da9ed5b4\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"d3c0a448-8b68-48dd-b669-5daf483cd8cf\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769795087,\"delay\":null}', 0, NULL, 1769795087, 1769795087),
(54, 'default', '{\"uuid\":\"f4351f6b-5188-414b-a3ff-0609741b1a4c\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"1b5dec55-573a-4f3b-888b-c5e84900c5de\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769795318,\"delay\":null}', 0, NULL, 1769795318, 1769795318),
(55, 'default', '{\"uuid\":\"9d7e940f-b6b6-4483-98b8-83713cb95aa8\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"a7138797-2c1d-422c-a588-92a17c06a3ae\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769795830,\"delay\":null}', 0, NULL, 1769795830, 1769795830),
(56, 'default', '{\"uuid\":\"d1a540b2-1ac0-48a2-9cb2-4e7d9c73dd56\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"cac6677a-2a11-43c9-bff1-c1e84b23764f\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769795852,\"delay\":null}', 0, NULL, 1769795852, 1769795852),
(57, 'default', '{\"uuid\":\"4a9af784-c9d3-4a94-b329-b6077397cb84\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"c4f02f96-a3f4-48f5-ad38-882e861250ae\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796078,\"delay\":null}', 0, NULL, 1769796078, 1769796078),
(58, 'default', '{\"uuid\":\"447eb134-4fd9-47b0-af1b-4d0c832f3ed0\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"63e5658e-40fb-41f9-97d4-4a527315365e\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796110,\"delay\":null}', 0, NULL, 1769796110, 1769796110),
(59, 'default', '{\"uuid\":\"89b50be1-86e4-48a9-a8aa-b72d807ffc7e\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"02056877-0315-4d10-b23f-76ce8528b207\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796174,\"delay\":null}', 0, NULL, 1769796174, 1769796174),
(60, 'default', '{\"uuid\":\"c87b5069-2055-4207-9909-5c39367e1a34\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"1caf226c-8179-4159-9ad3-31ed70245efe\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796178,\"delay\":null}', 0, NULL, 1769796178, 1769796178),
(61, 'default', '{\"uuid\":\"86c17d31-88e0-4c00-90b7-e552a06f4782\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"46fef457-54ce-42f6-9226-af49e6929e05\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796232,\"delay\":null}', 0, NULL, 1769796232, 1769796232),
(62, 'default', '{\"uuid\":\"7605a9e3-7678-437d-95c7-713a7205d152\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e557c4a5-535e-41b3-8cf8-93cd001a38c2\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796234,\"delay\":null}', 0, NULL, 1769796234, 1769796234),
(63, 'default', '{\"uuid\":\"e660a0ea-7d73-4338-9c76-5892e6ac1f27\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"e19b1178-d3e2-43c4-999e-b3af68d787cd\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796295,\"delay\":null}', 0, NULL, 1769796295, 1769796295),
(64, 'default', '{\"uuid\":\"e892a0c6-a6a0-4d34-b528-8750774e8c8c\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"549c927e-0c9b-41c6-93de-f21441fc2fb6\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769796309,\"delay\":null}', 0, NULL, 1769796309, 1769796309),
(65, 'default', '{\"uuid\":\"e5530daf-e8f6-40bb-a8e2-d3290eab7224\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"82456b30-e9e1-406c-9efe-5c7055036e71\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797166,\"delay\":null}', 0, NULL, 1769797166, 1769797166),
(66, 'default', '{\"uuid\":\"5f47f36f-c0ec-41b9-8473-cda491b959fa\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"0571bbeb-fd6c-4e3f-8069-eef5eca7b252\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797176,\"delay\":null}', 0, NULL, 1769797176, 1769797176),
(67, 'default', '{\"uuid\":\"288e52ee-2c61-48a8-87bc-fd68dbcc0961\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"05d2ea5e-0392-4712-b349-355046209240\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797196,\"delay\":null}', 0, NULL, 1769797196, 1769797196),
(68, 'default', '{\"uuid\":\"ab3bd72d-703c-4dff-99e6-efe038258381\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"f33f1b13-a71f-4705-812a-70568310e39c\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797315,\"delay\":null}', 0, NULL, 1769797315, 1769797315),
(69, 'default', '{\"uuid\":\"d008adef-dcd9-4e63-9553-f4937c7188d2\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"5744bcdf-00c0-4c60-bd79-a6ff7f5bf608\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797323,\"delay\":null}', 0, NULL, 1769797323, 1769797323),
(70, 'default', '{\"uuid\":\"8348a29e-5c0c-4104-83bf-d8a1a986d10a\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"da74775f-0d9d-4cea-8a86-74ab4d75c794\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797341,\"delay\":null}', 0, NULL, 1769797341, 1769797341);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(71, 'default', '{\"uuid\":\"9af8e8a4-074e-4ad0-8c3a-75428a1fcda3\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"658a22d7-674d-4277-b0e2-b1bbe35c4450\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797355,\"delay\":null}', 0, NULL, 1769797355, 1769797355),
(72, 'default', '{\"uuid\":\"230bac5d-2f00-4d32-b280-200ab1b9261b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"67106815-a981-42f9-8ed4-a210c1c1b5f3\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797657,\"delay\":null}', 0, NULL, 1769797657, 1769797657),
(73, 'default', '{\"uuid\":\"2a6d86b0-ac56-4ec0-9b9c-2f99536f07ae\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"d1a94ecf-67ba-4244-afd4-eb60eae8d6e7\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769797705,\"delay\":null}', 0, NULL, 1769797705, 1769797705),
(74, 'default', '{\"uuid\":\"f03e0bb6-6d24-4f19-8941-feacd45b715c\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"25d26b47-d41b-4e9c-8dfe-86fe1ce18d43\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769798637,\"delay\":null}', 0, NULL, 1769798637, 1769798637),
(75, 'default', '{\"uuid\":\"955ed163-775b-4fce-b369-84a9210dadd3\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"79db810c-91f8-46e3-9ebf-ab1952a19ab6\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769798649,\"delay\":null}', 0, NULL, 1769798649, 1769798649),
(76, 'default', '{\"uuid\":\"18da1d27-72f9-4ead-a83b-17a7413da3cd\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"8b12d51e-c921-400b-abf3-0eda941ca084\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769799828,\"delay\":null}', 0, NULL, 1769799828, 1769799828),
(77, 'default', '{\"uuid\":\"61832491-f1e6-4e55-8a9d-5b0d1b747836\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"790f60c6-e6ef-4b08-a497-ad84293a055b\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769799837,\"delay\":null}', 0, NULL, 1769799837, 1769799837),
(78, 'default', '{\"uuid\":\"9a052db7-2a9a-4bdb-86ce-f1744ca260fe\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"0a7f9107-e01d-45f5-8d0f-847b52d63770\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769799953,\"delay\":null}', 0, NULL, 1769799953, 1769799953),
(79, 'default', '{\"uuid\":\"7551f711-3e53-45cc-86cf-3e66f6bca48d\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"b7cd2dd7-2ce7-4589-b406-7f3d1e590da1\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769799976,\"delay\":null}', 0, NULL, 1769799976, 1769799976),
(80, 'default', '{\"uuid\":\"f71b3061-9053-4bd6-a843-6e01f898ba18\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"895400f4-f319-4946-b07a-6b5e12bea45e\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769800076,\"delay\":null}', 0, NULL, 1769800076, 1769800076),
(81, 'default', '{\"uuid\":\"7e11b39b-e872-4e1c-9064-f9a2cae5cc4f\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"1a0d5f71-340c-49f7-9d2e-ac53c4e3cfd6\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769800265,\"delay\":null}', 0, NULL, 1769800265, 1769800265),
(82, 'default', '{\"uuid\":\"60b22e5e-89d2-4424-b90f-7df150b89a0f\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"39524021-0d5d-4358-b732-ace78c449ad7\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769800482,\"delay\":null}', 0, NULL, 1769800482, 1769800482),
(83, 'default', '{\"uuid\":\"9cdfbd1b-0d03-40ec-a44b-4a03dc5b701e\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"629ff755-2d7a-48d6-b312-75ee01fb0d56\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769800488,\"delay\":null}', 0, NULL, 1769800488, 1769800488),
(84, 'default', '{\"uuid\":\"32160d80-cd16-4dbd-9b8f-2615f52ef9aa\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"46aeca5e-4719-4845-ab9d-96b3857df0af\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769806284,\"delay\":null}', 0, NULL, 1769806284, 1769806284),
(85, 'default', '{\"uuid\":\"62ea496c-b6a8-4027-94cc-b6baee9b440b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"967fdfdf-270c-40d7-a74e-80b90479e262\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769806285,\"delay\":null}', 0, NULL, 1769806285, 1769806285),
(86, 'default', '{\"uuid\":\"459c6ed4-8026-47e1-ab7e-1f42f9dcbc4b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"41c0e4ec-3850-44d2-a300-4e1fdf9c4f2a\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769811467,\"delay\":null}', 0, NULL, 1769811467, 1769811467),
(87, 'default', '{\"uuid\":\"4b0adb20-85ce-41ab-b5cc-d1a222764a3b\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"32e0db43-c36e-4229-992b-9e1ae6b02a0c\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769811505,\"delay\":null}', 0, NULL, 1769811505, 1769811505),
(88, 'default', '{\"uuid\":\"a9d0b54b-6f6b-4195-940a-9e5e12e1e037\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"06643684-216d-41b9-8ea9-af63f8d09eca\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769811533,\"delay\":null}', 0, NULL, 1769811533, 1769811533),
(89, 'default', '{\"uuid\":\"5098d6e9-f822-4e77-ac44-af1f20176897\",\"displayName\":\"ChatifyPro\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":17:{s:5:\\\"event\\\";O:29:\\\"ChatifyPro\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:25:\\\"ChatifyPro\\\\Models\\\\Message\\\";s:2:\\\"id\\\";s:36:\\\"5f393284-acca-4675-b52a-c41aa0aaa438\\\";s:9:\\\"relations\\\";a:2:{i:0;s:6:\\\"sender\\\";i:1;s:9:\\\"reactions\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";b:1;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"},\"createdAt\":1769815184,\"delay\":null}', 0, NULL, 1769815184, 1769815184);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `topic` varchar(255) NOT NULL,
  `agenda` text DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `duration` int(11) NOT NULL DEFAULT 30,
  `zoom_meeting_id` varchar(255) DEFAULT NULL,
  `join_url` text DEFAULT NULL,
  `start_url` text DEFAULT NULL,
  `status` enum('scheduled','cancelled','completed') NOT NULL DEFAULT 'scheduled',
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=deleted',
  `is_active` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `owner_id`, `created_by`, `topic`, `agenda`, `start_time`, `duration`, `zoom_meeting_id`, `join_url`, `start_url`, `status`, `is_deleted`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Quia exercitation pe', 'Et qui cumque occaec', '1993-02-11 05:28:00', 68, '95125025519', 'https://zoom.us/j/95125025519?pwd=1BjF9mqd4zKar3um0be0qXGaNMTAeY.1', 'https://zoom.us/s/95125025519?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5NTEyNTAyNTUxOSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjJhNmI2ZjRkMzQyYzRmODk5NzQ0M2Q0YWI0ZTE3MmI3Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc1OTQzMTI0MSwiaWF0IjoxNzU5NDI0MDQxLCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.PBEWqYG_h2YMi1-MFiLDTSpw-zn2bFwf3elwT-rvoXI', 'scheduled', 0, 1, '2025-10-02 23:54:01', '2025-10-28 21:11:09'),
(2, 2, 2, 'Quia exercitation pe', 'Et qui cumque occaec', '1993-02-11 05:28:00', 68, '97277642716', 'https://zoom.us/j/97277642716?pwd=NzbGQAYZSQ7ZFeVW9gHMUkUR0ZDtaK.1', 'https://zoom.us/s/97277642716?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5NzI3NzY0MjcxNiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImMyNWU0MzAwM2EwNTQzZDFhMzYwY2ZhMzAzOWIwMWQ1Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc1OTQzMTI3MywiaWF0IjoxNzU5NDI0MDczLCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.1qspue8Dkg6-yfRSzfq5vMWOZpPh-_VyygOmS6Fe3gU', 'completed', 0, 1, '2025-10-02 23:54:34', '2025-10-27 22:24:27'),
(3, 3, 3, 'In mollit repudianda', 'Nisi sint hic volup', '2017-05-12 22:03:00', 75, '91605783819', 'https://zoom.us/j/91605783819?pwd=pNREZRHd7Zapi7iYYygVoidOan13en.1', 'https://zoom.us/s/91605783819?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5MTYwNTc4MzgxOSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6Ijc2Yzk2MTQ1N2RmZTQyZWJhMjk3NTY1YmQ5NTc0YjNmIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MDU3NTY4NCwiaWF0IjoxNzYwNTY4NDg0LCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.w_2V6Hza6nzeAgEKx6VVRRFoTBKiHketb7rqUx0av38', 'scheduled', 0, 1, '2025-10-16 02:48:04', '2025-10-16 05:19:05'),
(4, 1, 3, 'Ad officiis doloribu', 'Doloribus architecto', '1990-04-27 08:05:00', 1, '94946912456', 'https://zoom.us/j/94946912456?pwd=HVjaavgaCixLNn5wva17UMb0iRyW7g.1', 'https://zoom.us/s/94946912456?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5NDk0NjkxMjQ1NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImY1MTY2NWJhOWQ1MTQ3Y2Q5ODdhMTQ3NjkzMmI5ZTBhIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MDU4NDc0NiwiaWF0IjoxNzYwNTc3NTQ2LCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.TaSQFt6u709HOXLLQwYABXsd-D-73np45AmuCZhqFfE', 'scheduled', 0, 0, '2025-10-16 05:19:06', '2025-10-16 05:19:49'),
(5, 1, 3, 'Corporis quas repell', 'Reprehenderit adipi', '2016-10-18 10:23:00', 79, '98973467273', 'https://zoom.us/j/98973467273?pwd=FMSDd5cRA0azrYepjRMKg3SlHKLj2p.1', 'https://zoom.us/s/98973467273?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5ODk3MzQ2NzI3MyIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjIyZmY0YTI0M2FhNDRkODQ4ODUwY2M4MDYyNDZhMjFhIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MDU4NDc4OSwiaWF0IjoxNzYwNTc3NTg5LCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.rDSvAIwbdhgjhboiFgZOwb2OIz-Nu3Qyg-pboXrGxdw', 'scheduled', 0, 0, '2025-10-16 05:19:49', '2025-10-28 21:10:59'),
(7, 1, 3, 'Ut et qui assumenda', 'Quia modi in nemo ea', '1994-01-19 23:11:00', 56, '98170432241', 'https://zoom.us/j/98170432241?pwd=DxPcialSSbAEZpluJJLMyh1i2524Lx.1', 'https://zoom.us/s/98170432241?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5ODE3MDQzMjI0MSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjdjMjBlOGU1N2YwMTRlOThhMWRmMjgxMWJkZTg1M2IxIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MTYxNjEwMSwiaWF0IjoxNzYxNjA4OTAxLCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.7DMbTs8QySLJkB4_yCKA69j94W6EKiXI_HEz3opzQlc', 'scheduled', 0, 0, '2025-10-28 03:48:21', '2025-11-03 22:55:59'),
(8, 1, 1, 'Sint ex quaerat aliq', 'Soluta reiciendis si', '1994-08-25 03:06:00', 29, '92781015271', 'https://zoom.us/j/92781015271?pwd=mqULNT3KXmar6cvyQq9HYKZrLczJUO.1', 'https://zoom.us/s/92781015271?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5Mjc4MTAxNTI3MSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjU0MzQ0YTgxZDUwNjQ4OWI4Njc1NTJlNDY4NDBiNTNhIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MjE5OTc1OSwiaWF0IjoxNzYyMTkyNTU5LCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.Zv0mF0wrvtPWgT4L5f8YaS7oLApqpFlpvcHk-ORMIQY', 'scheduled', 0, 0, '2025-11-03 22:55:59', '2025-11-03 22:56:46'),
(9, 1, 1, 'Sint ex quaerat aliq', 'Soluta reiciendis si', '1994-08-25 03:06:00', 29, '99295395376', 'https://zoom.us/j/99295395376?pwd=uqqRKf6cSmNQqh3wiweeik69tnGcc4.1', 'https://zoom.us/s/99295395376?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI5OTI5NTM5NTM3NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjZlZmZjYjZmZmNkMzQ4OTY4OGMzMmJmMTIyMWYyMDEwIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6ImF3MSIsImV4cCI6MTc2MjE5OTgwNiwiaWF0IjoxNzYyMTkyNjA2LCJhaWQiOiJJaGxmWndfYVRjbUpRWWhfRTZuNVVRIiwiY2lkIjoiIn0.k2WM_kAkUcpRo5pk-Jq9N4eYSLvCMBxjFEujGv6yEwk', 'scheduled', 0, 1, '2025-11-03 22:56:46', '2025-12-12 17:29:06'),
(10, 27, 27, 'Velit aspernatur vel', 'Duis quia adipisicin', '2025-09-18 17:18:00', 63, '72151885500', 'https://us04web.zoom.us/j/72151885500?pwd=gURthOURPk2QTnV55IUtbE2tN1kswm.1', 'https://us04web.zoom.us/s/72151885500?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MjE1MTg4NTUwMCIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImQ4NDFjMTk1Y2ZmMTQwMGU5ZjllNDIwZjQ4NTJlYjliIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjU1Njc3NDYsImlhdCI6MTc2NTU2MDU0NiwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.fkyWIkAg5CzZZeS0oOCIGuvUthIkvVBGXUaNxboWfd0', 'scheduled', 0, 1, '2025-12-12 17:29:06', '2025-12-13 01:19:37'),
(11, 33, 33, 'Amet commodo archit', 'Autem quam qui excep', '2025-12-20 21:10:00', 53, '79594969735', 'https://us04web.zoom.us/j/79594969735?pwd=Uxq2VvXe8Upwi1PGTT2aUhwagU8Sbe.1', 'https://us04web.zoom.us/s/79594969735?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3OTU5NDk2OTczNSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6Ijk2ODgxNjM1MTE2NDRhODhiYjExM2FhYjFlMGYxNDQ3Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjU1OTU5NzcsImlhdCI6MTc2NTU4ODc3NywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.okq-mOcOHLLC-naQ0_g5jxD0atuV3jIEphxuoRCgf1w', 'scheduled', 0, 1, '2025-12-13 01:19:37', '2025-12-26 21:08:09'),
(12, 27, 27, 'In rem officia exerc', 'Ex provident quibus', '2024-06-17 05:37:00', 95, '74946619781', 'https://us04web.zoom.us/j/74946619781?pwd=SDYj4AFkURaGqyQZJQ5Ve1A9HbaLCy.1', 'https://us04web.zoom.us/s/74946619781?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NDk0NjYxOTc4MSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImEwZmI5NWFmYTJkNTQxNTVhZTMwYWI3YjVjNGE4OTYwIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjY3OTA0ODksImlhdCI6MTc2Njc4MzI4OSwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.o4juIiKjSMgIo_H4TS46Q6_6-TaMMnSScKjpmRRus50', 'scheduled', 0, 1, '2025-12-26 21:08:09', '2025-12-29 19:17:48'),
(13, 27, 27, 'Magni commodo quos d', 'Necessitatibus volup', '2006-04-04 17:18:00', 19, '78165684504', 'https://us04web.zoom.us/j/78165684504?pwd=j413TgIp6IemGakqaApWb5mEf8hdXb.1', 'https://us04web.zoom.us/s/78165684504?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3ODE2NTY4NDUwNCIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjY0NGI0YmZlZDk5ODQ0ZDNiNzhhYThjOGM1N2UxODU2Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDMwNjgsImlhdCI6MTc2NzAzNTg2OCwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.IDmNsjRPxBeC67x07jn3llI4_yw1yMmUIp_-p0qTFT8', 'scheduled', 0, 1, '2025-12-29 19:17:48', '2025-12-29 19:19:43'),
(14, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '77202252112', 'https://us04web.zoom.us/j/77202252112?pwd=ymWpNWk5pAkzg9BEbkVt3ELcz9XEza.1', 'https://us04web.zoom.us/s/77202252112?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NzIwMjI1MjExMiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImI3ZDE3NzQxOTFhMzQ4MTA5YjUxMWExMWUxNTY1YjgzIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDMxODMsImlhdCI6MTc2NzAzNTk4MywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.SwsMbJB7MsZXZgIbYCYP8zX2O8yoyTFrDufMWpC_Fuo', 'scheduled', 0, 1, '2025-12-29 19:19:43', '2025-12-29 19:23:53'),
(15, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '75808988675', 'https://us04web.zoom.us/j/75808988675?pwd=OzszYiOcfzvsmaK9NW9cihGCjjjLFr.1', 'https://us04web.zoom.us/s/75808988675?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NTgwODk4ODY3NSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjcwNGE2NzJmYTY0ZTQxNTViM2Y3MDQwOWI1OTA1ZjU3Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM0MzMsImlhdCI6MTc2NzAzNjIzMywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.t80oQF48E6NNhsy0UxKiGhzzjoIwVFWNMduiwiu0eUQ', 'scheduled', 0, 1, '2025-12-29 19:23:53', '2025-12-29 19:24:21'),
(16, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '71283529176', 'https://us04web.zoom.us/j/71283529176?pwd=pALWUmsygFf9DwVw3Nslf5He629CPh.1', 'https://us04web.zoom.us/s/71283529176?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MTI4MzUyOTE3NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImMyZjUxOTVhMWY4NjQzOWY5NmQxMGI4ZTU4NTZmNGEyIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM0NjEsImlhdCI6MTc2NzAzNjI2MSwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.Il0yC4xsSVn1zMj0mu84bCxYHlRm_xW0GKCyh5OF2hM', 'scheduled', 0, 1, '2025-12-29 19:24:21', '2025-12-29 19:24:57'),
(17, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '76822181256', 'https://us04web.zoom.us/j/76822181256?pwd=4E4JhogMxJCsNIgGRx06ShQwAeXx2B.1', 'https://us04web.zoom.us/s/76822181256?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NjgyMjE4MTI1NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImI3Y2FlYjhhN2U1MzRlMjZiOThiOGM5MDljMTI4MjlhIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM0OTcsImlhdCI6MTc2NzAzNjI5NywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.7kbk8HyBiSAFuxMehpOtZcJoFoqJGYp6B0Gcl4g15lA', 'scheduled', 0, 1, '2025-12-29 19:24:57', '2025-12-29 19:25:16'),
(18, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '71749569624', 'https://us04web.zoom.us/j/71749569624?pwd=8YF0bBMVvP9GlfMs6KSaG3gREH1nrq.1', 'https://us04web.zoom.us/s/71749569624?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MTc0OTU2OTYyNCIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjA2N2YxZDQ3MmQ0NjQzNmM4YjgwMDkzNzUxM2ZiMGI4Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM1MTYsImlhdCI6MTc2NzAzNjMxNiwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.E6lYeRdRNgQgyTVxPbSTz1hzjEmH6lExSy9o57HxSwc', 'scheduled', 0, 1, '2025-12-29 19:25:16', '2025-12-29 19:26:03'),
(19, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '79090949364', 'https://us04web.zoom.us/j/79090949364?pwd=EET0EfOL3vJDaGRmw0cNrpH6wlu8S0.1', 'https://us04web.zoom.us/s/79090949364?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3OTA5MDk0OTM2NCIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjYwM2UxNzRiMDllMDRhZmJiZGU4ZGVhZWFlMGMwNmEzIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM1NjMsImlhdCI6MTc2NzAzNjM2MywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9._qTWaLepW0X32YFMzHqB-T7ymq9WStB544VS5gHrEss', 'scheduled', 0, 1, '2025-12-29 19:26:03', '2025-12-29 19:26:21'),
(20, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '76430324575', 'https://us04web.zoom.us/j/76430324575?pwd=gE2qlOeqYPgQkrlVW0prYnCebxB5Kb.1', 'https://us04web.zoom.us/s/76430324575?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NjQzMDMyNDU3NSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjRkODhhYTgwMzQ1MDQwY2ZhMTA5ZWQ3YTk2ODk5YTNkIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM1ODEsImlhdCI6MTc2NzAzNjM4MSwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.Z47pYbgTwQ9__cFwm3l2gdDE-Hr_tR1RNGpucDtZpDY', 'scheduled', 0, 1, '2025-12-29 19:26:21', '2025-12-29 19:26:59'),
(21, 27, 27, 'Officiis pariatur E', 'Rerum culpa alias q', '2003-02-20 10:03:00', 84, '72370599786', 'https://us04web.zoom.us/j/72370599786?pwd=0uIqAmcYLZD2j6SYjnEgblPCI6zM7P.1', 'https://us04web.zoom.us/s/72370599786?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MjM3MDU5OTc4NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6ImMxOTBiOTI3ZDgxMTRlZjA4YzhjN2YwNWRkYjIyNTAxIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDM2MTksImlhdCI6MTc2NzAzNjQxOSwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.NdNYIzDvbVvX4QESby-GuKWV6gUk7aiSK63RtZcVN64', 'scheduled', 0, 1, '2025-12-29 19:26:59', '2025-12-29 19:34:17'),
(22, 27, 27, 'Tempora consequuntur', 'Omnis libero aut qui', '2007-09-23 22:35:00', 90, '71637217256', 'https://us04web.zoom.us/j/71637217256?pwd=ngHH4JxA3NFa1aH8EaOPybxkVvHagF.1', 'https://us04web.zoom.us/s/71637217256?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MTYzNzIxNzI1NiIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjQ3NGE3YjE2YTI1ZjQ5Njk5NDQzZDdmMGQxNDAyNWE1Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDQwNTcsImlhdCI6MTc2NzAzNjg1NywiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.xcVxLA0JTSTUMKIq3Ev20mRWU8dD-jamNY5Ald0Dj2k', 'scheduled', 0, 1, '2025-12-29 19:34:17', '2025-12-29 19:34:44'),
(23, 27, 27, 'Tempora consequuntur', 'Omnis libero aut qui', '2007-09-23 22:35:00', 90, '72635199639', 'https://us04web.zoom.us/j/72635199639?pwd=CjbOaolbJpqjB7OnVwqMpbJ4lKaO2A.1', 'https://us04web.zoom.us/s/72635199639?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3MjYzNTE5OTYzOSIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6IjU5NTI2MmExY2FhMDRiMGM4MGQ0NzI1Mjg1NWM5MmNlIiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDQwODQsImlhdCI6MTc2NzAzNjg4NCwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.l4cPrVGfV0v2xBSx3Prxk-JgeDuX77cyUv17FrwDGtY', 'scheduled', 0, 1, '2025-12-29 19:34:44', '2025-12-29 19:35:05'),
(24, 27, 27, 'Tempora consequuntur', 'Omnis libero aut qui', '2007-09-23 22:35:00', 90, '74174705674', 'https://us04web.zoom.us/j/74174705674?pwd=rYEggxedwFrrgu22jTPRgFJ818kCy8.1', 'https://us04web.zoom.us/s/74174705674?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMiIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJ3ZWIiLCJjbHQiOjAsIm1udW0iOiI3NDE3NDcwNTY3NCIsImF1ZCI6ImNsaWVudHNtIiwidWlkIjoiUk8wb3A3MHlTSy10Vko3dkZhNF81USIsInppZCI6Ijg1MDA2ZmVjNzYyMjRjNDQ4YTE0YTM1MTBlMjk4Zjk1Iiwic2siOiIwIiwic3R5IjoxMDAsIndjZCI6InVzMDQiLCJleHAiOjE3NjcwNDQxMDUsImlhdCI6MTc2NzAzNjkwNSwiYWlkIjoiSWhsZlp3X2FUY21KUVloX0U2bjVVUSIsImNpZCI6IiJ9.cV4MjELq_jaGUhdWmsnIn_hEtbq-frS2jhqT8pZs9pY', 'scheduled', 0, 0, '2025-12-29 19:35:05', '2025-12-29 19:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_members`
--

CREATE TABLE `meeting_members` (
  `id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `meeting_members`
--

INSERT INTO `meeting_members` (`id`, `meeting_id`, `user_id`, `created_at`, `updated_at`) VALUES
(20, 24, 28, '2025-12-29 14:35:05', '2025-12-29 19:35:05'),
(21, 24, 29, '2025-12-29 14:35:05', '2025-12-29 19:35:05'),
(22, 24, 30, '2025-12-29 14:35:05', '2025-12-29 19:35:05'),
(23, 24, 27, '2025-12-29 14:35:05', '2025-12-29 19:35:05'),
(24, 13, 28, '2025-12-29 14:35:05', '2025-12-29 19:40:32'),
(25, 13, 29, '2025-12-29 14:35:05', '2025-12-29 19:40:32'),
(26, 13, 30, '2025-12-29 14:35:05', '2025-12-29 19:40:32'),
(27, 13, 27, '2025-12-29 14:35:05', '2025-12-29 19:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2015_08_04_131614_create_settings_table', 1),
(5, '2025_09_08_211109_create_tenants_table', 2),
(6, '2025_09_08_232249_create_seniors_table', 3),
(7, '2025_09_08_233000_create_roles_table', 4),
(8, '2025_09_08_232021_create_family_owners_table', 5),
(9, '2025_09_15_201313_create_permissions_table', 6),
(10, '2025_09_15_203134_create_timeline_logs_table', 7),
(11, '2025_09_15_205545_create_tenants_table', 8),
(14, '2025_09_16_193741_create_tasks_table', 9),
(15, '2025_09_16_193923_create_task_comments_table', 9),
(17, '2025_09_16_232342_create_emergency_documents_table', 11),
(18, '2025_09_18_001632_create_pools_table', 12),
(19, '2025_09_18_001647_create_pool_votings_table', 12),
(20, '2025_09_18_001846_create_voting_comments_table', 12),
(22, '2025_09_18_212045_create_document_responses_table', 14),
(23, '2025_09_16_232327_create_document_requests_table', 15),
(24, '2025_09_18_222032_create_bills_table', 16),
(25, '2025_09_18_222105_create_bill_payments_table', 16),
(27, '2025_09_19_164228_create_family_notes_table', 17),
(28, '2025_09_19_173547_create_subscriptions_table', 18),
(29, '2025_09_19_174627_create_payment_methods_table', 18),
(30, '2025_09_22_182921_create_voice_journals_table', 19),
(31, '2025_09_22_205821_create_meetings_table', 20),
(32, '2025_09_23_233711_create_contributions_table', 21),
(33, '2025_09_24_185107_create_reimbursements_table', 22),
(34, '2025_09_24_212300_create_vacations_table', 23),
(35, '2025_09_24_212318_create_vacation_users_table', 23),
(36, '2025_09_26_175748_create_events_table', 23),
(37, '2025_09_29_181556_add_need_help_status_to_tasks_table', 23),
(38, '2025_10_02_224028_create_customer_columns', 24),
(39, '2025_10_02_224029_create_subscriptions_table', 25),
(40, '2025_10_02_224030_create_subscription_items_table', 25),
(41, '2025_10_02_224031_add_meter_id_to_subscription_items_table', 25),
(42, '2025_10_02_224032_add_meter_event_name_to_subscription_items_table', 25),
(43, '2025_10_08_183033_create_chat_rooms_table', 26),
(44, '2024_01_01_000000_create_chatify_pro_tables', 27);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('family_owner18@familyowner.com', '$2y$12$r8mBDeaWk650RywEiAU/UuntH4vs6HSsOgBGCtPvRLJ8Ft.qSWHRC', '2025-11-07 04:50:26'),
('testing@yopmail.com', '$2y$12$UPCSSZnId3Pjq4WBoT4WKewtVthazhuajGXEaFHSIcFbZziSleOH2', '2025-10-17 02:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` bigint(20) UNSIGNED NOT NULL,
  `card_last_four` varchar(4) NOT NULL,
  `card_brand` varchar(255) NOT NULL,
  `expiry_month` varchar(2) NOT NULL,
  `expiry_year` varchar(4) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `gateway_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `feature_name` varchar(255) NOT NULL,
  `reason` varchar(122) DEFAULT 'no reason',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `feature_name`, `reason`, `created_at`, `updated_at`) VALUES
(15, 3, 'bills_insert', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(16, 3, 'bills_update', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(17, 3, 'bills_delete', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(18, 3, 'bills_show', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(19, 3, 'bill_payments_insert', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(20, 3, 'bill_payments_update', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(21, 3, 'bill_payments_delete', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(22, 3, 'bill_payments_show', 'no reason', '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(23, 11, 'bills_delete', 'no reason', '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(24, 11, 'bill_payments_insert', 'no reason', '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(25, 11, 'bill_payments_update', 'no reason', '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(26, 11, 'bill_payments_delete', 'no reason', '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(27, 12, 'bills_insert', 'no reason', '2025-10-30 04:06:01', '2025-10-30 04:06:01'),
(28, 12, 'bills_delete', 'no reason', '2025-10-30 04:06:01', '2025-10-30 04:06:01'),
(29, 12, 'bill_payments_delete', 'no reason', '2025-10-30 04:06:01', '2025-10-30 04:06:01'),
(30, 12, 'bill_payments_show', 'no reason', '2025-10-30 04:06:01', '2025-10-30 04:06:01'),
(31, 13, 'bills_update', 'no reason', '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(32, 13, 'bills_show', 'no reason', '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(33, 13, 'bill_payments_insert', 'no reason', '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(34, 13, 'bill_payments_delete', 'no reason', '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(35, 2, 'bills_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(36, 2, 'bills_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(37, 2, 'bills_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(38, 2, 'bills_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(39, 2, 'bill_payments_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(40, 2, 'bill_payments_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(41, 2, 'bill_payments_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(42, 2, 'bill_payments_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(43, 2, 'documents_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(44, 2, 'documents_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(45, 2, 'documents_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(46, 2, 'documents_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(47, 2, 'medical_docs_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(48, 2, 'medical_docs_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(49, 2, 'medical_docs_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(50, 2, 'medical_docs_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(51, 2, 'insurance_docs_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(52, 2, 'insurance_docs_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(53, 2, 'insurance_docs_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(54, 2, 'insurance_docs_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(55, 2, 'emergency_docs_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(56, 2, 'emergency_docs_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(57, 2, 'emergency_docs_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(58, 2, 'emergency_docs_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(59, 2, 'caregivers_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(60, 2, 'caregivers_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(61, 2, 'caregivers_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(62, 2, 'caregivers_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(63, 2, 'reports_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(64, 2, 'reports_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(65, 2, 'reports_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(66, 2, 'reports_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(67, 2, 'tasks_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(68, 2, 'tasks_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(69, 2, 'tasks_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(70, 2, 'tasks_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(71, 2, 'members_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(72, 2, 'members_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(73, 2, 'members_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(74, 2, 'members_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(75, 2, 'family_notes_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(76, 2, 'family_notes_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(77, 2, 'family_notes_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(78, 2, 'family_notes_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(79, 2, 'meetings_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(80, 2, 'meetings_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(81, 2, 'meetings_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(82, 2, 'meetings_join', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(83, 2, 'pools_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(84, 2, 'pools_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(85, 2, 'pools_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(86, 2, 'pools_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(87, 2, 'daily_updates_insert', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(88, 2, 'daily_updates_update', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(89, 2, 'daily_updates_delete', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(90, 2, 'daily_updates_show', 'no reason', '2025-10-31 21:51:35', '2025-10-31 21:51:35'),
(91, 19, 'bills_delete', 'no reason', '2025-11-06 21:33:05', '2025-11-06 21:33:05'),
(92, 19, 'bill_payments_show', 'no reason', '2025-11-06 21:33:05', '2025-11-06 21:33:05'),
(93, 20, 'bills_insert', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(94, 20, 'bills_update', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(95, 20, 'bill_payments_insert', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(96, 20, 'bill_payments_update', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(97, 20, 'bill_payments_delete', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(98, 20, 'bill_payments_show', 'no reason', '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(99, 21, 'bills_insert', 'no reason', '2025-11-06 21:41:19', '2025-11-06 21:41:19'),
(100, 21, 'bills_show', 'no reason', '2025-11-06 21:41:19', '2025-11-06 21:41:19'),
(101, 21, 'bill_payments_show', 'no reason', '2025-11-06 21:41:19', '2025-11-06 21:41:19'),
(102, 22, 'bills_insert', 'no reason', '2025-11-06 22:14:00', '2025-11-06 22:14:00'),
(103, 22, 'bills_delete', 'no reason', '2025-11-06 22:14:00', '2025-11-06 22:14:00'),
(104, 22, 'bill_payments_update', 'no reason', '2025-11-06 22:14:00', '2025-11-06 22:14:00'),
(105, 22, 'bill_payments_show', 'no reason', '2025-11-06 22:14:00', '2025-11-06 22:14:00'),
(106, 23, 'bill_payments_update', 'no reason', '2025-11-06 22:48:16', '2025-11-06 22:48:16'),
(107, 23, 'bill_payments_delete', 'no reason', '2025-11-06 22:48:16', '2025-11-06 22:48:16'),
(108, 23, 'bill_payments_show', 'no reason', '2025-11-06 22:48:16', '2025-11-06 22:48:16'),
(109, 24, 'bills_delete', 'no reason', '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(110, 24, 'bills_show', 'no reason', '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(111, 24, 'bill_payments_insert', 'no reason', '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(112, 24, 'bill_payments_delete', 'no reason', '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(113, 25, 'bills_update', 'no reason', '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(114, 25, 'bills_show', 'no reason', '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(115, 25, 'bill_payments_insert', 'no reason', '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(116, 25, 'bill_payments_update', 'no reason', '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(117, 25, 'bill_payments_show', 'no reason', '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(118, 10, 'bills_insert', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(119, 10, 'bills_update', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(120, 10, 'bills_delete', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(121, 10, 'bills_show', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(122, 10, 'bill_payments_insert', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(123, 10, 'bill_payments_update', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(124, 10, 'bill_payments_delete', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(125, 10, 'bill_payments_show', 'no reason', '2025-11-15 02:35:18', '2025-11-15 02:35:18'),
(166, 29, 'bills_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(167, 29, 'bills_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(168, 29, 'bills_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(169, 29, 'bill_payments_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(170, 29, 'bill_payments_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(171, 29, 'bill_payments_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(172, 29, 'documents_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(173, 29, 'documents_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(174, 29, 'documents_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(175, 29, 'medical_docs_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(176, 29, 'medical_docs_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(177, 29, 'medical_docs_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(178, 29, 'insurance_docs_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(179, 29, 'insurance_docs_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(180, 29, 'insurance_docs_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(181, 29, 'emergency_docs_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(182, 29, 'emergency_docs_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(183, 29, 'emergency_docs_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(184, 29, 'reports_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(185, 29, 'reports_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(186, 29, 'reports_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(187, 29, 'tasks_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(188, 29, 'tasks_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(189, 29, 'tasks_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(190, 29, 'family_notes_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(191, 29, 'family_notes_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(192, 29, 'family_notes_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(193, 29, 'meetings_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(194, 29, 'meetings_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(195, 29, 'meetings_join', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(196, 29, 'pools_insert', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(197, 29, 'pools_update', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(198, 29, 'pools_show', 'no reason', '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(322, 30, 'bills_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(323, 30, 'bills_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(324, 30, 'bills_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(325, 30, 'bill_payments_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(326, 30, 'bill_payments_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(327, 30, 'bill_payments_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(328, 30, 'documents_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(329, 30, 'documents_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(330, 30, 'documents_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(331, 30, 'medical_docs_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(332, 30, 'medical_docs_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(333, 30, 'medical_docs_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(334, 30, 'insurance_docs_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(335, 30, 'insurance_docs_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(336, 30, 'insurance_docs_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(337, 30, 'emergency_docs_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(338, 30, 'emergency_docs_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(339, 30, 'emergency_docs_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(340, 30, 'caregivers_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(341, 30, 'caregivers_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(342, 30, 'caregivers_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(343, 30, 'reports_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(344, 30, 'reports_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(345, 30, 'reports_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(346, 30, 'tasks_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(347, 30, 'tasks_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(348, 30, 'tasks_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(349, 30, 'tasks_show', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(350, 30, 'members_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(351, 30, 'members_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(352, 30, 'members_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(353, 30, 'family_notes_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(354, 30, 'family_notes_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(355, 30, 'family_notes_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(356, 30, 'meetings_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(357, 30, 'meetings_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(358, 30, 'pools_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(359, 30, 'pools_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(360, 30, 'pools_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(361, 30, 'daily_updates_insert', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(362, 30, 'daily_updates_update', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(363, 30, 'daily_updates_delete', 'no reason', '2025-12-08 17:50:54', '2025-12-08 17:50:54'),
(364, 31, 'bills_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(365, 31, 'bills_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(366, 31, 'bills_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(367, 31, 'bills_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(368, 31, 'bill_payments_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(369, 31, 'bill_payments_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(370, 31, 'bill_payments_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(371, 31, 'bill_payments_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(372, 31, 'documents_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(373, 31, 'documents_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(374, 31, 'documents_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(375, 31, 'documents_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(376, 31, 'medical_docs_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(377, 31, 'medical_docs_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(378, 31, 'medical_docs_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(379, 31, 'medical_docs_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(380, 31, 'insurance_docs_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(381, 31, 'insurance_docs_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(382, 31, 'insurance_docs_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(383, 31, 'insurance_docs_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(384, 31, 'emergency_docs_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(385, 31, 'emergency_docs_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(386, 31, 'emergency_docs_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(387, 31, 'emergency_docs_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(388, 31, 'caregivers_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(389, 31, 'caregivers_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(390, 31, 'caregivers_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(391, 31, 'caregivers_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(392, 31, 'reports_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(393, 31, 'reports_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(394, 31, 'reports_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(395, 31, 'reports_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(396, 31, 'tasks_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(397, 31, 'tasks_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(398, 31, 'tasks_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(399, 31, 'tasks_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(400, 31, 'members_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(401, 31, 'members_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(402, 31, 'members_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(403, 31, 'members_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(404, 31, 'family_notes_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(405, 31, 'family_notes_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(406, 31, 'family_notes_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(407, 31, 'family_notes_show', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(408, 31, 'meetings_insert', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(409, 31, 'meetings_update', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(410, 31, 'meetings_delete', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(411, 31, 'meetings_join', 'no reason', '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(412, 31, 'pools_insert', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(413, 31, 'pools_update', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(414, 31, 'pools_delete', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(415, 31, 'pools_show', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(416, 31, 'daily_updates_insert', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(417, 31, 'daily_updates_update', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(418, 31, 'daily_updates_delete', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(419, 31, 'daily_updates_show', 'no reason', '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(420, 32, 'bills_delete', 'no reason', '2025-12-09 23:07:58', '2025-12-09 23:07:58'),
(421, 32, 'bill_payments_insert', 'no reason', '2025-12-09 23:07:58', '2025-12-09 23:07:58'),
(422, 34, 'bills_update', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(423, 34, 'bills_delete', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(424, 34, 'bills_show', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(425, 34, 'bill_payments_insert', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(426, 34, 'bill_payments_delete', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(427, 34, 'bill_payments_show', 'no reason', '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(428, 35, 'bills_insert', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(429, 35, 'bills_update', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(430, 35, 'bills_delete', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(431, 35, 'bills_show', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(432, 35, 'bill_payments_insert', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(433, 35, 'bill_payments_update', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(434, 35, 'bill_payments_delete', 'no reason', '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(435, 30, 'tasks_insert', 'no reason', '2026-01-17 00:15:43', '2026-01-17 00:15:43'),
(436, 30, 'tasks_show', 'no reason', '2026-01-17 00:15:43', '2026-01-17 00:15:43'),
(476, 29, 'tasks_insert', 'no reason', '2026-01-17 00:17:25', '2026-01-17 00:17:25'),
(477, 29, 'tasks_show', 'no reason', '2026-01-17 00:17:25', '2026-01-17 00:17:25'),
(482, 35, 'tasks_insert', 'no reason', '2026-01-17 00:32:41', '2026-01-17 00:32:41'),
(483, 35, 'tasks_show', 'no reason', '2026-01-17 00:32:41', '2026-01-17 00:32:41'),
(504, 28, 'bills_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(505, 28, 'bills_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(506, 28, 'bills_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(507, 28, 'bills_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(508, 28, 'bill_payments_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(509, 28, 'bill_payments_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(510, 28, 'bill_payments_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(511, 28, 'bill_payments_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(512, 28, 'documents_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(513, 28, 'documents_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(514, 28, 'documents_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(515, 28, 'documents_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(516, 28, 'medical_docs_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(517, 28, 'medical_docs_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(518, 28, 'medical_docs_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(519, 28, 'medical_docs_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(520, 28, 'insurance_docs_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(521, 28, 'insurance_docs_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(522, 28, 'insurance_docs_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(523, 28, 'insurance_docs_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(524, 28, 'emergency_docs_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(525, 28, 'emergency_docs_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(526, 28, 'emergency_docs_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(527, 28, 'emergency_docs_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(528, 28, 'reports_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(529, 28, 'reports_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(530, 28, 'reports_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(531, 28, 'reports_show', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(532, 28, 'members_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(533, 28, 'family_notes_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(534, 28, 'family_notes_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(535, 28, 'family_notes_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(536, 28, 'meetings_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(537, 28, 'meetings_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(538, 28, 'pools_insert', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(539, 28, 'pools_update', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(540, 28, 'pools_delete', 'no reason', '2026-01-17 01:00:27', '2026-01-17 01:00:27'),
(543, 29, 'tasks_insert', 'carewatcher', '2026-01-17 01:03:33', '2026-01-17 01:03:33'),
(544, 29, 'tasks_show', 'carewatcher', '2026-01-17 01:03:33', '2026-01-17 01:03:33'),
(545, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:42:18', '2026-01-19 16:42:18'),
(546, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:42:18', '2026-01-19 16:42:18'),
(547, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:42:24', '2026-01-19 16:42:24'),
(548, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:42:24', '2026-01-19 16:42:24'),
(549, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:42:28', '2026-01-19 16:42:28'),
(550, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:42:28', '2026-01-19 16:42:28'),
(553, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:42:37', '2026-01-19 16:42:37'),
(554, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:42:37', '2026-01-19 16:42:37'),
(555, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:42:40', '2026-01-19 16:42:40'),
(556, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:42:40', '2026-01-19 16:42:40'),
(557, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:43:47', '2026-01-19 16:43:47'),
(558, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:43:47', '2026-01-19 16:43:47'),
(559, 29, 'tasks_insert', 'carewatcher', '2026-01-19 16:43:49', '2026-01-19 16:43:49'),
(560, 29, 'tasks_show', 'carewatcher', '2026-01-19 16:43:49', '2026-01-19 16:43:49'),
(569, 29, 'tasks_insert', 'carewatcher', '2026-01-19 17:41:51', '2026-01-19 17:41:51'),
(570, 29, 'tasks_show', 'carewatcher', '2026-01-19 17:41:51', '2026-01-19 17:41:51'),
(571, 29, 'tasks_insert', 'carewatcher', '2026-01-19 17:41:51', '2026-01-19 17:41:51'),
(572, 29, 'tasks_show', 'carewatcher', '2026-01-19 17:41:51', '2026-01-19 17:41:51'),
(573, 28, 'tasks_insert', 'carewatcher', '2026-01-19 17:42:54', '2026-01-19 17:42:54'),
(574, 28, 'tasks_show', 'carewatcher', '2026-01-19 17:42:54', '2026-01-19 17:42:54'),
(575, 28, 'tasks_insert', 'carewatcher', '2026-01-20 00:31:18', '2026-01-20 00:31:18'),
(576, 28, 'tasks_show', 'carewatcher', '2026-01-20 00:31:18', '2026-01-20 00:31:18'),
(577, 35, 'tasks_insert', 'carewatcher', '2026-01-20 00:31:24', '2026-01-20 00:31:24'),
(578, 35, 'tasks_show', 'carewatcher', '2026-01-20 00:31:24', '2026-01-20 00:31:24'),
(579, 28, 'tasks_insert', 'carewatcher', '2026-01-20 00:35:24', '2026-01-20 00:35:24'),
(580, 28, 'tasks_show', 'carewatcher', '2026-01-20 00:35:24', '2026-01-20 00:35:24'),
(581, 29, 'tasks_insert', 'carewatcher', '2026-01-21 20:51:15', '2026-01-21 20:51:15'),
(582, 29, 'tasks_show', 'carewatcher', '2026-01-21 20:51:15', '2026-01-21 20:51:15'),
(583, 35, 'tasks_insert', 'carewatcher', '2026-01-21 20:51:18', '2026-01-21 20:51:18'),
(584, 35, 'tasks_show', 'carewatcher', '2026-01-21 20:51:18', '2026-01-21 20:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `pools`
--

CREATE TABLE `pools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('open','closed','final_decision') NOT NULL DEFAULT 'open',
  `voting_expires_at` datetime DEFAULT NULL,
  `final_decision_by` bigint(20) UNSIGNED DEFAULT NULL,
  `final_decision_notes` text DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=delted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pools`
--

INSERT INTO `pools` (`id`, `owner_id`, `title`, `description`, `status`, `voting_expires_at`, `final_decision_by`, `final_decision_notes`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tempor vero qui exer', 'Qui et labore sed co', 'open', '2025-12-12 23:05:00', NULL, NULL, 0, '2025-10-08 07:43:16', '2025-10-08 07:43:47'),
(2, 1, '-8-8-', '8-8-', 'open', '2025-10-30 08:35:00', NULL, NULL, 0, '2025-11-03 21:32:40', '2025-11-03 21:32:40'),
(3, 1, 'qeqe', 'qeqewq', 'open', '2025-11-11 22:12:00', NULL, NULL, 0, '2025-11-04 22:09:44', '2025-11-04 22:09:44'),
(4, 27, 'Test 1', 'Test 1', 'open', '2025-12-06 16:06:00', NULL, NULL, 0, '2025-12-04 00:06:28', '2025-12-04 00:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `pool_votings`
--

CREATE TABLE `pool_votings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pool_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `choice` enum('yes','no','abstain') NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pool_votings`
--

INSERT INTO `pool_votings` (`id`, `pool_id`, `user_id`, `choice`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'yes', NULL, '2025-10-08 07:43:53', '2025-10-08 07:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `reimbursements`
--

CREATE TABLE `reimbursements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `family_member_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','declined') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reimbursements`
--

INSERT INTO `reimbursements` (`id`, `family_member_id`, `bill_id`, `amount`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 3, 65.00, 'Qui aliquam do quae', 'pending', '2025-10-08 07:25:26', '2025-10-08 07:25:26'),
(3, 28, 9, 450.00, 'vbghh hghfh', 'pending', '2025-12-02 21:23:32', '2025-12-02 21:23:32'),
(4, 27, 8, 61.00, 'Dolore sint et maxim', 'pending', '2025-12-02 21:59:18', '2025-12-02 21:59:18'),
(5, 28, 8, 80.00, 'I paid as the deadline was closing in, I paid 80 more than what I was supposed to cover, please reimburse the said amount Sebastian or anyone else.', 'pending', '2025-12-03 17:39:33', '2025-12-03 17:39:33'),
(6, 28, 14, 150.00, 'I was just covering a shortfall, I need the funds', 'pending', '2025-12-03 23:20:49', '2025-12-03 23:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'superAdmin', NULL, NULL),
(2, 'Senior', NULL, NULL),
(3, 'familyMember', NULL, NULL),
(4, 'familyOwner', NULL, NULL),
(5, 'careGiver', NULL, NULL),
(6, 'other', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seniors`
--

CREATE TABLE `seniors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `family_owner_id` bigint(20) UNSIGNED NOT NULL,
  `dob` date DEFAULT NULL,
  `blood_type` varchar(122) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `medical_condition` varchar(255) DEFAULT NULL,
  `primary_doctor` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(255) DEFAULT NULL,
  `emergency_contact_phone` varchar(255) DEFAULT NULL,
  `has_dementia` tinyint(1) NOT NULL DEFAULT 0,
  `has_alzheimer` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seniors`
--

INSERT INTO `seniors` (`id`, `user_id`, `family_owner_id`, `dob`, `blood_type`, `gender`, `medical_condition`, `primary_doctor`, `emergency_contact_name`, `emergency_contact_phone`, `has_dementia`, `has_alzheimer`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '1985-12-25', 'A+', 'male', 'Tempor debitis dolor', 'Eveniet amet minim', '+1 (568) 797-1451', '+1 (568) 797-1451', 1, 1, '2025-10-02 02:16:02', '2025-10-02 02:16:02'),
(2, 10, 1, '1981-12-27', 'B+', 'female', 'Aute et vitae volupt', 'Voluptate deserunt q', 'Amal Petersen', '+1 (849) 589-5134', 1, 1, '2025-10-23 22:49:58', '2025-10-23 22:49:58'),
(3, 12, 1, '1992-08-01', 'A-', 'male', 'Consequuntur vel est', 'Expedita atque dolor', 'Joshua Cobb', '+1 (108) 345-5888', 1, 1, '2025-10-30 04:06:00', '2025-10-30 04:06:00'),
(4, 30, 27, '1950-01-01', 'B+', 'male', 'Alzheimer\'s, Hyper Tension, Diabetes', 'Dr Murphy', 'Cathy', '4456698873', 1, 1, '2025-11-25 23:31:07', '2025-11-25 23:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('mZUQGpSotaRpEQ9CmMtYv8Q8hJd0MYEKoBhVhn1t', 25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV0VLV212SVdYSFBkOUc5bWFpMWk3dUJzWlJBT1dxbGlFaVh4c3BNZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYW1pbHlNZW1iZXIvcmVpbWJ1cnNtZW50L2luZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjU7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzU4NzM0NDI1O319', 1758741258);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `field` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribed_users`
--

CREATE TABLE `subscribed_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sub_id` varchar(112) NOT NULL,
  `feature` varchar(112) DEFAULT NULL,
  `owner_limit` int(11) NOT NULL,
  `member_limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscribed_users`
--

INSERT INTO `subscribed_users` (`id`, `user_id`, `sub_id`, `feature`, `owner_limit`, `member_limit`, `created_at`, `updated_at`) VALUES
(1, 1, 'price_1SO0l4Grh32uccZt6fuuPVSY', NULL, 2, 1, NULL, '2025-12-09 23:07:58'),
(2, 15, 'sub_1SPucEGrh32uccZtx6nvzjEX', NULL, 2, 2, '2025-11-05 05:30:25', '2025-11-05 05:30:25'),
(3, 15, 'price_1SPSt5Grh32uccZtpIjAgXN6', NULL, 2, 2, '2025-11-05 05:31:32', '2025-11-05 05:31:32'),
(4, 16, 'price_1SPSt5Grh32uccZtpIjAgXN6', NULL, 2, 2, '2025-11-05 06:22:37', '2025-11-05 06:22:37'),
(5, 16, 'price_1SPSt5Grh32uccZtpIjAgXN6', NULL, 2, 2, '2025-11-05 06:23:56', '2025-11-05 06:23:56'),
(6, 16, 'price_1SPSt5Grh32uccZtpIjAgXN6', NULL, 2, 2, '2025-11-05 06:25:12', '2025-11-05 06:25:12'),
(7, 18, 'price_1SPSt5Grh32uccZtpIjAgXN6', NULL, 0, 0, '2025-11-05 06:45:12', '2025-11-06 23:18:45'),
(8, 26, 'price_1SO0l4Grh32uccZt6fuuPVSY', NULL, 1, 2, '2025-11-06 23:19:58', '2025-11-06 23:27:46'),
(9, 27, 'price_1SPSqiGrh32uccZtxa0s85G4', NULL, 2, 0, '2025-11-25 23:14:48', '2025-12-30 18:15:59'),
(10, 27, 'price_1SPSqiGrh32uccZtxa0s85G4', NULL, 2, 4, '2025-11-25 23:14:51', '2025-11-25 23:14:54'),
(11, 33, 'price_1SPSqiGrh32uccZtxa0s85G4', NULL, 1, 1, '2025-12-13 01:16:50', '2025-12-13 01:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_user_id` varchar(10000) NOT NULL,
  `type` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `owner_limit` int(11) DEFAULT NULL,
  `member_limit` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `stripe_user_id`, `type`, `stripe_id`, `stripe_status`, `stripe_price`, `quantity`, `price`, `owner_limit`, `member_limit`, `trial_ends_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(8, 1, 'cus_TKiZWBhoI4Knr8', 'Standard', 'sub_1SO38jGrh32uccZtq5H8oSpj', 'active', 'price_1SO0l4Grh32uccZt6fuuPVSY', 1, 59, NULL, NULL, NULL, '2025-12-08 02:36:30', '2025-10-31 01:12:16', '2025-10-31 01:12:16'),
(9, 1, 'cus_TKiZWBhoI4Knr8', 'Standard', 'sub_1SPpq3Grh32uccZtktpQzkuU', 'active', 'price_1SO0l4Grh32uccZt6fuuPVSY', 1, 59, 1, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 00:24:22', '2025-11-05 00:24:22'),
(10, 1, 'cus_TKiZWBhoI4Knr8', 'Additional Family Member', 'sub_1SPq0dGrh32uccZtPDzlPJVI', 'active', 'price_1SPnaoGrh32uccZt2fgzx4FN', 1, 10, 0, 1, NULL, '2025-12-08 02:36:30', '2025-11-05 00:35:18', '2025-11-05 00:35:18'),
(11, 1, 'cus_TKiZWBhoI4Knr8', 'Dual Parent', 'sub_1SPtcVGrh32uccZt8nf7hJAZ', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 04:26:38', '2025-11-05 04:26:38'),
(12, 15, 'cus_TMcy9EP1HsoJG6', 'Dual Parent', 'sub_1SPtiuGrh32uccZt45QVl4Y0', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 04:33:15', '2025-11-05 04:33:15'),
(13, 15, 'cus_TMcy9EP1HsoJG6', 'Dual Parent', 'sub_1SPtkJGrh32uccZtQFnh48Un', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 4, 4, NULL, '2025-12-08 02:36:30', '2025-11-05 04:34:42', '2025-11-05 04:34:42'),
(14, 15, 'cus_TMduyWaWrrzhOt', 'Dual Parent', 'sub_1SPucEGrh32uccZtx6nvzjEX', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 05:30:25', '2025-11-05 05:30:25'),
(15, 15, 'cus_TMdvXWmg5eIIMw', 'Dual Parent', 'sub_1SPudJGrh32uccZtCWNZJ1k4', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 05:31:32', '2025-11-05 05:31:32'),
(16, 18, 'cus_TMf6kbD1GW6rlq', 'Dual Parent', 'sub_1SPvmbGrh32uccZt8yhzB0a1', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-05 06:45:12', '2025-11-05 06:45:12'),
(17, 18, 'cus_TMf6kbD1GW6rlq', 'Additional Admin', 'sub_1SQXWqGrh32uccZtu04fBqMT', 'active', 'price_1SPnikGrh32uccZt59B13VBy', 1, 20, 1, 0, NULL, '2025-12-08 02:36:30', '2025-11-06 23:03:27', '2025-11-06 23:03:27'),
(18, 18, 'cus_TMf6kbD1GW6rlq', 'Additional Admin', 'sub_1SQXYwGrh32uccZtNTpVG0YS', 'active', 'price_1SPnikGrh32uccZt59B13VBy', 1, 20, 1, 0, NULL, '2025-12-08 02:36:30', '2025-11-06 23:05:37', '2025-11-06 23:05:37'),
(19, 18, 'cus_TMf6kbD1GW6rlq', 'Additional Admin', 'sub_1SQXkyGrh32uccZt65DPazqX', 'active', 'price_1SPnikGrh32uccZt59B13VBy', 1, 20, 1, 0, NULL, '2025-12-08 02:36:30', '2025-11-06 23:18:03', '2025-11-06 23:18:03'),
(21, 26, 'cus_TNINLTyMmsKSWb', 'Standard', 'sub_1SQXuNGrh32uccZtM2Zrht38', 'active', 'price_1SPSqiGrh32uccZtxa0s85G4', 1, 59, 1, 2, NULL, '2025-12-08 02:36:30', '2025-11-06 23:27:46', '2025-11-06 23:27:46'),
(22, 1, 'cus_TKiZWBhoI4Knr8', 'Dual Parent', 'sub_1SQxKZGrh32uccZtlIf6rjb3', 'active', 'price_1SPSt5Grh32uccZtpIjAgXN6', 1, 90, 2, 2, NULL, '2025-12-08 02:36:30', '2025-11-08 02:36:30', '2025-11-08 02:36:30'),
(23, 27, 'cus_TUPazCFSlTMz35', 'Standard', 'sub_1SXQlFGrh32uccZtwNCcSnyB', 'active', 'price_1SPSqiGrh32uccZtxa0s85G4', 1, 59, 1, 2, NULL, NULL, '2025-11-25 23:14:48', '2025-11-25 23:14:48'),
(24, 27, 'cus_TUPaQEb02veRBb', 'Standard', 'sub_1SXQlJGrh32uccZtAPZh2sD7', 'active', 'price_1SPSqiGrh32uccZtxa0s85G4', 1, 59, 1, 2, NULL, NULL, '2025-11-25 23:14:51', '2025-11-25 23:14:51'),
(25, 27, 'cus_TUPazCFSlTMz35', 'Standard', 'sub_1SXQlLGrh32uccZtPqaZhGet', 'active', 'price_1SPSqiGrh32uccZtxa0s85G4', 1, 59, 1, 2, NULL, '2025-12-25 23:14:54', '2025-11-25 23:14:54', '2025-11-25 23:14:54'),
(26, 33, 'cus_TatEXAtes6owKQ', 'Standard', 'sub_1SdhRzGrh32uccZtc9n6CEQ5', 'active', 'price_1SPSqiGrh32uccZtxa0s85G4', 1, 59, 1, 2, NULL, NULL, '2025-12-13 01:16:50', '2025-12-13 01:16:50');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_perks`
--

CREATE TABLE `subscription_perks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_id` varchar(200) NOT NULL,
  `feature` varchar(150) NOT NULL,
  `limitation` int(11) DEFAULT NULL,
  `owner_limit` int(11) DEFAULT NULL,
  `member_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subscription_perks`
--

INSERT INTO `subscription_perks` (`id`, `sub_id`, `feature`, `limitation`, `owner_limit`, `member_limit`, `created_at`, `updated_at`) VALUES
(2, 'price_1SPSqiGrh32uccZtxa0s85G4', 'document_vault', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:21'),
(3, 'price_1SPSqiGrh32uccZtxa0s85G4', 'family_management_full_ctrl', 3, 1, 2, '2025-10-29 22:03:26', '2025-11-04 23:24:27'),
(4, 'price_1SPSqiGrh32uccZtxa0s85G4', 'voting_pool', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:30'),
(5, 'price_1SPSqiGrh32uccZtxa0s85G4', 'Activity_log', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:33'),
(6, 'price_1SPSqiGrh32uccZtxa0s85G4', 'Reimbursement', NULL, NULL, NULL, '2025-10-29 22:38:37', '2025-11-04 23:24:36'),
(7, 'price_1SPSqiGrh32uccZtxa0s85G4', 'Family_Notes', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:38'),
(8, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'document_vault', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:54'),
(9, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'family_management_full_ctrl', 4, 2, 2, '2025-10-29 22:03:26', '2025-11-04 23:24:56'),
(10, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'voting_pool', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:24:58'),
(11, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'Activity_log', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:25:01'),
(12, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'Reimbursement', NULL, NULL, NULL, '2025-10-29 22:38:37', '2025-11-04 23:25:04'),
(13, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'Family_Notes', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:25:10'),
(20, 'price_1SPSqiGrh32uccZtxa0s85G4', 'meeting', 3, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:25:25'),
(21, 'price_1SPSt5Grh32uccZtpIjAgXN6', 'meeting', 10, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 23:25:19'),
(22, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'document_vault', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:06:41'),
(23, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'family_management_full_ctrl', 1, 0, 1, '2025-10-29 22:03:26', '2025-11-04 18:07:23'),
(24, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'voting_pool', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:06:59'),
(25, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'Activity_log', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:02'),
(26, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'Reimbursement', NULL, NULL, NULL, '2025-10-29 22:38:37', '2025-11-04 18:07:04'),
(27, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'Family_Notes', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:08'),
(28, 'price_1SPnaoGrh32uccZt2fgzx4FN', 'meeting', 0, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:10'),
(29, 'price_1SPnikGrh32uccZt59B13VBy', 'document_vault', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:06:41'),
(30, 'price_1SPnikGrh32uccZt59B13VBy', 'family_management_full_ctrl', 1, 1, 0, '2025-10-29 22:03:26', '2025-11-04 18:07:23'),
(31, 'price_1SPnikGrh32uccZt59B13VBy', 'voting_pool', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:06:59'),
(32, 'price_1SPnikGrh32uccZt59B13VBy', 'Activity_log', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:02'),
(33, 'price_1SPnikGrh32uccZt59B13VBy', 'Reimbursement', NULL, NULL, NULL, '2025-10-29 22:38:37', '2025-11-04 18:07:04'),
(34, 'price_1SPnikGrh32uccZt59B13VBy', 'Family_Notes', NULL, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:08'),
(35, 'price_1SPnikGrh32uccZt59B13VBy', 'meeting', 0, NULL, NULL, '2025-10-29 22:03:26', '2025-11-04 18:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` int(11) NOT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('medical','non-medical') NOT NULL,
  `details` text DEFAULT NULL,
  `task_agenda` varchar(210) NOT NULL,
  `priority_level` varchar(211) NOT NULL,
  `deadline` date DEFAULT NULL,
  `deadline_time` time DEFAULT NULL,
  `status` enum('pending','in_progress','completed','need_outside_help','Accepted','Needs Action','Final Call','Unresolved') NOT NULL DEFAULT 'pending',
  `alerts_sent` int(11) NOT NULL DEFAULT 0,
  `last_alert_at` timestamp NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=deleted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `owner_id`, `assignee_id`, `title`, `type`, `details`, `task_agenda`, `priority_level`, `deadline`, `deadline_time`, `status`, `alerts_sent`, `last_alert_at`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 27, 27, 'Tempora vel sit ver', 'non-medical', 'Dolor lorem qui sed', '', '', '2025-12-01', '19:00:00', 'need_outside_help', 2, '2025-12-02 00:02:54', 0, '2025-12-01 19:44:24', '2025-12-02 00:13:18'),
(2, 1, 11, 'Dolorem eu pariatur', 'non-medical', 'Mollit et est neque', '', '', '2025-12-03', '14:29:01', 'need_outside_help', 0, NULL, 0, '2025-12-02 17:33:16', '2025-12-04 22:30:17'),
(3, 27, 27, 'Physiotherapy', 'non-medical', 'Pick dad up from home, take dad to the appointment and to the Grocery store before dropping him back', '', '', '2025-12-05', '16:45:00', 'need_outside_help', 0, NULL, 0, '2025-12-02 19:46:59', '2025-12-11 02:04:11'),
(4, 27, 29, 'Test Therapy', 'non-medical', 'Take DAD to the session.', '', '', '2025-12-05', '12:00:00', 'need_outside_help', 0, NULL, 0, '2025-12-03 19:06:09', '2025-12-08 17:46:43'),
(5, 27, 29, 'Test appointment', 'medical', 'Test appointment', '', '', '2025-12-08', '12:00:00', 'completed', 0, NULL, 0, '2025-12-03 19:16:43', '2025-12-03 19:18:08'),
(6, 27, 28, 'tester therapy', 'non-medical', 'tester therapy, PE and some extra curricular activities', '', '', '2025-12-09', '12:00:00', 'need_outside_help', 0, NULL, 0, '2025-12-03 21:39:25', '2025-12-09 17:48:35'),
(7, 27, NULL, 'dsad', 'non-medical', 'Detailsdsad', '', '', '2025-12-12', '05:50:00', 'pending', 0, NULL, 0, '2025-12-11 01:50:19', '2025-12-11 01:50:19'),
(8, 27, NULL, 'dsda', 'medical', 'Detailsdasd', '', '', '2025-12-12', '18:59:00', 'pending', 0, NULL, 0, '2025-12-11 01:59:43', '2025-12-11 01:59:43'),
(9, 27, 29, 'dsda', 'medical', 'Detailsdasd', '', '', '2025-12-12', '18:59:00', 'Accepted', 0, NULL, 0, '2025-12-11 01:59:43', '2025-12-24 18:43:28'),
(10, 27, NULL, 'dsda', 'medical', 'Detailsdasd', '', '', '2025-12-12', '18:59:00', 'pending', 0, NULL, 0, '2025-12-11 02:01:52', '2025-12-11 02:01:52'),
(11, 27, 30, 'Alias tempore aut q', 'non-medical', 'Recusandae Et possi', '', '', '2025-12-12', '23:30:00', 'pending', 0, NULL, 0, '2025-12-11 02:02:41', '2025-12-11 02:02:41'),
(12, 27, 28, 'Velit veniam beatae', 'non-medical', 'Voluptas officia ull', '', '', '2025-12-12', '05:37:00', 'pending', 0, NULL, 0, '2025-12-11 02:06:28', '2025-12-11 02:06:28'),
(13, 27, 29, 'Excepteur rerum non', 'non-medical', NULL, 'Pet Care / Animal Support', 'Time-Sensitive', '2025-12-31', '14:13:00', 'Unresolved', 13, '2026-01-19 16:39:58', 0, '2025-12-22 18:55:36', '2026-01-19 16:39:58'),
(14, 27, 35, 'Ullam laborum fugit', 'non-medical', 'Details', 'Document / Paperwork', 'Time-Sensitive', '2026-01-08', '23:51:00', 'pending', 0, NULL, 0, '2026-01-05 19:51:41', '2026-01-05 19:51:41'),
(15, 27, 35, 'Et ipsum dolor et co', 'non-medical', 'Details', 'Appointment / Transportation', 'Time-Sensitive', '2026-01-31', '11:52:00', 'pending', 0, NULL, 0, '2026-01-05 19:52:20', '2026-01-05 19:52:20'),
(16, 27, 27, 'Aliquam inventore au', 'non-medical', 'Details', 'Bill / Financial Item', 'Time-Sensitive', '2026-02-27', '23:52:00', 'pending', 0, NULL, 0, '2026-01-05 19:52:40', '2026-01-05 19:52:40'),
(17, 27, 35, 'Aliquam inventore au', 'non-medical', 'Details', 'Bill / Financial Item', 'Time-Sensitive', '2026-02-27', '23:52:00', 'completed', 0, NULL, 0, '2026-01-05 19:52:46', '2026-01-05 19:54:31'),
(18, 27, NULL, 'i need some ungent help', 'medical', 'Details', 'Appointment / Transportation', 'Time-Sensitive', '2026-01-15', '22:04:00', 'pending', 0, NULL, 0, '2026-01-06 18:04:21', '2026-01-06 18:04:21'),
(19, 27, 30, 'i need some ungent help', 'medical', 'Details', 'Appointment / Transportation', 'Time-Sensitive', '2026-01-13', '22:31:00', 'pending', 0, NULL, 0, '2026-01-06 18:31:10', '2026-01-06 18:31:10'),
(20, 28, NULL, 'Non ut non similique', 'non-medical', 'Details', 'Meal / Grocery Assistance', 'Time-Sensitive', '2026-01-23', '16:27:00', 'pending', 0, NULL, 0, '2026-01-17 00:24:40', '2026-01-17 00:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_comments`
--

INSERT INTO `task_comments` (`id`, `task_id`, `user_id`, `parent_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 28, 0, 'I need time to confirm based on my availability', '2025-12-02 19:48:04', '2025-12-02 19:48:04'),
(2, 12, 27, 0, '1221', '2025-12-23 00:17:57', '2025-12-23 00:17:57'),
(3, 9, 29, 0, 'dsad', '2025-12-24 19:05:26', '2025-12-24 19:05:26'),
(4, 9, 29, 3, 'dsdsa', '2025-12-24 19:05:32', '2025-12-24 19:05:32'),
(5, 9, 29, 0, 'dssd', '2025-12-24 19:08:52', '2025-12-24 19:08:52'),
(6, 13, 27, 0, 'dsad', '2025-12-24 20:40:34', '2025-12-24 20:40:34'),
(7, 13, 29, 0, 'dsadas', '2025-12-25 00:24:39', '2025-12-25 00:24:39'),
(8, 13, 27, 0, 'dsad', '2025-12-26 17:25:05', '2025-12-26 17:25:05'),
(9, 13, 27, 0, 'das', '2025-12-26 17:26:35', '2025-12-26 17:26:35'),
(10, 13, 27, 0, 'dsad', '2025-12-26 17:28:24', '2025-12-26 17:28:24'),
(11, 13, 29, 0, 'okk', '2025-12-26 17:29:46', '2025-12-26 17:29:46'),
(12, 19, 27, 0, 'dsad', '2026-01-12 17:34:46', '2026-01-12 17:34:46'),
(13, 17, 27, 0, 'hhfgh', '2026-01-21 21:12:03', '2026-01-21 21:12:03'),
(14, 17, 27, 0, '132', '2026-01-21 21:14:37', '2026-01-21 21:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_has_child` int(11) NOT NULL DEFAULT 0 COMMENT '0=no child, 1 has child',
  `child_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `owner_id`, `owner_has_child`, `child_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2025-10-02 01:38:08', '2025-10-02 01:38:08'),
(2, 1, 1, 3, '2025-10-02 02:16:02', '2025-10-02 02:16:02'),
(3, 1, 1, 5, '2025-10-07 07:40:17', '2025-10-07 07:40:17'),
(4, 1, 1, 10, '2025-10-23 22:49:58', '2025-10-23 22:49:58'),
(5, 1, 1, 11, '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(6, 1, 1, 12, '2025-10-30 04:06:00', '2025-10-30 04:06:00'),
(7, 1, 1, 13, '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(8, 18, 1, 19, '2025-11-06 21:33:05', '2025-11-06 21:33:05'),
(9, 18, 1, 20, '2025-11-06 21:37:20', '2025-11-06 21:37:20'),
(10, 18, 1, 21, '2025-11-06 21:41:19', '2025-11-06 21:41:19'),
(11, 18, 1, 22, '2025-11-06 22:14:00', '2025-11-06 22:14:00'),
(12, 18, 1, 23, '2025-11-06 22:48:16', '2025-11-06 22:48:16'),
(13, 18, 1, 24, '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(14, 18, 1, 25, '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(15, 27, 1, 28, '2025-11-25 23:23:13', '2025-11-25 23:23:13'),
(16, 27, 1, 29, '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(17, 27, 1, 30, '2025-11-25 23:31:07', '2025-11-25 23:31:07'),
(18, 1, 1, 31, '2025-12-09 17:40:57', '2025-12-09 17:40:57'),
(19, 1, 1, 32, '2025-12-09 23:07:58', '2025-12-09 23:07:58'),
(20, 33, 1, 34, '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(21, 27, 1, 35, '2025-12-30 18:15:59', '2025-12-30 18:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_logs`
--

CREATE TABLE `timeline_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `feature_name` varchar(122) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `family_owner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  `action_desc` text NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0 COMMENT '0=not read, 1=read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timeline_logs`
--

INSERT INTO `timeline_logs` (`id`, `feature_name`, `feature_id`, `family_owner_id`, `name`, `action_name`, `action_desc`, `is_read`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Rogan Gould as Member ', 0, '2025-10-02 01:38:09', '2025-10-02 01:38:09'),
(2, NULL, NULL, 1, 'Family owner', 'Created senior', ' Family owner Created senior as Senior ', 0, '2025-10-02 02:16:02', '2025-10-02 02:16:02'),
(3, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created senior as Member ', 0, '2025-10-02 02:16:02', '2025-10-02 02:16:02'),
(4, NULL, NULL, 2, 'Rogan Gould', 'Document Requested', ' Rogan Gould Requested for Document to Rogan Gould', 0, '2025-10-03 00:16:20', '2025-10-03 00:16:20'),
(5, NULL, NULL, 2, 'Rogan Gould', 'Document Requested', ' Rogan Gould Requested for Document to Rogan Gould', 0, '2025-10-03 00:50:14', '2025-10-03 00:50:14'),
(6, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Tana Frank as Member ', 0, '2025-10-07 07:40:17', '2025-10-07 07:40:17'),
(7, NULL, NULL, 5, 'Tana Frank', 'Document Requested', ' Tana Frank Requested for Document to Rogan Gould', 0, '2025-10-08 06:34:33', '2025-10-08 06:34:33'),
(8, NULL, NULL, 5, 'Tana Frank', 'Document Requested', ' Tana Frank Requested for Document to Tana Frank', 0, '2025-10-08 06:35:10', '2025-10-08 06:35:10'),
(9, NULL, NULL, 1, 'Tana Frank', 'Added contribution', ' Tana Frank Added contribution Shortfall ', 0, '2025-10-08 07:21:22', '2025-10-08 07:21:22'),
(10, NULL, NULL, 1, 'Tana Frank', 'Added contribution', ' Tana Frank Added contribution Contribution ', 0, '2025-10-08 07:21:37', '2025-10-08 07:21:37'),
(11, NULL, NULL, 1, 'Tana Frank', 'Added contribution', ' Tana Frank Added contribution Shortfall ', 0, '2025-10-08 07:22:16', '2025-10-08 07:22:16'),
(12, NULL, NULL, 1, 'Tana Frank', 'Added Reimbursement', ' Tana Frank Added Reimbursement Request for 65 ', 0, '2025-10-08 07:25:26', '2025-10-08 07:25:26'),
(13, NULL, NULL, 1, 'Tana Frank', 'Added Reimbursement', ' Tana Frank Added Reimbursement Request for 65 ', 0, '2025-10-08 07:25:38', '2025-10-08 07:25:38'),
(14, NULL, NULL, 1, 'Family owner', 'Created Pool', ' Family owner Created Pool', 0, '2025-10-08 07:43:16', '2025-10-08 07:43:16'),
(15, NULL, NULL, 1, 'Family owner', 'Updated Pool', ' Family owner Updated Pool', 0, '2025-10-08 07:43:47', '2025-10-08 07:43:47'),
(16, NULL, NULL, 1, 'Family owner', 'Comment on task', ' Family owner Commented on Task for ', 0, '2025-10-15 02:17:22', '2025-10-15 02:17:22'),
(17, NULL, NULL, 1, 'Family owner', 'Task Deleted', ' Family owner Deleted Task forRogan Gould ', 0, '2025-10-16 01:27:36', '2025-10-16 01:27:36'),
(18, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-17 00:34:57', '2025-10-17 00:34:57'),
(19, NULL, NULL, 1, 'Family owner', 'Created senior', ' Family owner Created Joel Cash as Senior ', 0, '2025-10-23 22:49:58', '2025-10-23 22:49:58'),
(20, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Joel Cash as Member ', 0, '2025-10-23 22:49:58', '2025-10-23 22:49:58'),
(21, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event and in this event your senior is also invited.', 0, '2025-10-23 22:54:15', '2025-10-23 22:54:15'),
(22, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event in which event your senior is also invited.', 0, '2025-10-23 22:54:15', '2025-10-23 22:54:15'),
(23, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event in which event your senior is also invited.', 0, '2025-10-23 23:02:36', '2025-10-23 23:02:36'),
(24, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event in which event your senior is also invited.', 0, '2025-10-23 23:02:36', '2025-10-23 23:02:36'),
(25, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event in which event your senior is also invited.', 0, '2025-10-24 23:01:47', '2025-10-24 23:01:47'),
(26, NULL, NULL, 1, 'Administrator', 'Updated event', ' AdministratorUpdated event in which event your senior is also invited.', 0, '2025-10-24 23:02:10', '2025-10-24 23:02:10'),
(27, NULL, NULL, 9, 'Administrator', 'Updated Meeting Details', ' Administrator is Updated Scheduled or Started Meeting', 0, '2025-10-28 21:10:59', '2025-10-28 21:10:59'),
(28, NULL, NULL, 9, 'Administrator', 'Updated Meeting Details', ' Administrator is Updated Scheduled or Started Meeting', 0, '2025-10-28 21:11:09', '2025-10-28 21:11:09'),
(29, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:14:23', '2025-10-28 21:14:23'),
(30, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:14:55', '2025-10-28 21:14:55'),
(31, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:21:27', '2025-10-28 21:21:27'),
(32, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:23:47', '2025-10-28 21:23:47'),
(33, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:30:25', '2025-10-28 21:30:25'),
(34, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:31:02', '2025-10-28 21:31:02'),
(35, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:31:10', '2025-10-28 21:31:10'),
(36, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:31:25', '2025-10-28 21:31:25'),
(37, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated senior as Senior ', 0, '2025-10-28 21:31:49', '2025-10-28 21:31:49'),
(38, NULL, NULL, 1, 'Rogan Gould', 'Added contribution', ' Rogan Gould Added contribution Contribution ', 0, '2025-10-28 21:37:06', '2025-10-28 21:37:06'),
(39, NULL, NULL, 1, 'senior', 'Added contribution', ' senior Added contribution Contribution ', 0, '2025-10-28 21:58:34', '2025-10-28 21:58:34'),
(40, NULL, NULL, 1, 'Family owner', 'Created Bill', ' Family owner Created for adsadsd which ammount is $78 ', 0, '2025-10-28 22:21:25', '2025-10-28 22:21:25'),
(41, NULL, NULL, 1, 'senior', 'Added contribution', ' senior Added contribution Contribution ', 0, '2025-10-28 22:23:28', '2025-10-28 22:23:28'),
(42, NULL, NULL, 3, 'senior', 'Payment submitted', ' senior Payment sent for adsadsd which ammount is $78.00 ', 0, '2025-10-28 22:25:00', '2025-10-28 22:25:00'),
(43, NULL, NULL, 1, 'senior', 'Added contribution', ' senior Added contribution Contribution ', 0, '2025-10-28 23:21:56', '2025-10-28 23:21:56'),
(44, NULL, NULL, 1, 'senior', 'Added contribution', ' senior Added contribution Contribution ', 0, '2025-10-28 23:22:53', '2025-10-28 23:22:53'),
(45, NULL, NULL, 1, 'senior', 'Added contribution', ' senior Added contribution Shortfall ', 0, '2025-10-29 01:53:45', '2025-10-29 01:53:45'),
(46, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to senior', 0, '2025-10-29 21:32:00', '2025-10-29 21:32:00'),
(47, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 21:33:13', '2025-10-29 21:33:13'),
(48, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 21:33:28', '2025-10-29 21:33:28'),
(49, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:02:16', '2025-10-29 22:02:16'),
(50, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:03:02', '2025-10-29 22:03:02'),
(51, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:03:21', '2025-10-29 22:03:21'),
(52, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:03:43', '2025-10-29 22:03:43'),
(53, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:04:04', '2025-10-29 22:04:04'),
(54, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:04:36', '2025-10-29 22:04:36'),
(55, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:04:50', '2025-10-29 22:04:50'),
(56, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:06:07', '2025-10-29 22:06:07'),
(57, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:07:08', '2025-10-29 22:07:08'),
(58, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:09:48', '2025-10-29 22:09:48'),
(59, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Joel Cash', 0, '2025-10-29 22:10:49', '2025-10-29 22:10:49'),
(60, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Sybill Short as Member ', 0, '2025-10-30 04:04:38', '2025-10-30 04:04:38'),
(61, NULL, NULL, 1, 'Family owner', 'Created senior', ' Family owner Created Alyssa Poole as Senior ', 0, '2025-10-30 04:06:00', '2025-10-30 04:06:00'),
(62, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Alyssa Poole as Member ', 0, '2025-10-30 04:06:01', '2025-10-30 04:06:01'),
(63, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Uriel Dalton as Member ', 0, '2025-10-30 04:35:43', '2025-10-30 04:35:43'),
(64, NULL, NULL, 2, 'Rogan Gould', 'Comment on task', ' Rogan Gould Commented on Task for ', 0, '2025-10-31 22:13:08', '2025-10-31 22:13:08'),
(65, NULL, NULL, 1, 'Family owner', 'Created Pool', ' Family owner Created Pool', 0, '2025-11-03 21:32:40', '2025-11-03 21:32:40'),
(66, NULL, NULL, 1, 'Family owner', 'Scheduled Meeting', ' Family owner is Scheduled or Started a Meeting', 0, '2025-11-03 22:56:46', '2025-11-03 22:56:46'),
(67, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Uriel Dalton', 0, '2025-11-04 21:03:28', '2025-11-04 21:03:28'),
(68, NULL, NULL, 1, 'Family owner', 'Created Pool', ' Family owner Created Pool', 0, '2025-11-04 22:09:44', '2025-11-04 22:09:44'),
(69, NULL, NULL, 1, 'Family owner', 'Document Requested', ' Family owner Requested for Document to Alyssa Poole', 0, '2025-11-04 22:54:23', '2025-11-04 22:54:23'),
(70, NULL, NULL, 18, 'Roth Sears TaShya Cannon', 'Created Family member', ' Roth Sears TaShya Cannon Created Aubrey Cantrell as Member ', 0, '2025-11-06 21:38:45', '2025-11-06 21:38:45'),
(71, NULL, NULL, 18, 'Roth Sears TaShya Cannon', 'Created Family member', ' Roth Sears TaShya Cannon Created Cora Forbes as Member ', 0, '2025-11-06 21:41:19', '2025-11-06 21:41:19'),
(72, NULL, NULL, 18, 'Roth Sears TaShya Cannon', 'Created Family member', ' Roth Sears TaShya Cannon Created Cheyenne Malone as Member ', 0, '2025-11-06 22:48:16', '2025-11-06 22:48:16'),
(73, NULL, NULL, 18, 'Roth Sears TaShya Cannon', 'Created Family member', ' Roth Sears TaShya Cannon Created Inez Robles as Member ', 0, '2025-11-06 23:16:32', '2025-11-06 23:16:32'),
(74, NULL, NULL, 18, 'Roth Sears TaShya Cannon', 'Created Family member', ' Roth Sears TaShya Cannon Created Marcia Burns as Member ', 0, '2025-11-06 23:18:45', '2025-11-06 23:18:45'),
(75, NULL, NULL, 3, 'senior', 'Comment on task', ' senior Commented on Task for ', 0, '2025-11-07 01:51:53', '2025-11-07 01:51:53'),
(76, NULL, NULL, 1, 'Family owner', 'Task updated', ' Family owner Updated Task forsenior ', 0, '2025-11-13 04:28:32', '2025-11-13 04:28:32'),
(77, NULL, NULL, 3, 'senior', 'Created Bill', ' senior Created for Quia temporibus ipsu which ammount is $54 ', 0, '2025-11-13 21:15:30', '2025-11-13 21:15:30'),
(78, NULL, NULL, 1, 'Family owner', 'Comment on task', ' Family owner Commented on Task for ', 0, '2025-11-15 02:03:07', '2025-11-15 02:03:07'),
(79, NULL, NULL, 1, 'Rogan Gould', 'Added contribution', ' Rogan Gould Added contribution Contribution ', 0, '2025-11-15 02:31:27', '2025-11-15 02:31:27'),
(80, NULL, NULL, 2, 'Rogan Gould', 'Created Bill', ' Rogan Gould Created for Fugit repudiandae d which ammount is $51 ', 0, '2025-11-15 02:33:10', '2025-11-15 02:33:10'),
(81, NULL, NULL, 1, 'Family owner', 'Updated senior', ' Family owner Updated Joel Cash as Senior ', 0, '2025-11-15 02:35:17', '2025-11-15 02:35:17'),
(82, NULL, NULL, 10, 'Joel Cash', 'Payment submitted', ' Joel Cash Payment sent for Fugit repudiandae d which ammount is $51.00 ', 0, '2025-11-15 02:37:41', '2025-11-15 02:37:41'),
(83, NULL, NULL, 27, 'Magee Kinney', 'Created Family member', ' Magee Kinney Created Cathy Jamison as Member ', 0, '2025-11-25 23:23:14', '2025-11-25 23:23:14'),
(84, NULL, NULL, 27, 'Magee Kinney', 'Created Family member', ' Magee Kinney Created Sebastian as Member ', 0, '2025-11-25 23:26:11', '2025-11-25 23:26:11'),
(85, NULL, NULL, 27, 'Magee Kinney', 'Created senior', ' Magee Kinney Created Kevin Dorris as Senior ', 0, '2025-11-25 23:31:07', '2025-11-25 23:31:07'),
(86, NULL, NULL, 27, 'Magee Kinney', 'Created Family member', ' Magee Kinney Created Kevin Dorris as Member ', 0, '2025-11-25 23:31:07', '2025-11-25 23:31:07'),
(87, NULL, NULL, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task for ', 0, '2025-11-26 00:03:29', '2025-11-26 00:03:29'),
(88, NULL, NULL, 27, 'Magee Kinney', 'Document Requested', ' Magee Kinney Requested for Document to Kevin Dorris', 0, '2025-11-26 00:24:38', '2025-11-26 00:24:38'),
(89, NULL, NULL, 30, 'Kevin Dorris', 'Document Requested', ' Kevin Dorris Submitted Document to Kevin Dorris', 0, '2025-11-26 00:25:24', '2025-11-26 00:25:24'),
(90, NULL, NULL, 27, 'Magee Kinney', 'File downloaded', ' Magee Kinney has downloaded file which was uploaded by Magee Kinney after request', 0, '2025-11-26 23:29:51', '2025-11-26 23:29:51'),
(91, NULL, NULL, 27, 'Magee Kinney', 'File downloaded', ' Magee Kinney has downloaded file which was uploaded by Magee Kinney after request', 0, '2025-11-26 23:30:02', '2025-11-26 23:30:02'),
(92, NULL, NULL, 28, 'Cathy Jamison', 'Comment on task', ' Cathy Jamison Commented on Task for ', 0, '2025-12-02 19:48:04', '2025-12-02 19:48:04'),
(93, NULL, NULL, 27, 'Magee Kinney', 'Document Requested', ' Magee Kinney Requested for Document to Cathy Jamison', 0, '2025-12-02 19:52:10', '2025-12-02 19:52:10'),
(94, NULL, NULL, 28, 'Cathy Jamison', 'Document Requested', ' Cathy Jamison Submitted Document to Cathy Jamison', 0, '2025-12-02 19:54:44', '2025-12-02 19:54:44'),
(95, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Dad\'s home electricity Bill which ammount is $230 ', 0, '2025-12-02 19:59:15', '2025-12-02 19:59:15'),
(96, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for dad\'s electricity bill which ammount is $250 ', 0, '2025-12-02 20:01:04', '2025-12-02 20:01:04'),
(97, NULL, NULL, 27, 'Cathy Jamison', 'Added contribution', ' Cathy Jamison Added contribution Contribution ', 0, '2025-12-02 20:06:12', '2025-12-02 20:06:12'),
(98, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Totam qui architecto which ammount is $31 ', 0, '2025-12-02 20:45:09', '2025-12-02 20:45:09'),
(99, NULL, NULL, 28, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for dad\'s electricity bill which ammount is $250.00 ', 0, '2025-12-02 21:00:45', '2025-12-02 21:00:45'),
(100, NULL, NULL, 28, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for dad\'s electricity bill which ammount is $250.00 ', 0, '2025-12-02 21:08:47', '2025-12-02 21:08:47'),
(101, NULL, NULL, 27, 'Cathy Jamison', 'Added Reimbursement', ' Cathy Jamison Added Reimbursement Request for 450 ', 0, '2025-12-02 21:23:32', '2025-12-02 21:23:32'),
(102, NULL, NULL, 27, 'Magee Kinney', 'Added Reimbursement', ' Magee Kinney Added Reimbursement Request for 61 ', 0, '2025-12-02 21:59:18', '2025-12-02 21:59:18'),
(103, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Totam qui architecto which ammount is $31.00 ', 0, '2025-12-03 17:34:06', '2025-12-03 17:34:06'),
(104, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Therapy which ammount is $300 ', 0, '2025-12-03 17:36:44', '2025-12-03 17:36:44'),
(105, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Therapy which ammount is $300.00 ', 0, '2025-12-03 17:37:30', '2025-12-03 17:37:30'),
(106, NULL, NULL, 27, 'Cathy Jamison', 'Added Reimbursement', ' Cathy Jamison Added Reimbursement Request for 80 ', 0, '2025-12-03 17:39:33', '2025-12-03 17:39:33'),
(107, NULL, NULL, 28, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for Dad\'s home electricity Bill which ammount is $230.00 ', 0, '2025-12-03 17:40:27', '2025-12-03 17:40:27'),
(108, NULL, NULL, 28, 'Cathy Jamison', 'Created Bill', ' Cathy Jamison Created for Test Appointment which ammount is $500 ', 0, '2025-12-03 18:40:09', '2025-12-03 18:40:09'),
(109, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Test Appointment which ammount is $500.00 ', 0, '2025-12-03 18:40:45', '2025-12-03 18:40:45'),
(110, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Test Appointment which ammount is $500.00 ', 0, '2025-12-03 18:43:14', '2025-12-03 18:43:14'),
(111, NULL, NULL, 28, 'Cathy Jamison', 'Created Bill', ' Cathy Jamison Created for Test Appointment which ammount is $500 ', 0, '2025-12-03 18:50:41', '2025-12-03 18:50:41'),
(112, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Test Appointment which ammount is $500.00 ', 0, '2025-12-03 18:58:21', '2025-12-03 18:58:21'),
(113, NULL, NULL, 27, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Contribution ', 0, '2025-12-03 19:00:36', '2025-12-03 19:00:36'),
(114, NULL, NULL, 27, 'Magee Kinney', 'Task updated', ' Magee Kinney Updated Task forCathy Jamison ', 0, '2025-12-03 21:55:13', '2025-12-03 21:55:13'),
(115, NULL, NULL, 27, 'Magee Kinney', 'Document Requested', ' Magee Kinney Requested for Document to Cathy Jamison', 0, '2025-12-03 22:30:42', '2025-12-03 22:30:42'),
(116, NULL, NULL, 28, 'Cathy Jamison', 'Document Requested', ' Cathy Jamison Submitted Document to Cathy Jamison', 0, '2025-12-03 22:39:04', '2025-12-03 22:39:04'),
(117, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Eye doctor which ammount is $350 ', 0, '2025-12-03 22:45:18', '2025-12-03 22:45:18'),
(118, NULL, NULL, 28, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for Eye doctor which ammount is $350.00 ', 0, '2025-12-03 22:46:17', '2025-12-03 22:46:17'),
(119, NULL, NULL, 27, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Shortfall ', 0, '2025-12-03 22:48:10', '2025-12-03 22:48:10'),
(120, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Test Appointment which ammount is $500.00 ', 0, '2025-12-03 23:00:21', '2025-12-03 23:00:21'),
(121, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Groceries which ammount is $99 ', 0, '2025-12-03 23:04:30', '2025-12-03 23:04:30'),
(122, NULL, NULL, 27, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Contribution ', 0, '2025-12-03 23:05:45', '2025-12-03 23:05:45'),
(123, NULL, NULL, 27, 'Cathy Jamison', 'Added Reimbursement', ' Cathy Jamison Added Reimbursement Request for 150 ', 0, '2025-12-03 23:20:49', '2025-12-03 23:20:49'),
(124, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Groceries which ammount is $500 ', 0, '2025-12-03 23:24:08', '2025-12-03 23:24:08'),
(125, NULL, NULL, 27, 'Magee Kinney', 'Created Pool', ' Magee Kinney Created Pool', 0, '2025-12-04 00:06:28', '2025-12-04 00:06:28'),
(126, NULL, NULL, 27, 'Cathy Jamison', 'Added contribution', ' Cathy Jamison Added contribution Shortfall ', 0, '2025-12-04 22:42:58', '2025-12-04 22:42:58'),
(127, NULL, NULL, 29, 'Sebastian', 'Created Bill', ' Sebastian Created for Tester1234 which ammount is $1220 ', 0, '2025-12-04 22:45:37', '2025-12-04 22:45:37'),
(128, NULL, NULL, 27, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Shortfall ', 0, '2025-12-04 22:47:35', '2025-12-04 22:47:35'),
(129, NULL, NULL, 28, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for Tester1234 which ammount is $1220.00 ', 0, '2025-12-04 22:48:57', '2025-12-04 22:48:57'),
(130, NULL, NULL, 28, 'Cathy Jamison', 'Created Bill', ' Cathy Jamison Created for Tester1234 which ammount is $1000 ', 0, '2025-12-04 22:52:11', '2025-12-04 22:52:11'),
(131, NULL, NULL, 27, 'Cathy Jamison', 'Added contribution', ' Cathy Jamison Added contribution Contribution ', 0, '2025-12-04 22:53:55', '2025-12-04 22:53:55'),
(132, NULL, NULL, 29, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2025-12-04 22:55:38', '2025-12-04 22:55:38'),
(133, NULL, NULL, 27, 'Magee Kinney', 'Updated senior', ' Magee Kinney Updated Kevin Dorris as Senior ', 0, '2025-12-08 17:50:53', '2025-12-08 17:50:53'),
(134, NULL, NULL, 2, 'Rogan Gould', 'Created Bill', ' Rogan Gould Created for Aut eiusmod ipsa ex which ammount is $23 ', 0, '2025-12-09 00:06:30', '2025-12-09 00:06:30'),
(135, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Myles Tyler as Member ', 0, '2025-12-09 17:40:58', '2025-12-09 17:40:58'),
(136, NULL, NULL, 1, 'Family owner', 'Created Family member', ' Family owner Created Chaim Dunn as Member ', 0, '2025-12-09 23:07:58', '2025-12-09 23:07:58'),
(137, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinneyis created Open task  ', 0, '2025-12-11 02:01:52', '2025-12-11 02:01:52'),
(138, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toKevin Dorris  ', 0, '2025-12-11 02:02:41', '2025-12-11 02:02:41'),
(139, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toCathy Jamison  ', 0, '2025-12-11 02:03:55', '2025-12-11 02:03:55'),
(140, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toMagee Kinney  ', 0, '2025-12-11 02:04:11', '2025-12-11 02:04:11'),
(141, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toCathy Jamison  ', 0, '2025-12-11 02:06:02', '2025-12-11 02:06:02'),
(142, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toCathy Jamison  ', 0, '2025-12-11 02:06:28', '2025-12-11 02:06:28'),
(143, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-12 17:29:06', '2025-12-12 17:29:06'),
(144, NULL, NULL, 33, 'Deanna Knapp Karina Elliott', 'Scheduled Meeting', ' Deanna Knapp Karina Elliott is Scheduled or Started a Meeting', 0, '2025-12-13 01:19:37', '2025-12-13 01:19:37'),
(145, NULL, NULL, 33, 'Deanna Knapp Karina Elliott', 'Created Family member', ' Deanna Knapp Karina Elliott Created Claudia Livingston as Member ', 0, '2025-12-13 01:21:05', '2025-12-13 01:21:05'),
(146, NULL, NULL, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toSebastian  ', 0, '2025-12-22 18:55:36', '2025-12-22 18:55:36'),
(147, NULL, NULL, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task for ', 0, '2025-12-23 00:17:57', '2025-12-23 00:17:57'),
(148, 'task_update', NULL, 29, 'Sebastian', 'Task Accepted and Assigned', '  Task Accepted and Assigned toSebastian', 0, '2025-12-24 18:43:28', '2025-12-24 18:43:28'),
(149, NULL, NULL, 29, 'Sebastian', 'Comment on task', ' Sebastian Commented on Task for ', 0, '2025-12-24 19:05:26', '2025-12-24 19:05:26'),
(150, NULL, NULL, 29, 'Sebastian', 'Comment on task', ' Sebastian Commented on Task for ', 0, '2025-12-24 19:05:32', '2025-12-24 19:05:32'),
(151, NULL, NULL, 29, 'Sebastian', 'Comment on task', ' Sebastian Commented on Task for ', 0, '2025-12-24 19:08:52', '2025-12-24 19:08:52'),
(152, NULL, NULL, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task for ', 0, '2025-12-24 20:40:34', '2025-12-24 20:40:34'),
(153, 'task_update', NULL, 29, 'Sebastian', 'Comment on task', ' Sebastian Commented on Task for ', 0, '2025-12-25 00:24:39', '2025-12-25 00:24:39'),
(154, 'task_update', NULL, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task for ', 0, '2025-12-26 17:25:05', '2025-12-26 17:25:05'),
(155, 'task_update', 13, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task for ', 0, '2025-12-26 17:26:35', '2025-12-26 17:26:35'),
(156, 'task_update', 13, 27, 'Magee Kinney', 'Comment on task', ' Magee Kinney Commented on Task \'<small>\'.dsad.\'</small>\' ', 0, '2025-12-26 17:28:24', '2025-12-26 17:28:24'),
(157, 'task_update', 13, 29, 'Sebastian', 'Comment on task', ' Sebastian Commented on Task \'<small>\'.okk.\'</small>\' ', 0, '2025-12-26 17:29:46', '2025-12-26 17:29:46'),
(158, 'task_update', 13, 29, 'Sebastian', 'Task status update', '  Task status changed to in_progress By Sebastian', 0, '2025-12-26 17:33:39', '2025-12-26 17:33:39'),
(159, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-26 21:08:09', '2025-12-26 21:08:09'),
(160, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-29 19:17:48', '2025-12-29 19:17:48'),
(161, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-29 19:26:03', '2025-12-29 19:26:03'),
(162, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-29 19:26:21', '2025-12-29 19:26:21'),
(163, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-29 19:26:59', '2025-12-29 19:26:59'),
(164, NULL, NULL, 27, 'Magee Kinney', 'Scheduled Meeting', ' Magee Kinney is Scheduled or Started a Meeting', 0, '2025-12-29 19:35:05', '2025-12-29 19:35:05'),
(165, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 21:51:43', '2025-12-29 21:51:43'),
(166, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 21:53:29', '2025-12-29 21:53:29'),
(167, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:02:36', '2025-12-29 22:02:36'),
(168, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:04:35', '2025-12-29 22:04:35'),
(169, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:05:31', '2025-12-29 22:05:31'),
(170, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:05:41', '2025-12-29 22:05:41'),
(171, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:07:30', '2025-12-29 22:07:30'),
(172, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:08:10', '2025-12-29 22:08:10'),
(173, 'task_update', 13, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Updated task and assigned toSebastian  ', 0, '2025-12-29 22:13:08', '2025-12-29 22:13:08'),
(174, NULL, NULL, 27, 'Magee Kinney', 'Created Family member', ' Magee Kinney Created Brody Garrison as Member ', 0, '2025-12-30 18:15:59', '2025-12-30 18:15:59'),
(175, NULL, NULL, 35, 'Brody Garrison', 'Added contribution', ' Brody Garrison Added contribution Shortfall ', 0, '2025-12-30 18:48:36', '2025-12-30 18:48:36'),
(176, NULL, NULL, 27, 'Magee Kinney', 'Created Bill', ' Magee Kinney Created for Officia debitis quas which ammount is $64 ', 0, '2025-12-30 23:26:29', '2025-12-30 23:26:29'),
(177, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2025-12-30 23:55:36', '2025-12-30 23:55:36'),
(178, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2025-12-31 00:01:46', '2025-12-31 00:01:46'),
(179, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2025-12-31 00:19:50', '2025-12-31 00:19:50'),
(180, NULL, NULL, 29, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Contribution ', 0, '2025-12-31 00:22:43', '2025-12-31 00:22:43'),
(181, NULL, NULL, 29, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Contribution ', 0, '2025-12-31 00:23:12', '2025-12-31 00:23:12'),
(182, NULL, NULL, 29, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Contribution ', 0, '2025-12-31 00:39:02', '2025-12-31 00:39:02'),
(183, NULL, NULL, 29, 'Sebastian', 'Added contribution', ' Sebastian Added contribution Shortfall ', 0, '2025-12-31 00:39:33', '2025-12-31 00:39:33'),
(184, NULL, NULL, 27, 'Magee Kinney', 'Banking document', ' Magee Kinney Uploaded Banking document', 0, '2026-01-02 22:13:08', '2026-01-02 22:13:08'),
(185, NULL, NULL, 27, 'Magee Kinney', 'Banking document', ' Magee Kinney Uploaded Banking document', 0, '2026-01-02 22:14:03', '2026-01-02 22:14:03'),
(186, NULL, NULL, 27, 'Magee Kinney', 'Banking document', ' Magee Kinney Uploaded Banking document', 0, '2026-01-02 22:22:50', '2026-01-02 22:22:50'),
(187, NULL, NULL, 27, 'Magee Kinney', 'Banking document', ' Magee Kinney Uploaded Banking document', 0, '2026-01-02 22:23:58', '2026-01-02 22:23:58'),
(188, NULL, NULL, 27, 'Magee Kinney', 'Banking document', ' Magee Kinney Uploaded Banking document', 0, '2026-01-02 22:33:41', '2026-01-02 22:33:41'),
(189, 'task_update', 14, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toBrody Garrison  ', 0, '2026-01-05 19:51:41', '2026-01-05 19:51:41'),
(190, 'task_update', 15, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toBrody Garrison  ', 0, '2026-01-05 19:52:20', '2026-01-05 19:52:20'),
(191, 'task_update', 16, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toMagee Kinney  ', 0, '2026-01-05 19:52:40', '2026-01-05 19:52:40'),
(192, 'task_update', 17, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toBrody Garrison  ', 0, '2026-01-05 19:52:46', '2026-01-05 19:52:46'),
(193, 'task_update', 17, 27, 'Brody Garrison', 'Task status update', '  Task status changed to in_progress By Brody Garrison', 0, '2026-01-05 19:53:29', '2026-01-05 19:53:29'),
(194, 'task_update', 17, 27, 'Brody Garrison', 'Task status update', '  Task status changed to Accepted By Brody Garrison', 0, '2026-01-05 19:54:07', '2026-01-05 19:54:07'),
(195, 'task_update', 17, 27, 'Brody Garrison', 'Task status update', '  Task status changed to completed By Brody Garrison', 0, '2026-01-05 19:54:31', '2026-01-05 19:54:31'),
(196, NULL, NULL, 1, 'senior', 'Emergency', ' senior is required help for Document / Paperwork, emergency_help', 0, '2026-01-06 00:25:47', '2026-01-06 00:25:47'),
(197, NULL, NULL, 1, 'senior', 'Emergency', ' senior is required help for Document / Paperwork, emergency_help', 0, '2026-01-06 00:39:08', '2026-01-06 00:39:08'),
(198, NULL, NULL, 27, 'Kevin Dorris', 'Emergency', ' Kevin Dorris is required help for Pet Care / Animal Support, emergency_help', 1, '2026-01-06 00:40:38', '2026-01-06 00:40:38'),
(199, 'emergency_help', NULL, 27, 'Kevin Dorris', 'Emergency', ' Kevin Dorris is required help for Appointment / Transportation Senior set Title is i need some ungent help ', 1, '2026-01-06 17:35:32', '2026-01-06 18:31:10'),
(200, 'task_update', 18, 27, 'Magee Kinney', 'Task created', ' Magee Kinney is created Open task  ', 0, '2026-01-06 18:04:21', '2026-01-06 18:04:21'),
(201, 'task_update', 19, 27, 'Magee Kinney', 'Task created', ' Magee Kinney Created task and assigned toKevin Dorris  ', 0, '2026-01-06 18:31:10', '2026-01-06 18:31:10'),
(202, 'task_update', 19, 27, 'Magee Kinney', 'Commented on task', ' Magee Kinney Commented on Task \'<small>\'.dsad.\'</small>\' ', 0, '2026-01-12 17:34:46', '2026-01-12 17:34:46'),
(203, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Officia debitis quas which ammount is $64.00 ', 0, '2026-01-16 17:38:32', '2026-01-16 17:38:32'),
(204, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2026-01-16 18:12:07', '2026-01-16 18:12:07'),
(205, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2026-01-16 18:13:55', '2026-01-16 18:13:55'),
(206, NULL, NULL, 27, 'Sebastian', 'Payment submitted', ' Sebastian Payment sent for Tester1234 which ammount is $1000.00 ', 0, '2026-01-16 18:27:31', '2026-01-16 18:27:31'),
(207, 'task_update', 20, 27, 'Cathy Jamison', 'Task created', ' Cathy Jamison is created Open task  ', 0, '2026-01-17 00:24:40', '2026-01-17 00:24:40'),
(208, 'task_update', 17, 27, 'Magee Kinney', 'Commented on task', ' Magee Kinney Commented on Task \'<small>\'.hhfgh.\'</small>\' ', 0, '2026-01-21 21:12:03', '2026-01-21 21:12:03'),
(209, 'task_update', 17, 27, 'Magee Kinney', 'Commented on task', ' Magee Kinney Commented on Task \'<small>\'.132.\'</small>\' ', 0, '2026-01-21 21:14:37', '2026-01-21 21:14:37'),
(210, NULL, NULL, 27, 'Cathy Jamison', 'Payment submitted', ' Cathy Jamison Payment sent for Tester1234 which ammount is $1220.00 ', 0, '2026-01-21 21:17:33', '2026-01-21 21:17:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `other_role_name` varchar(200) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `d_pic` varchar(122) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cus_phone` varchar(122) DEFAULT NULL,
  `price_id` varchar(122) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `account_status` int(11) NOT NULL DEFAULT 0 COMMENT '0=active, 1=inactive, 2=deleted',
  `device_token` varchar(500) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `google_id` varchar(122) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `other_role_name`, `name`, `d_pic`, `email`, `cus_phone`, `price_id`, `email_verified_at`, `password`, `account_status`, `device_token`, `last_login`, `google_id`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, 4, NULL, 'Family owner', '1762540790_ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'family_owner18@familyowner.com', '(164) 974-1733', NULL, NULL, '$2y$12$TmLIAKZmFcTKbvq9aTGXWuBtnnSUle9Y..yp8EfbvKJIYFrYZGnhi', 0, NULL, '2026-01-07 01:00:10', NULL, NULL, '2025-10-02 00:50:02', '2026-01-07 01:00:10', 'cus_TAY0J5mV3YDH2s', 'mastercard', '8210', NULL),
(2, 3, NULL, 'Rogan Gould', '1759343888ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'family_member1@familymember.com', '+525458878', NULL, NULL, '$2y$12$suFVmqJPvbLO8JDxeSFWhe14o4tqsAU1iIrlBKVJEuyeHx2nY26Ce', 0, NULL, '2025-11-28 23:40:37', NULL, NULL, '2025-10-02 01:38:08', '2025-11-28 23:40:37', 'cus_TAFmLJNbrlBd7j', NULL, NULL, NULL),
(3, 2, NULL, 'senior', '1759346162ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'senior@senior.com', NULL, NULL, NULL, '$2y$12$ioFQeb5qsFcuDdXpc5qXQ.H4q9W09gHQ5oWD.NMynFg/xexg4IMsS', 0, 'd5zoFsPTcA0DETl-BeZM2x:APA91bHBvoPNKfxp5id4LFbiFr-1GLk17wC1ZspcZTSvuWk6DXFTPZRwRdVSSB-Alk6uslo2Bdgh-U5OcSKHbC9gicHaxTQApOuseM7oCfSaWDaPEJ9yks8', '2026-01-05 21:33:13', NULL, NULL, '2025-10-02 02:16:02', '2026-01-05 21:33:13', NULL, NULL, NULL, NULL),
(4, 4, NULL, 'Cain Bush', 'user_not_found.png', 'kagyj@mailinator.com', NULL, NULL, NULL, '$2y$12$XwSbKu7iYxB7/AS1QFY.5u0iZpDFULla8b5W7aS8XNF/6jaxdPSSu', 0, NULL, NULL, NULL, NULL, '2025-10-07 01:56:21', '2025-10-07 02:04:49', 'cus_TBh65QJa5mEhHH', NULL, NULL, NULL),
(5, 5, NULL, 'Tana Frank', '1759797617ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'caregiver@caregiver.com', NULL, NULL, NULL, '$2y$12$m6Y4rMRBLmneQYfIgSBeQ.3FyRNBra2/hIe7h/5QfmMb7gmzHIn1a', 0, 'd5zoFsPTcA0DETl-BeZM2x:APA91bHBvoPNKfxp5id4LFbiFr-1GLk17wC1ZspcZTSvuWk6DXFTPZRwRdVSSB-Alk6uslo2Bdgh-U5OcSKHbC9gicHaxTQApOuseM7oCfSaWDaPEJ9yks8', '2025-11-05 23:18:00', NULL, NULL, '2025-10-07 07:40:17', '2025-11-05 23:18:00', NULL, NULL, NULL, NULL),
(6, 4, NULL, 'Inez Valencia Timothy Juarez', 'user_not_found.png', 'bocamopo@mailinator.com', NULL, NULL, NULL, '$2y$12$BXZNo7YhfXw1W0ReI5ttUeLGaZELlFNr.b3WXBjzFCsB.6Cl2RSea', 0, NULL, NULL, NULL, NULL, '2025-10-16 00:52:18', '2025-10-16 00:52:18', NULL, NULL, NULL, NULL),
(7, 4, NULL, 'Yetta Bond Wyoming Brewer', 'user_not_found.png', 'cevupyw@mailinator.com', NULL, NULL, NULL, '$2y$12$tP0OefIz632qliqgeb6sDOB1UK60ml.qOl0fBVTRKZ/3XR08FvoQa', 0, NULL, NULL, NULL, NULL, '2025-10-16 00:54:06', '2025-10-16 00:54:06', NULL, NULL, NULL, NULL),
(8, 4, NULL, 'Camden Mooney Reuben Quinn', 'user_not_found.png', 'testidsdng@yopmail.com', NULL, NULL, NULL, '$2y$12$WUu3j/VGGycFDAvUit8Gte.h4XRM/ckZpkFoAvF/veJOhvSAd0yPm', 0, NULL, NULL, NULL, 'zLj0hgbSaudVy4qCl5nOILf3hNEI8xPlfKOlTKZYl1hbHm58jJ8WalJZz9tz', '2025-10-16 00:55:15', '2025-10-16 21:14:15', NULL, NULL, NULL, NULL),
(9, 1, NULL, 'Administrator', 'user_not_found.png', 'admin@admin.com', '+1548748787', NULL, NULL, '$2y$12$TmLIAKZmFcTKbvq9aTGXWuBtnnSUle9Y..yp8EfbvKJIYFrYZGnhi', 0, 'dU7kikBIVidZjO2T7dkraN:APA91bEQXvk46uvQ0c0NiFJthJZJ9kt9z05AdHP-_VODoVo1Jj__voQY6SUlyG8M36QTZmUM5f5Ddtkt77XirTCZVDKwxYcDj3Xaeh0efEvrAXgpl6hNvT4', '2025-12-08 18:27:06', NULL, NULL, '2025-10-02 00:50:02', '2025-12-08 18:27:06', 'cus_TAY0J5mV3YDH2s', 'mastercard', '8210', NULL),
(10, 2, NULL, 'Joel Cash', '1761245398ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'qasajesapa@mailinator.com', NULL, NULL, NULL, '$2y$12$6g.x1eBZ2ob8VCwC23NhwOImHgAd3VHs/uWHdROXC0jPTBPbmuWyy', 0, NULL, '2025-11-15 02:33:39', NULL, NULL, '2025-10-23 22:49:58', '2025-11-15 02:33:39', NULL, NULL, NULL, NULL),
(11, 3, NULL, 'Sybill Short', '1761782678image 2 (1).png', 'fubul@mailinator.com', NULL, NULL, NULL, '$2y$12$J3f2IwXgt.IbYQXdqOxhBuVZXfHgzXwzf9xM8yXUrcRmYJDz5NpRO', 0, NULL, NULL, NULL, NULL, '2025-10-30 04:04:38', '2025-10-30 04:04:38', NULL, NULL, NULL, NULL),
(12, 2, NULL, 'Alyssa Poole', '1761782760image 2 (1) (1).png', 'guzebi@mailinator.com', NULL, NULL, NULL, '$2y$12$95jGBjtpTKph2LcaY9y//u4bmpGcNXNBFdi6.wBYpOefIVC3AlXxe', 0, NULL, NULL, NULL, NULL, '2025-10-30 04:06:00', '2025-10-30 04:06:00', NULL, NULL, NULL, NULL),
(13, 3, NULL, 'Uriel Dalton', '1761784542image 2 (1) (1).png', 'nejajewud@mailinator.com', NULL, NULL, NULL, '$2y$12$QteTFe93BLo.I3/.f0XL9.rsPto7o017q2nm2EMPfsEmp3Amsdl8q', 0, NULL, NULL, NULL, NULL, '2025-10-30 04:35:43', '2025-10-30 04:35:43', NULL, NULL, NULL, NULL),
(14, 4, NULL, 'Neve Whitfield Mikayla Booker', 'user_not_found.png', 'rytujed@mailinator.com', NULL, NULL, NULL, '$2y$12$226NHmzHO26OCN4eAO6LFeIgcWBu.NhnNmKL/J./fIEO3z7laG/CC', 0, NULL, '2025-10-30 22:41:49', NULL, NULL, '2025-10-30 22:41:49', '2025-10-30 22:41:49', NULL, NULL, NULL, NULL),
(15, 4, NULL, 'Amery Gallegos Zelda Curtis', 'user_not_found.png', 'hepoxa@mailinator.com', NULL, NULL, NULL, '$2y$12$FBUyAgy6grkK2dTxCw/Lv.GMj/zptOlpBE.ggQHRRw7NC229/J2YS', 0, NULL, '2025-11-05 04:32:57', NULL, NULL, '2025-11-05 04:32:57', '2025-11-05 04:32:57', NULL, NULL, NULL, NULL),
(16, 4, NULL, 'Kennan Mcneil Noelani Roberson', 'user_not_found.png', 'tixucutode@mailinator.com', NULL, NULL, NULL, '$2y$12$VYBos9lEosEaZOlF.rN8I.lyYrcH4jfkquNjXAWH58jMKwyHYwy9m', 0, NULL, '2025-11-05 05:31:56', NULL, NULL, '2025-11-05 05:31:55', '2025-11-05 05:31:56', NULL, NULL, NULL, NULL),
(17, 4, NULL, 'Amethyst Velasquez Wyoming Garza', 'user_not_found.png', 'hody@mailinator.com', NULL, NULL, NULL, '$2y$12$a.oUehUUpG6O737ILl.PXueyDqPtJhPuaNRNY4OMyH5DnTB913HTG', 0, NULL, '2025-11-05 06:43:11', NULL, NULL, '2025-11-05 06:43:11', '2025-11-05 06:43:11', NULL, NULL, NULL, NULL),
(18, 4, NULL, 'Roth Sears TaShya Cannon', 'user_not_found.png', 'gihipu@mailinator.com', NULL, NULL, NULL, '$2y$12$FLeQ/uckVzlf6C0/hZ5ww.CmomXRE6NaTGiYG0SO7ELz/W4TDlcPu', 0, NULL, '2025-11-07 01:46:59', NULL, NULL, '2025-11-05 06:44:10', '2025-11-07 01:46:59', NULL, NULL, NULL, NULL),
(19, 5, NULL, 'Ivana Tran', '1762446785ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'hady@mailinator.com', NULL, NULL, NULL, '$2y$12$KDMDKzO3OBrGK8uq3FMhiuJ6ILQ74F2XAk1U/I3KsD5GqNkSfiBLu', 0, NULL, NULL, NULL, NULL, '2025-11-06 21:33:05', '2025-11-06 21:33:05', NULL, NULL, NULL, NULL),
(20, 3, NULL, 'Aubrey Cantrell', '1762447040ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'lovefic@mailinator.com', NULL, NULL, NULL, '$2y$12$hB5MwRA87VcP94Dyjp190uOLKjoyqRIRIvtyfHvCu9h19Hi0nPEB.', 0, NULL, NULL, NULL, NULL, '2025-11-06 21:37:20', '2025-11-06 21:37:20', NULL, NULL, NULL, NULL),
(21, 4, NULL, 'Cora Forbes', '1762447279ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'posynuri@mailinator.com', NULL, NULL, NULL, '$2y$12$eqplRYjpjeGv/mdGHBb55uI9LTbXQ0k8FZi.v/gAon1bD3/MDOKZe', 0, NULL, NULL, NULL, NULL, '2025-11-06 21:41:19', '2025-11-06 21:41:19', NULL, NULL, NULL, NULL),
(22, 5, NULL, 'Karleigh Sloan', '1762449239dasdsad.png', 'higuh@mailinator.com', NULL, NULL, NULL, '$2y$12$0o2HYo80TnM3/xD6YLqMyuRG4Mab/q9b7y5NzbDqOJ4/4N9rxwnji', 0, NULL, NULL, NULL, NULL, '2025-11-06 22:14:00', '2025-11-06 22:14:00', NULL, NULL, NULL, NULL),
(23, 4, NULL, 'Cheyenne Malone', '1762451295278-2783229_credit-card-icons-hd-png-download.png', 'robu@mailinator.com', NULL, NULL, NULL, '$2y$12$Nwv.7v.VueV9Dd5nKqtPKeN8UP1L1C43rrRHS4Gfgn1mfSLp5OC2i', 0, NULL, NULL, NULL, NULL, '2025-11-06 22:48:16', '2025-11-06 22:48:16', NULL, NULL, NULL, NULL),
(24, 4, NULL, 'Inez Robles', '1762452992ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'dojuqycego@mailinator.com', NULL, NULL, NULL, '$2y$12$4B1xNURPs4jx5McNsL/SbOezW9K2Nr3Fm53opifaIvDP8LpiH0XDe', 0, NULL, NULL, NULL, NULL, '2025-11-06 23:16:32', '2025-11-06 23:16:32', NULL, NULL, NULL, NULL),
(25, 4, NULL, 'Marcia Burns', '1762453125ChatGPT Image Sep 22_ 2025_ 01_59_10 PM.png', 'haxeru@mailinator.com', NULL, NULL, NULL, '$2y$12$jKXT7SHDk8LAI.iXCNRFKOj2ACCn4qDiRnPMb.KnNyn4rZRNqHv3q', 0, NULL, NULL, NULL, NULL, '2025-11-06 23:18:45', '2025-11-06 23:18:45', NULL, NULL, NULL, NULL),
(26, 4, NULL, 'Christian Mccullough Cara Munoz', 'user_not_found.png', 'gecofe@mailinator.com', NULL, NULL, NULL, '$2y$12$ddd433Un19Pg.633kh5ceusulXTHxDUQAVRY7.4IHzxIdioM.e5P2', 0, NULL, '2025-11-06 23:19:25', NULL, NULL, '2025-11-06 23:19:24', '2025-11-06 23:19:25', NULL, NULL, NULL, NULL),
(27, 4, NULL, 'Magee Kinney', 'user_not_found.png', 'testing@test.com', NULL, NULL, NULL, '$2y$12$IYd1yly5jmpSXtp7K3YPtOfHN53/UMF0H1DzSnJAwqZcQqUawsLbm', 0, 'd5zoFsPTcA0DETl-BeZM2x:APA91bHBvoPNKfxp5id4LFbiFr-1GLk17wC1ZspcZTSvuWk6DXFTPZRwRdVSSB-Alk6uslo2Bdgh-U5OcSKHbC9gicHaxTQApOuseM7oCfSaWDaPEJ9yks8', '2026-01-29 03:38:31', NULL, NULL, '2025-11-24 23:38:56', '2026-01-29 03:38:31', NULL, NULL, NULL, NULL),
(28, 3, NULL, 'Cathy Jamison', '1764094993Capture.PNG', 'Cathy@familymember.com', NULL, NULL, NULL, '$2y$12$uYjf53Wd5E3EA2UVnIk7wu3cgpt28h0eoMN0n7xatoxL3s3DLxbZO', 0, 'f6iTlR9vdIUs09CnHWUl11:APA91bEFriWZ5oxWect62CZ1tf13TiF9RGu4_FfH4HT4Mm2aqC93WF8bKC_o5zNUziYSBPUmbILtSFqt_WPHSn0Jda4VUNdNEdT8hXvAAvISFGP6kimyaSI', '2026-01-21 21:12:46', NULL, NULL, '2025-11-25 23:23:13', '2026-01-21 21:12:46', NULL, NULL, NULL, NULL),
(29, 3, NULL, 'Sebastian', '1764095170images.jpg', 'Sebastian@familymember.com', NULL, NULL, NULL, '$2y$12$rTSqLFgX1L589G88dnqfP.IgmDMA3KT0QrjUnNxTMYClMHCtqJ4IK', 0, NULL, '2026-01-16 17:25:19', NULL, NULL, '2025-11-25 23:26:11', '2026-01-16 17:25:19', NULL, NULL, NULL, NULL),
(30, 2, NULL, 'Kevin Dorris', '1764095466istockphoto-154891185-612x612.jpg', 'Kevin@senior.com', NULL, NULL, NULL, '$2y$12$B7veU/yR65cjLiqKFvG/Ie4sJ.ukm240quxT7.VHvdeKvVjZnzMVC', 0, NULL, '2026-01-06 17:35:13', NULL, NULL, '2025-11-25 23:31:07', '2026-01-06 17:35:13', NULL, NULL, NULL, NULL),
(31, 6, 'Family friend', 'Myles Tyler', '1765302057Picture5.png', 'cokide@mailinator.com', NULL, NULL, NULL, '$2y$12$T6aAeaj3qj7.315DTDDAhOSQmb000WKNW9yltrA7ba7cOtjk8mBC2', 0, NULL, '2025-12-09 17:52:25', NULL, NULL, '2025-12-09 17:40:57', '2025-12-09 17:52:25', NULL, NULL, NULL, NULL),
(32, 3, NULL, 'Chaim Dunn', '1765321678Picture5.png', 'kovixyzyf@mailinator.com', NULL, NULL, NULL, '$2y$12$jwJAnTgNUYhVy57YNqLGg.nbEjQP5Ht6Wh23xSLaczMoEC05J9noG', 0, NULL, '2025-12-10 21:31:56', NULL, NULL, '2025-12-09 23:07:58', '2025-12-10 21:31:56', NULL, NULL, NULL, NULL),
(33, 4, NULL, 'Deanna Knapp Karina Elliott', 'user_not_found.png', 'pagak@mailinator.com', NULL, NULL, NULL, '$2y$12$oQ4dbS82CckKR9gid3zTK./iZ59hMeFTTHG5.cmeAr7Zgv7dRtMRm', 0, NULL, '2025-12-13 01:16:20', NULL, NULL, '2025-12-13 01:16:19', '2025-12-13 01:16:20', NULL, NULL, NULL, NULL),
(34, 5, NULL, 'Claudia Livingston', '1765588865Picture6.png', 'fete@mailinator.com', NULL, NULL, NULL, '$2y$12$b97Hjzz1mUSAK8RGlGCmEOgnQpIohyVXvu/df0zGraAI1ZDz6YYLm', 0, NULL, NULL, NULL, NULL, '2025-12-13 01:21:05', '2025-12-13 01:21:05', NULL, NULL, NULL, NULL),
(35, 5, NULL, 'Brody Garrison', '1767118559Picture6.png', 'gafacid@mailinator.com', NULL, NULL, NULL, '$2y$12$jd17oRfITW/ur4e.KL/od.sQ/917UG5dSjSweEI8j2smF0bYmfvIS', 0, NULL, '2026-01-06 01:35:37', NULL, NULL, '2025-12-30 18:15:59', '2026-01-06 01:35:37', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vacations`
--

CREATE TABLE `vacations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `type` enum('vacation','outing') NOT NULL DEFAULT 'outing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vacation_users`
--

CREATE TABLE `vacation_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vacation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voice_journals`
--

CREATE TABLE `voice_journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `senior_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `transcription` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `voice_journals`
--

INSERT INTO `voice_journals` (`id`, `senior_id`, `created_by`, `title`, `file_path`, `transcription`, `created_at`, `updated_at`) VALUES
(19, 3, 3, NULL, 'voice_journals/oD5xHbkVVtuZoMniyCi1fovfX7jZ17uGb501TBWQ.webm', NULL, '2025-11-11 00:17:11', '2025-11-11 00:17:11'),
(20, 3, 3, NULL, 'voice_journals/gSQSxTNU2o6N3Ql6tbnIJzntGH1WNbBviF2Wucw7.webm', NULL, '2025-11-11 00:21:35', '2025-11-11 00:21:35'),
(21, 3, 3, NULL, 'voice_journals/7pJ7ypyedMbwDccvtrWQj5vRtuGjCaoeOtJGRvee.webm', NULL, '2025-11-11 00:24:17', '2025-11-11 00:24:17'),
(22, 3, 3, NULL, 'voice_journals/d6VkY1y6k7J0klWP0dcWp3KPEw2nsoXJphenjDBT.webm', NULL, '2025-11-11 00:24:47', '2025-11-11 00:24:47'),
(23, 10, 10, NULL, 'voice_journals/vaD3OimPdn3Uh0WKs5pogyxLEHD9zgB001mLar1H.webm', NULL, '2025-11-15 02:41:29', '2025-11-15 02:41:29'),
(24, 30, 30, NULL, 'voice_journals/lq3HTZDNmvvCWlwizjTN0OJMu2sPfCvTsakV8cVq.webm', NULL, '2025-12-04 00:12:14', '2025-12-04 00:12:14');

-- --------------------------------------------------------

--
-- Table structure for table `voting_comments`
--

CREATE TABLE `voting_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pool_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_doc`
--
ALTER TABLE `bank_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carewatcher`
--
ALTER TABLE `carewatcher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatify_conversations`
--
ALTER TABLE `chatify_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatify_messages`
--
ALTER TABLE `chatify_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatify_messages_conversation_id_foreign` (`conversation_id`),
  ADD KEY `chatify_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `chatify_message_status`
--
ALTER TABLE `chatify_message_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatify_message_status_message_id_foreign` (`message_id`);

--
-- Indexes for table `chatify_participants`
--
ALTER TABLE `chatify_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatify_participants_conversation_id_foreign` (`conversation_id`),
  ADD KEY `chatify_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatify_reactions`
--
ALTER TABLE `chatify_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatify_reactions_message_id_foreign` (`message_id`);

--
-- Indexes for table `chat_files`
--
ALTER TABLE `chat_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_requests`
--
ALTER TABLE `document_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_responses`
--
ALTER TABLE `document_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_documents`
--
ALTER TABLE `emergency_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_comments`
--
ALTER TABLE `event_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `family_owner_id` (`family_owner_id`);

--
-- Indexes for table `event_senior`
--
ALTER TABLE `event_senior`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `senior_id` (`senior_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `family_notes`
--
ALTER TABLE `family_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `family_owners`
--
ALTER TABLE `family_owners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `family_owners_owner_id_foreign` (`owner_id`),
  ADD KEY `family_owners_primary_senior_id_foreign` (`primary_senior_id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_members`
--
ALTER TABLE `meeting_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pools`
--
ALTER TABLE `pools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pool_votings`
--
ALTER TABLE `pool_votings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pool_votings_voting_pool_id_user_id_unique` (`pool_id`,`user_id`);

--
-- Indexes for table `reimbursements`
--
ALTER TABLE `reimbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seniors`
--
ALTER TABLE `seniors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `senoirs_user_id_unique` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_perks`
--
ALTER TABLE `subscription_perks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline_logs`
--
ALTER TABLE `timeline_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `vacations`
--
ALTER TABLE `vacations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vacation_users`
--
ALTER TABLE `vacation_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voice_journals`
--
ALTER TABLE `voice_journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_comments`
--
ALTER TABLE `voting_comments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_doc`
--
ALTER TABLE `bank_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bill_payments`
--
ALTER TABLE `bill_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `carewatcher`
--
ALTER TABLE `carewatcher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `chatify_message_status`
--
ALTER TABLE `chatify_message_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `chatify_participants`
--
ALTER TABLE `chatify_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chatify_reactions`
--
ALTER TABLE `chatify_reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `chat_files`
--
ALTER TABLE `chat_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `document_requests`
--
ALTER TABLE `document_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `document_responses`
--
ALTER TABLE `document_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_documents`
--
ALTER TABLE `emergency_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `event_comments`
--
ALTER TABLE `event_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event_senior`
--
ALTER TABLE `event_senior`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_notes`
--
ALTER TABLE `family_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `family_owners`
--
ALTER TABLE `family_owners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `meeting_members`
--
ALTER TABLE `meeting_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=585;

--
-- AUTO_INCREMENT for table `pools`
--
ALTER TABLE `pools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pool_votings`
--
ALTER TABLE `pool_votings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reimbursements`
--
ALTER TABLE `reimbursements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seniors`
--
ALTER TABLE `seniors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribed_users`
--
ALTER TABLE `subscribed_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `subscription_perks`
--
ALTER TABLE `subscription_perks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `timeline_logs`
--
ALTER TABLE `timeline_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vacations`
--
ALTER TABLE `vacations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vacation_users`
--
ALTER TABLE `vacation_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voice_journals`
--
ALTER TABLE `voice_journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `voting_comments`
--
ALTER TABLE `voting_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatify_messages`
--
ALTER TABLE `chatify_messages`
  ADD CONSTRAINT `chatify_messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `chatify_conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatify_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chatify_message_status`
--
ALTER TABLE `chatify_message_status`
  ADD CONSTRAINT `chatify_message_status_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `chatify_messages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chatify_participants`
--
ALTER TABLE `chatify_participants`
  ADD CONSTRAINT `chatify_participants_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `chatify_conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatify_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chatify_reactions`
--
ALTER TABLE `chatify_reactions`
  ADD CONSTRAINT `chatify_reactions_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `chatify_messages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `family_owners`
--
ALTER TABLE `family_owners`
  ADD CONSTRAINT `family_owners_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `family_owners_primary_senior_id_foreign` FOREIGN KEY (`primary_senior_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `seniors`
--
ALTER TABLE `seniors`
  ADD CONSTRAINT `senoirs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
