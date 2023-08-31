-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 31, 2023 lúc 05:21 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sapo4`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cats`
--

CREATE TABLE `cats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cats`
--

INSERT INTO `cats` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Đồ điện tử', 'Các đồ dùng điện tử (bao gồm cả phụ kiện) như điện thoại, laptop,..', '2023-05-02 02:43:28', '2023-08-23 19:33:58'),
(2, 'Phụ kiện máy tính', 'Bao gồm các loại phụ kiện đi kèm với máy tính(Chuột, ram, màn hình,..)', '2023-05-02 02:44:40', '2023-05-02 02:44:40'),
(4, 'Thiết bị di động', 'Các thiết bị di động cá nhân mang theo bên người với thiết kế nhỏ gọn.', '2023-05-03 06:03:00', '2023-05-03 06:03:00'),
(5, 'Thiết bị hỗ trợ học tập, chơi game', 'Bao gồm các thiết bị điện tử giúp hỗ trợ người sử dụng vào nhiều công việc như học tập, làm việc, chơi game, ...', '2023-05-03 06:17:21', '2023-05-03 06:17:21'),
(6, 'Gaming', 'Những thiết bị điện tử chuyên phục vụ nhu cầu chơi game của người dùng', '2023-08-15 05:53:23', '2023-08-15 05:53:23'),
(7, 'Sinh viên', 'Những sản phẩm dành cho sinh viên như Laptop, điện thoại, ...', '2023-08-23 19:35:32', '2023-08-23 19:35:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ch_favorites`
--

CREATE TABLE `ch_favorites` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ch_favorites`
--

INSERT INTO `ch_favorites` (`id`, `user_id`, `favorite_id`, `created_at`, `updated_at`) VALUES
('1beba401-0f0c-4c02-b172-3150a1cbb302', 10, 13, '2023-08-20 06:53:39', '2023-08-20 06:53:39'),
('50e8c912-ccc1-43ce-896d-6c8743b48878', 13, 9, '2023-08-20 08:26:43', '2023-08-20 08:26:43'),
('7b66e6d7-873b-47fb-a305-b645fa8db1e7', 10, 11, '2023-08-20 20:27:14', '2023-08-20 20:27:14'),
('9ffa4afb-8c4d-4f3e-8751-398d9d007898', 17, 16, '2023-08-21 06:01:21', '2023-08-21 06:01:21'),
('c6662bd8-dfc3-413b-8c97-5f3a5ae84fe4', 13, 10, '2023-08-20 22:58:10', '2023-08-20 22:58:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ch_messages`
--

CREATE TABLE `ch_messages` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `to_id` bigint(20) NOT NULL,
  `body` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ch_messages`
--

INSERT INTO `ch_messages` (`id`, `from_id`, `to_id`, `body`, `attachment`, `seen`, `created_at`, `updated_at`) VALUES
('06ca2060-8c9f-40b7-8edb-44df12bda0a9', 13, 10, 'Manh xinh qu&aacute; trời', NULL, 1, '2023-08-20 08:18:21', '2023-08-20 08:50:37'),
('0b7c5634-94ff-4a5d-a1e5-443a3f818db4', 13, 10, 'ugi', NULL, 1, '2023-08-20 22:56:59', '2023-08-21 03:35:16'),
('0cd46b46-0b6c-4866-9852-aa2c496e0ed3', 17, 16, '😀', NULL, 1, '2023-08-21 06:02:09', '2023-08-21 06:02:57'),
('0e2e9bc2-8f5a-4a73-a357-be36ca822134', 10, 13, 'hekwe', NULL, 1, '2023-08-20 08:50:48', '2023-08-20 08:51:03'),
('1d89a37c-5cfd-479b-9ccb-a1c4f7b43b1e', 17, 16, 'Nma đừng gửi:))', NULL, 1, '2023-08-21 06:04:07', '2023-08-21 06:04:08'),
('21da889a-45ec-453d-872c-49bd329cfffa', 17, 16, 'Đang nghịch j ak:v', NULL, 1, '2023-08-21 06:03:17', '2023-08-21 06:03:32'),
('22002a05-0a76-4330-b3ff-4446ef9fe4d9', 17, 16, 'Lỗi t lỗi t:)', NULL, 1, '2023-08-21 06:12:47', '2023-08-21 06:13:26'),
('27b505c1-ae78-424e-a58a-8b426bdedcc0', 13, 10, 'mạng lag nhỉ:)', NULL, 1, '2023-08-20 06:24:16', '2023-08-20 06:53:34'),
('2c3072c2-d006-4e8e-8373-8978d1829253', 10, 11, 'hello', NULL, 0, '2023-08-21 03:36:00', '2023-08-21 03:36:00'),
('317506fc-b45e-453f-aaab-e3c8f5e18851', 17, 17, '😂', NULL, 1, '2023-08-21 10:18:14', '2023-08-21 21:50:37'),
('322551b9-c45e-4c8c-8615-36666ee3eb63', 13, 10, '', '{\"new_name\":\"9adebfa7-c2bb-4e8b-b98c-655586f91c4e.png\",\"old_name\":\"avatar.png\"}', 1, '2023-08-21 04:55:22', '2023-08-22 10:44:05'),
('38172b7e-9456-4348-881f-604703e5d05c', 17, 16, 'Nhắn tin', NULL, 1, '2023-08-21 06:04:39', '2023-08-21 06:05:01'),
('3b6e5a27-fd3a-4348-8b9d-943c67ddb709', 17, 16, 'M thử gửi file ảnh xem:v&#039;', NULL, 1, '2023-08-21 06:09:18', '2023-08-21 06:11:56'),
('3f271954-0abc-4d5e-ae0a-3a01467f003b', 13, 13, 'it&#039;s me', NULL, 1, '2023-08-20 06:16:18', '2023-08-20 06:16:28'),
('404e03f1-9302-4a6f-a6bd-350b02e0be18', 13, 11, 'hello', NULL, 0, '2023-08-20 08:21:30', '2023-08-20 08:21:30'),
('49faadba-eb84-4373-8527-b35503055c12', 13, 9, 'hello thắng ng&acirc;n:)', NULL, 0, '2023-08-20 08:43:52', '2023-08-20 08:43:52'),
('53e407ae-bfd0-4018-84dd-8132291be6fb', 10, 10, 'hi', NULL, 1, '2023-08-20 07:08:14', '2023-08-20 07:08:18'),
('54d180cf-9e29-4906-8f39-90e8706f0008', 17, 16, 'T ban m:)', NULL, 1, '2023-08-21 06:04:10', '2023-08-21 06:04:20'),
('5a22b3eb-6437-4c4c-a55f-bd6cc59f4cad', 17, 16, '', '{\"new_name\":\"acc39de1-50ce-4f3d-b02d-4592a68ec246.png\",\"old_name\":\"avatar.png\"}', 1, '2023-08-21 06:00:58', '2023-08-21 06:01:14'),
('5bc06a77-f38e-4e90-8675-805868f1a612', 17, 16, 'check thử icon xem', NULL, 1, '2023-08-21 06:04:44', '2023-08-21 06:05:01'),
('5e5ca6c5-9471-4bc6-9071-1bb5e52bee20', 10, 11, '🤑', NULL, 0, '2023-08-21 03:59:00', '2023-08-21 03:59:00'),
('6df42921-efbd-4d71-a717-4bd5f52df1e6', 13, 13, 'how are you', NULL, 1, '2023-08-20 06:16:09', '2023-08-20 06:16:28'),
('77f451e3-1395-435b-ab1e-11f0cb1b7b9c', 17, 16, '🦍', NULL, 1, '2023-08-21 06:10:40', '2023-08-21 06:11:56'),
('7a393603-971f-4229-b01a-d9bdf4444ba8', 17, 16, '🤐', NULL, 1, '2023-08-21 06:08:49', '2023-08-21 06:11:56'),
('81caf588-2e1a-4d34-8d91-bde4d305b0fd', 13, 13, 'hello', NULL, 1, '2023-08-20 06:06:39', '2023-08-20 06:07:08'),
('8a502289-25b7-466a-8412-d142e50b9e0d', 13, 11, 'Helo', NULL, 0, '2023-08-20 06:42:18', '2023-08-20 06:42:18'),
('92b561ed-2e4f-4ba9-8136-f4c2a6b4aa6a', 17, 16, '🎃', NULL, 1, '2023-08-21 06:14:07', '2023-08-21 06:14:42'),
('958c705e-0081-426f-9001-c0e822901d77', 13, 13, '😲', NULL, 1, '2023-08-20 06:06:50', '2023-08-20 06:07:08'),
('9aa5d319-2cea-44ed-b102-522edff017a5', 16, 17, '', '{\"new_name\":\"1a3fc472-92ce-492b-9481-64b4bb896da1.jpg\",\"old_name\":\"367574831_820496816389334_373319677979327338_n.jpg\"}', 1, '2023-08-21 06:12:05', '2023-08-21 06:12:34'),
('9b9338a1-83c9-4dc4-9e9c-21ea82bc4cd9', 13, 10, 'hello', NULL, 1, '2023-08-20 06:24:06', '2023-08-20 06:53:34'),
('a238c03a-0098-422b-82f1-657559e861ae', 13, 13, '🤨', NULL, 1, '2023-08-20 08:20:00', '2023-08-20 08:20:06'),
('a30d4746-8208-49f2-9daa-9172fde95763', 13, 10, 'greo', NULL, 1, '2023-08-20 06:24:33', '2023-08-20 06:53:34'),
('a439cf99-142b-4a97-995a-0c65426024d0', 10, 13, 'ừ lag vkl', NULL, 1, '2023-08-20 06:53:52', '2023-08-20 06:53:58'),
('b46f1c23-26c4-4c5a-b4e3-4eea2b3c0b44', 10, 13, '', '{\"new_name\":\"a732d437-0120-44f4-bc34-bce21e07ecb8.png\",\"old_name\":\"Manh.png\"}', 1, '2023-08-22 10:44:48', '2023-08-23 19:32:08'),
('bc04fcba-8c02-42e7-9b64-31a934e181cd', 10, 11, 'hi', NULL, 0, '2023-08-20 20:27:05', '2023-08-20 20:27:05'),
('c24a21f3-6d00-49c4-9ffc-4aaee8c9f50e', 13, 13, 'hello', NULL, 1, '2023-08-20 06:16:12', '2023-08-20 06:16:28'),
('c68b3f87-85c4-4320-877b-acbc425b1a22', 13, 9, 'Hello', NULL, 0, '2023-08-20 08:26:37', '2023-08-20 08:26:37'),
('ca5e9d4d-bbfc-48a3-bdb1-2f03825d4732', 13, 10, 'helo', NULL, 1, '2023-08-20 22:53:22', '2023-08-21 03:35:16'),
('d279e8e1-90bd-4387-aeb6-f2d433954ad2', 17, 16, 'C&ograve;n mấy c&aacute;i kh&aacute;c nữa nma th&ocirc;i t tự test đc:)', NULL, 1, '2023-08-21 06:06:16', '2023-08-21 06:07:00'),
('d2e3b060-b046-4806-b952-79ce687ec5d8', 13, 13, 'g3', NULL, 1, '2023-08-20 06:24:29', '2023-08-20 06:24:39'),
('eeabce22-dea4-465c-8199-97a37449d102', 13, 11, 'hvwp', NULL, 0, '2023-08-20 08:21:38', '2023-08-20 08:21:38'),
('f0160829-c64e-46b4-a2dd-b7e7c7b7cdb1', 17, 16, 'M c&oacute; thể out:))', NULL, 1, '2023-08-21 06:14:17', '2023-08-21 06:14:42'),
('f7ad449e-1025-4856-aa84-2d5f3ebbf305', 10, 13, 'fweklhf', NULL, 1, '2023-08-20 08:57:02', '2023-08-20 08:57:10'),
('f9b4e068-bec2-428b-8c76-4e163b3b94ae', 17, 16, 'Th&ocirc;i xong  r đấy', NULL, 1, '2023-08-21 06:14:13', '2023-08-21 06:14:42'),
('fa2b0f8f-64cf-43d3-aaae-63ac630f3845', 10, 11, '', '{\"new_name\":\"3e679e79-29ab-4d88-9c91-f1f31815c4f7.png\",\"old_name\":\"avatar.png\"}', 0, '2023-08-21 03:36:14', '2023-08-21 03:36:14'),
('ffeb2ecf-4002-4fae-af6b-431cd5c7dbd1', 13, 10, 'Hi', NULL, 1, '2023-08-20 06:23:50', '2023-08-20 06:53:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Trắng', NULL, NULL),
(2, 'Xanh lá cây', NULL, NULL),
(3, 'Xanh da trời', NULL, NULL),
(4, 'Đỏ', NULL, NULL),
(5, 'Vàng', NULL, NULL),
(6, 'Da cam', NULL, NULL),
(7, 'Hồng', NULL, NULL),
(8, 'Tím', NULL, NULL),
(9, 'Đen', NULL, NULL),
(10, 'Nâu', NULL, NULL),
(11, 'Xám', NULL, NULL),
(12, 'Bạc', NULL, NULL),
(13, 'Tím mộng mơ', '2023-05-04 05:00:35', '2023-05-04 05:00:35'),
(14, 'Hồng cánh sen', '2023-05-04 07:51:19', '2023-05-04 07:51:19'),
(15, 'Xanh nước biển', '2023-05-06 06:47:04', '2023-05-06 06:47:04'),
(16, 'Xanh lá chuối', '2023-06-05 08:13:16', '2023-06-05 08:13:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `draft_order` bigint(20) UNSIGNED DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `email`, `password`, `phone`, `address`, `birth`, `gender`, `draft_order`, `note`, `created_at`, `updated_at`) VALUES
(3, 'Đoàn Đức Toàn', 'toanymanh@gmail.com', '$2y$10$laQQyUdpYZZ1kxo9VCjwWuPtcEWKKFrFwZAy3xN5Sc5TgIzPlhvQy', '0911477985', 'Nam Định', NULL, 'male', 97, NULL, '2023-05-23 23:03:14', '2023-08-25 18:16:13'),
(4, 'Đoàn Đức Toàn', 'thuymaitoanki@gmail.com', '$2y$10$ifILwffB3kNHMfOkh0pI.Oop5PYqgpgf3F92nuUJVJiM5OYaDbXlS', '0911577999', 'Hà Nội', NULL, 'male', NULL, NULL, '2023-05-24 04:55:24', '2023-08-23 22:06:51'),
(9, 'Pham Minh Anh', 'toandtq123@gmail.com', '$2y$10$LaavspHUXklKri38jOIfNuC0WhJ.wvPFPP71ZW3Dka5re4Bpgl.MK', '0911477555', 'Nam Định', NULL, 'female', 68, NULL, '2023-06-05 07:48:40', '2023-08-18 06:12:19'),
(10, 'Pham Minh Anh', 'manhcute@gmail.com', '$2y$10$110cFEF/vNWq6FBxk1wll.VENUeDOUaHrdrNmi.69ZgdaP7zHEfCi', '0911477999', 'Hà Nội', NULL, '', NULL, NULL, '2023-08-17 22:34:20', '2023-08-17 22:34:20'),
(12, 'Pham Minh Anh', 'toanymanhff@gmail.com', '$2y$10$ri3u1mBvbKUG1A2Kwv8csOEP9W72BSlcpoX0VHhfiu96kYGmf/soK', '0911477981', 'Hà Nội', NULL, 'female', NULL, 'Không', '2023-08-17 22:43:20', '2023-08-23 10:07:29'),
(13, 'Phan Van Cuong', 'pvcuong@gmail.com', '$2y$10$3BOSCWgCZ/9.9I/.dVtcgO8sJt4zHXxeXk/.XmTB1Gf4ILno8g2wS', '0123654987', 'Hà Nội', NULL, 'male', NULL, NULL, '2023-08-22 20:33:57', '2023-08-22 20:33:57'),
(14, 'Đoàn Đức Toàn', 'manhytoan@gmail.com', '$2y$10$9Vv430X9buOWIjnR9cTAueddeKeOF.FYbm0oi4o2E456QuvshKMq6', '0213546899', 'Nam Định', NULL, 'male', NULL, NULL, '2023-08-23 18:14:05', '2023-08-23 18:28:20'),
(15, 'Cuong', 'phancuong.qt@gmail.com', '$2y$10$tEzwtOFAasP5EG4xB.eG6egWEnNkoOf19HuquxKCsU2kSVNrWR106', '0988859692', 'Ha Noi', NULL, 'male', 92, NULL, '2023-08-23 22:03:46', '2023-08-23 22:12:31'),
(18, 'Tran Binh Minh', 'tranbinhminh@gmail.com', '$2y$10$GAotuW.9gMP7Ra1vfgLb.uWWDMawkp5x5KAxjfPqjKzKD.r5vEFmC', '0333222444', 'Bắc Ninh', NULL, 'male', NULL, NULL, '2023-08-30 01:53:33', '2023-08-30 01:54:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `section` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id`, `customer_id`, `section`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 'Báo lỗi-Chỉnh sửa giao diện web', 'Lỗi giao diện điện thoại', 'Giao diện bằng điện thoại không vào được', '2023-08-25 06:55:34', '2023-08-25 06:55:34'),
(2, 3, 'Báo lỗi-Chỉnh sửa giao diện web', 'Lỗi đăng nhập', 'Không đăng nhập được trên điện thoại.', '2023-08-25 18:37:51', '2023-08-25 18:37:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_26_141258_add_softdelete_to_users_table', 2),
(6, '2023_04_29_081446_create_permissions_table', 3),
(7, '2023_04_29_081526_create_roles_table', 3),
(8, '2023_04_29_082317_create_role_permission_table', 4),
(9, '2023_04_30_054957_create_user_role_table', 5),
(10, '2023_05_02_083502_create_product_table', 6),
(11, '2023_05_02_083818_create_color_table', 6),
(12, '2023_05_02_083914_create_size_table', 6),
(13, '2023_05_02_083953_create_cat_table', 6),
(14, '2023_05_02_084109_create_product_color_table', 7),
(15, '2023_05_02_084457_create_product_size_table', 8),
(16, '2023_05_02_084549_create_product_cat_table', 9),
(17, '2023_05_02_085400_create_thumbs_table', 10),
(18, '2023_05_02_085451_create_product_thumb_table', 10),
(19, '2023_05_02_085738_create_product_thumbs_table', 11),
(20, '2023_05_02_112649_create_product_thumbs_table', 12),
(21, '2023_05_04_145246_create_orders_table', 13),
(22, '2023_05_04_145439_create_customers_table', 13),
(23, '2023_05_04_150844_create_orders_table', 14),
(24, '2023_05_04_151626_create_order_detail_table', 15),
(25, '2023_07_14_130408_create_notifycations_table', 16),
(26, '2023_08_20_999999_add_active_status_to_users', 17),
(27, '2023_08_20_999999_add_avatar_to_users', 17),
(28, '2023_08_20_999999_add_dark_mode_to_users', 17),
(29, '2023_08_20_999999_add_messenger_color_to_users', 17),
(30, '2023_08_20_999999_create_chatify_favorites_table', 17),
(31, '2023_08_20_999999_create_chatify_messages_table', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Đơn hàng mới', 'Khách hàng #9 đã đặt đơn hàng #59', '2023-07-14 06:25:00', '2023-07-14 06:25:00'),
(2, 'Thanh toán thành công', 'Đơn hàng #59 đã được thanh toán', '2023-07-14 06:59:28', '2023-07-14 06:59:28'),
(3, 'Xác nhận đơn hàng', 'Đơn hàng #59 đã được nhân viên #10 xử lý', '2023-07-14 06:59:46', '2023-07-14 06:59:46'),
(4, 'Đơn hàng hoàn thành', 'Đơn hàng #59 đã giao thành công', '2023-07-14 07:00:04', '2023-07-14 07:00:04'),
(5, 'Đơn hàng mới', 'Khách hàng #9 đã đặt đơn hàng #60', '2023-08-13 09:11:59', '2023-08-13 09:11:59'),
(6, 'Thanh toán thành công', 'Đơn hàng #60 đã được thanh toán', '2023-08-13 09:12:18', '2023-08-13 09:12:18'),
(7, 'Xác nhận đơn hàng', 'Đơn hàng #60 đã được nhân viên #10 xử lý', '2023-08-13 09:12:28', '2023-08-13 09:12:28'),
(8, 'Đơn hàng hoàn thành', 'Đơn hàng #60 đã giao thành công', '2023-08-13 09:12:36', '2023-08-13 09:12:36'),
(9, 'Đơn hàng mới', 'Khách hàng #9 đã đặt đơn hàng #61', '2023-08-13 09:14:22', '2023-08-13 09:14:22'),
(10, 'Thanh toán thành công', 'Đơn hàng #61 đã được thanh toán', '2023-08-13 09:14:59', '2023-08-13 09:14:59'),
(11, 'Xác nhận đơn hàng', 'Đơn hàng #61 đã được nhân viên #10 xử lý', '2023-08-13 09:15:04', '2023-08-13 09:15:04'),
(12, 'Đơn hàng hoàn thành', 'Đơn hàng #61 đã giao thành công', '2023-08-13 09:15:10', '2023-08-13 09:15:10'),
(13, 'Đơn hàng mới', 'Khách hàng #9 đã đặt đơn hàng #62', '2023-08-13 09:15:55', '2023-08-13 09:15:55'),
(14, 'Thanh toán thành công', 'Đơn hàng #62 đã được thanh toán', '2023-08-13 09:16:04', '2023-08-13 09:16:04'),
(15, 'Xác nhận đơn hàng', 'Đơn hàng #62 đã được nhân viên #10 xử lý', '2023-08-13 09:16:09', '2023-08-13 09:16:09'),
(16, 'Đơn hàng hoàn thành', 'Đơn hàng #62 đã giao thành công', '2023-08-13 09:16:15', '2023-08-13 09:16:15'),
(17, 'Đơn hàng mới', 'Khách hàng #9 đã đặt đơn hàng #63', '2023-08-16 09:50:51', '2023-08-16 09:50:51'),
(18, 'Thanh toán thành công', 'Đơn hàng #63 đã được thanh toán', '2023-08-16 09:57:11', '2023-08-16 09:57:11'),
(19, 'Đơn hàng mới', 'Khách hàng #4 đã đặt đơn hàng #76', '2023-08-20 20:32:51', '2023-08-20 20:32:51'),
(20, 'Xác nhận đơn hàng', 'Đơn hàng #78 đã được nhân viên #17 xử lý', '2023-08-23 00:19:36', '2023-08-23 00:19:36'),
(21, 'Đơn hàng hoàn thành', 'Đơn hàng #78 đã giao thành công', '2023-08-23 00:19:46', '2023-08-23 00:19:46'),
(22, 'Thanh toán thành công', 'Đơn hàng #71 đã được thanh toán', '2023-08-23 00:21:07', '2023-08-23 00:21:07'),
(23, 'Hủy đơn hàng', 'Đơn hàng #71 đã được hủy bởi nhân viên #17', '2023-08-23 00:21:55', '2023-08-23 00:21:55'),
(24, 'Hoàn trả', 'Đã hoàn trả lại tiền và gửi thông báo đến khách hàng 9', '2023-08-23 00:22:16', '2023-08-23 00:22:16'),
(25, 'Xác nhận đơn hàng', 'Đơn hàng #70 đã được nhân viên #17 xử lý', '2023-08-23 00:25:13', '2023-08-23 00:25:13'),
(26, 'Hủy đơn hàng', 'Đơn hàng #70 đã được hủy bởi nhân viên #17', '2023-08-23 00:25:44', '2023-08-23 00:25:44'),
(27, 'Đơn hàng mới', 'Khách hàng #4 đã đặt đơn hàng #80', '2023-08-23 06:32:34', '2023-08-23 06:32:34'),
(28, 'Đơn hàng mới', 'Khách hàng #4 đã đặt đơn hàng #81', '2023-08-23 07:24:09', '2023-08-23 07:24:09'),
(29, 'Đơn hàng mới', 'Khách hàng #4 đã đặt đơn hàng #83', '2023-08-23 07:29:50', '2023-08-23 07:29:50'),
(30, 'Đơn hàng mới', 'Khách hàng #14 đã đặt đơn hàng #85', '2023-08-23 18:23:11', '2023-08-23 18:23:11'),
(31, 'Thanh toán thành công', 'Đơn hàng #85 đã được thanh toán', '2023-08-23 19:17:31', '2023-08-23 19:17:31'),
(32, 'Xác nhận đơn hàng', 'Đơn hàng #85 đã được nhân viên #13 xử lý', '2023-08-23 19:17:41', '2023-08-23 19:17:41'),
(33, 'Đơn hàng hoàn thành', 'Đơn hàng #85 đã giao thành công', '2023-08-23 19:17:54', '2023-08-23 19:17:54'),
(34, 'Đơn hàng mới', 'Khách hàng #4 đã đặt đơn hàng #84', '2023-08-23 22:06:51', '2023-08-23 22:06:51'),
(35, 'Đơn hàng mới', 'Khách hàng #15 đã đặt đơn hàng #90', '2023-08-23 22:09:15', '2023-08-23 22:09:15'),
(36, 'Đơn hàng mới', 'Khách hàng #16 đã đặt đơn hàng #93', '2023-08-24 00:36:25', '2023-08-24 00:36:25'),
(37, 'Đơn hàng mới', 'Khách hàng #16 đã đặt đơn hàng #94', '2023-08-24 00:41:15', '2023-08-24 00:41:15'),
(38, 'Đơn hàng mới', 'Khách hàng #17 đã đặt đơn hàng #95', '2023-08-24 00:44:29', '2023-08-24 00:44:29'),
(39, 'Hủy đơn hàng', 'Đơn hàng #93 đã được hủy bởi nhân viên #17', '2023-08-24 00:58:32', '2023-08-24 00:58:32'),
(40, 'Hủy đơn hàng', 'Đơn hàng #94 đã được hủy bởi nhân viên #17', '2023-08-24 00:59:35', '2023-08-24 00:59:35'),
(41, 'Đơn hàng mới', 'Khách hàng #3 đã đặt đơn hàng #96', '2023-08-25 18:14:40', '2023-08-25 18:14:40'),
(42, 'Hủy đơn hàng', 'Đơn hàng #98 đã được hủy bởi nhân viên #17', '2023-08-25 19:26:47', '2023-08-25 19:26:47'),
(43, 'Đơn hàng mới', 'Khách hàng #18 đã đặt đơn hàng #99', '2023-08-30 01:54:46', '2023-08-30 01:54:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` bigint(20) NOT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `user_id`, `payment_status`, `payment_method`, `payment_amount`, `delivery_status`, `delivery_address`, `delivery_method`, `note`, `cancel_reason`, `cancel_description`, `created_at`, `updated_at`) VALUES
(46, 9, 10, 'Hoàn trả', 'Phương thức thanh toán tùy chọn', 136550000, 'Đã hủy', 'Thành phố Hồ Chí Minh, Quận  Nhà Bè, Phường Tân Mai', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Đơn hàng hỏng hóc khi đang giao hàng', '2023-07-12 13:55:48', '2023-07-12 06:55:48'),
(47, 9, 10, 'Hoàn trả', 'Chuyển khoản qua ngân hàng', 232000, 'Đã hủy', 'Thành phố Hồ Chí Minh, Quận  Bình Tân, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Kho hàng không đủ', '2023-06-30 13:12:15', '2023-06-30 06:12:15'),
(48, 9, 10, 'Hoàn trả', 'Chuyển khoản qua ngân hàng', 11061000, 'Đã hủy', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Số lượng hàng trong kho không đủ đáp ứng yêu cầu của khách hàng', '2023-06-12 12:45:42', '2023-06-12 05:45:42'),
(50, 9, 13, 'Đã thanh toán', 'Khi nhận hàng', 24620000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-06-27 14:25:01', '2023-06-27 07:25:01'),
(51, 9, 13, 'Chưa thanh toán', 'Khi nhận hàng', 273960000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Ba Đình, Phường Tân Mai', 'Giao hàng tận nơi', 'ffwef', NULL, NULL, '2023-07-05 14:07:47', '2023-07-05 07:07:47'),
(52, 9, 10, 'Đã thanh toán', 'Khi nhận hàng', 54650000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-06 16:13:39', '2023-07-06 09:13:39'),
(53, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 136550000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-08 09:00:14', '2023-07-08 02:00:14'),
(54, 9, 10, 'Đã thanh toán', 'Khi nhận hàng', 43730000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-12 14:55:40', '2023-07-12 07:55:40'),
(55, 9, 10, 'Đã thanh toán', 'Khi nhận hàng', 12608000, 'Hoàn thành', 'Thành phố Hồ Chí Minh, Quận  Nhà Bè, Phường Tân Mai', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-13 08:10:17', '2023-07-13 01:10:17'),
(56, 9, 10, 'Đã thanh toán', 'Chuyển khoản qua ngân hàng', 181686000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-13 09:15:34', '2023-07-13 02:15:34'),
(57, 9, 10, 'Đã thanh toán', 'Phương thức thanh toán tùy chọn', 71030000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Ba Đình, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-14 12:35:36', '2023-07-14 05:35:36'),
(58, 9, 10, 'Chưa thanh toán', 'Phương thức thanh toán tùy chọn', 30080000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Cần Giờ, Phường Tân Mai', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-14 14:04:36', '2023-07-14 07:04:36'),
(59, 9, 10, 'Đã thanh toán', 'Chuyển khoản qua ngân hàng', 120170000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Ba Đình, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-07-14 14:00:04', '2023-07-14 07:00:04'),
(60, 9, 10, 'Đã thanh toán', 'Chuyển khoản qua ngân hàng', 93052000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-13 16:12:36', '2023-08-13 09:12:36'),
(61, 9, 10, 'Đã thanh toán', 'Khi nhận hàng', 232000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-13 16:15:10', '2023-08-13 09:15:10'),
(62, 9, 10, 'Đã thanh toán', 'Phương thức thanh toán tùy chọn', 55014000, 'Hoàn thành', 'Thành phố Hồ Chí Minh, Quận  Bình Thạnh, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-13 16:16:15', '2023-08-13 09:16:15'),
(63, 9, 10, 'Đã thanh toán', 'Khi nhận hàng', 273050000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-16 16:57:11', '2023-08-16 09:57:11'),
(68, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 1456000, 'Đơn hàng nháp', 'Đang cập nhật', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-18 14:05:38', '2023-08-18 07:05:38'),
(69, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 11880000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-18 06:50:42', '2023-08-18 06:50:42'),
(70, 9, 17, 'Chưa thanh toán', 'Khi nhận hàng', 11880000, 'Đã hủy', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Đơn hàng bị hỏng hóc trong quá trình vận chuyển.', '2023-08-23 07:25:44', '2023-08-23 00:25:44'),
(71, 9, 17, 'Hoàn trả', 'Khi nhận hàng', 11880000, 'Đã hủy', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Đơn hàng hỏng hóc.', '2023-08-23 07:22:16', '2023-08-23 00:22:16'),
(72, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 11880000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-18 07:03:25', '2023-08-18 07:03:25'),
(73, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 11880000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-18 07:03:58', '2023-08-18 07:03:58'),
(74, 9, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 11880000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-18 07:05:01', '2023-08-18 07:05:01'),
(75, 9, 10, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 778000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Bình Thạnh, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-22 17:39:22', '2023-08-22 10:39:22'),
(76, 4, 10, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 178228000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Nhà Bè, Phường Tân Mai', 'Giao hàng tận nơi', 'ccsdfweef', NULL, NULL, '2023-08-22 17:39:39', '2023-08-22 10:39:39'),
(78, 4, 17, 'Đã thanh toán', 'Phương thức thanh toán tùy chọn', 9150000, 'Hoàn thành', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Khánh', 'Giao hàng tận nơi', 'cewcc', NULL, NULL, '2023-08-23 07:19:46', '2023-08-23 00:19:46'),
(80, 4, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 9150000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-23 13:32:34', '2023-08-23 06:32:34'),
(81, 4, 13, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 35540000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Hóc Môn, Phường Tân Mai', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 02:29:05', '2023-08-23 19:29:05'),
(82, 4, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 45550000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-23 07:28:23', '2023-08-23 07:28:23'),
(83, 4, 17, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 47734000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-23 14:54:11', '2023-08-23 07:54:11'),
(84, 4, 21, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 14610000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Hóc Môn, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 05:08:09', '2023-08-23 22:08:09'),
(85, 14, 13, 'Đã thanh toán', 'Phương thức thanh toán tùy chọn', 9514000, 'Hoàn thành', 'Thành phố Hồ Chí Minh, Quận  Cần Giờ, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 02:17:54', '2023-08-23 19:17:54'),
(86, 14, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 9150000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Nhà Bè, Phường Tân Mai', 'Giao hàng tận nơi', 'Không', NULL, NULL, '2023-08-23 18:17:36', '2023-08-23 18:17:36'),
(87, 14, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 778000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Hoàng Mai, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-23 18:21:53', '2023-08-23 18:21:53'),
(88, 3, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 19160000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Cần Giờ, Phường Tân Mai', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-23 19:47:58', '2023-08-23 19:47:58'),
(89, 4, 17, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 11880000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 08:00:19', '2023-08-24 01:00:19'),
(90, 15, 17, 'Chưa thanh toán', 'Khi nhận hàng', 45550000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Cầu Giấy, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 07:59:58', '2023-08-24 00:59:58'),
(91, 15, 17, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 778000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Bắc Từ Liêm, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 08:00:04', '2023-08-24 01:00:04'),
(92, 15, 17, 'Chưa thanh toán', 'Khi nhận hàng', 59514000, 'Đơn hàng nháp', 'Đang cập nhật', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-24 07:57:56', '2023-08-24 00:57:56'),
(96, 3, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 19110000, 'Chờ xử lý', 'Thành phố Hồ Chí Minh, Quận  Hóc Môn, Phường Ngọc Khánh', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-26 01:14:40', '2023-08-25 18:14:40'),
(97, 3, NULL, 'Chưa thanh toán', 'Khi nhận hàng', 5915000000, 'Đơn hàng nháp', 'Đang cập nhật', 'Giao hàng tận nơi', NULL, NULL, NULL, '2023-08-25 18:16:13', '2023-08-25 18:16:13'),
(98, 3, 17, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 5460050000, 'Đã hủy', 'Thành phố Hồ Chí Minh, Quận  Hóc Môn, Phường Ngọc Hà', 'Giao hàng tận nơi', NULL, 'Khách hàng thay đổi/Hủy đơn hàng', 'Kho hàng không đủ', '2023-08-26 02:26:47', '2023-08-25 19:26:47'),
(99, 18, NULL, 'Chưa thanh toán', 'Chuyển khoản qua ngân hàng', 23660000, 'Chờ xử lý', 'Thành phố Hà Nội, Quận  Hoàn Kiếm, Phường Tân Mai', 'Giao hàng tận nơi', 'Không có', NULL, NULL, '2023-08-30 08:54:46', '2023-08-30 01:54:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `color_id`, `count`, `created_at`, `updated_at`) VALUES
(86, 46, 7, 11, 1, NULL, NULL),
(93, 50, 12, 1, 2, NULL, '2023-06-26 08:36:51'),
(96, 50, 17, 2, 1, NULL, NULL),
(97, 51, 7, 1, 2, NULL, '2023-07-05 07:07:27'),
(98, 51, 17, 2, 1, NULL, NULL),
(102, 53, 7, 1, 1, NULL, NULL),
(104, 55, 12, 4, 1, NULL, NULL),
(105, 55, 5, 2, 1, NULL, NULL),
(106, 56, 11, 1, 6, NULL, '2023-07-13 01:43:50'),
(107, 56, 5, 2, 2, NULL, '2023-07-13 01:44:12'),
(108, 57, 12, 4, 6, NULL, '2023-07-14 05:35:11'),
(109, 58, 11, 1, 1, NULL, NULL),
(110, 59, 11, 1, 4, NULL, NULL),
(111, 60, 11, 1, 3, NULL, '2023-08-13 09:11:46'),
(112, 60, 5, 6, 4, NULL, '2023-08-13 09:10:58'),
(115, 62, 18, 4, 5, NULL, NULL),
(116, 63, 7, 11, 1, NULL, NULL),
(117, 63, 12, 1, 9, NULL, '2023-08-15 04:44:53'),
(118, 63, 11, 3, 1, NULL, NULL),
(123, 68, 5, 6, 1, NULL, NULL),
(125, 69, 9, 9, 1, NULL, NULL),
(126, 70, 9, 9, 1, NULL, NULL),
(127, 71, 9, 9, 1, NULL, NULL),
(128, 72, 9, 9, 1, NULL, NULL),
(129, 73, 9, 9, 1, NULL, NULL),
(130, 74, 9, 9, 1, NULL, NULL),
(131, 68, 14, 4, 1, NULL, NULL),
(132, 75, 14, 4, 1, NULL, NULL),
(134, 76, 14, 4, 1, NULL, NULL),
(138, 76, 7, 11, 1, NULL, '2023-08-18 22:58:50'),
(139, 76, 27, 9, 15, NULL, '2023-08-18 22:59:54'),
(140, 76, 11, 1, 1, NULL, NULL),
(144, 78, 15, 13, 1, NULL, NULL),
(149, 80, 15, 1, 1, NULL, NULL),
(150, 81, 9, 1, 3, NULL, '2023-08-23 07:23:42'),
(151, 82, 7, 11, 1, NULL, NULL),
(152, 83, 7, 11, 1, NULL, NULL),
(153, 83, 14, 1, 3, NULL, '2023-08-23 07:29:38'),
(154, 84, 9, 9, 1, NULL, NULL),
(155, 84, 4, 8, 1, NULL, NULL),
(156, 84, 17, 4, 2, NULL, '2023-08-23 10:15:08'),
(159, 85, 29, 3, 2, NULL, '2023-08-23 18:16:19'),
(160, 86, 15, 1, 1, NULL, NULL),
(161, 87, 14, 1, 1, NULL, NULL),
(162, 85, 14, 1, 3, NULL, '2023-08-23 18:23:02'),
(163, 88, 13, 1, 1, NULL, NULL),
(164, 89, 12, 1, 1, NULL, NULL),
(165, 90, 7, 11, 1, NULL, NULL),
(166, 91, 5, 6, 1, NULL, NULL),
(167, 92, 7, 11, 1, NULL, NULL),
(168, 92, 14, 1, 3, NULL, '2023-08-23 22:28:35'),
(169, 92, 9, 1, 1, NULL, NULL),
(173, 96, 13, 1, 1, NULL, NULL),
(174, 97, 7, 11, 130, NULL, NULL),
(175, 98, 7, 11, 120, NULL, NULL),
(176, 99, 9, 1, 1, NULL, NULL),
(177, 99, 20, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Product delete', 'product.delete', 'Xóa sản phẩm', '2023-04-29 02:00:43', '2023-04-29 02:40:17'),
(3, 'Cat delete', 'cat.delete', 'Xóa danh mục sản phẩm', '2023-04-29 02:24:00', '2023-04-29 02:41:26'),
(4, 'User delete', 'user.delete', 'Xóa người dùng', '2023-04-29 02:40:56', '2023-04-29 02:41:02'),
(5, 'Product add', 'product.add', NULL, '2023-04-29 07:51:53', '2023-04-29 07:51:53'),
(6, 'Product edit', 'product.edit', NULL, '2023-04-29 20:59:09', '2023-04-29 20:59:09'),
(7, 'Order delete', 'order.delete', NULL, '2023-04-30 03:25:43', '2023-04-30 03:25:43'),
(8, 'User update', 'user.update', NULL, '2023-05-01 22:45:13', '2023-05-01 22:45:13'),
(9, 'User add', 'user.add', NULL, '2023-05-01 22:45:24', '2023-05-01 22:45:24'),
(10, 'User profile', 'user.profile', NULL, '2023-05-01 22:45:42', '2023-05-01 22:45:42'),
(11, 'User force delete', 'user.force_delete', NULL, '2023-05-01 22:46:08', '2023-05-01 22:46:08'),
(12, 'Permission add', 'permission.add', NULL, '2023-05-01 22:46:30', '2023-05-01 22:46:30'),
(13, 'Permission edit', 'permission.edit', NULL, '2023-05-01 22:46:47', '2023-05-01 22:46:47'),
(14, 'Permission delete', 'permission.delete', NULL, '2023-05-01 22:47:03', '2023-05-01 22:47:03'),
(15, 'Role add', 'role.add', NULL, '2023-05-01 22:47:12', '2023-05-01 22:47:12'),
(16, 'Role edit', 'role.edit', NULL, '2023-05-01 22:47:22', '2023-05-01 22:47:22'),
(17, 'Role delete', 'role.delete', NULL, '2023-05-01 22:47:32', '2023-05-01 22:47:32'),
(18, 'User show', 'user.show', NULL, '2023-05-01 22:47:57', '2023-05-01 22:47:57'),
(19, 'Permission Show', 'permission.show', NULL, '2023-05-01 22:48:13', '2023-05-01 22:48:13'),
(20, 'Role show', 'role.show', NULL, '2023-05-01 22:48:21', '2023-05-01 22:48:21'),
(21, 'User search', 'user.search', NULL, '2023-05-01 22:49:42', '2023-05-01 22:49:42'),
(22, 'User restore', 'user.restore', NULL, '2023-05-01 22:50:28', '2023-05-01 22:50:28'),
(23, 'User action', 'user.action', NULL, '2023-05-01 22:50:37', '2023-05-01 22:50:37'),
(25, 'Cat Action', 'cat.action', NULL, '2023-08-23 09:41:45', '2023-08-23 09:41:45'),
(26, 'Cat store', 'cat.store', NULL, '2023-08-23 09:42:45', '2023-08-23 09:42:45'),
(27, 'Cat show', 'cat.show', NULL, '2023-08-23 09:42:58', '2023-08-23 09:42:58'),
(28, 'Cat detail', 'cat.detail', NULL, '2023-08-23 09:43:27', '2023-08-23 09:43:27'),
(29, 'Product store', 'product.store', NULL, '2023-08-23 09:44:03', '2023-08-23 09:44:03'),
(30, 'Product Show', 'product.show', NULL, '2023-08-23 09:44:19', '2023-08-23 09:44:19'),
(31, 'Product detail', 'product.detail', NULL, '2023-08-23 09:44:35', '2023-08-23 09:44:35'),
(32, 'Product action', 'product.action', NULL, '2023-08-23 09:44:47', '2023-08-23 09:44:47'),
(33, 'Thumb delete', 'thumb.delete', NULL, '2023-08-23 09:45:14', '2023-08-23 09:45:14'),
(34, 'Your products', 'product.yourproducts', NULL, '2023-08-23 09:46:04', '2023-08-23 09:46:04'),
(35, 'Product filter', 'product.filter', NULL, '2023-08-23 09:46:22', '2023-08-23 09:46:22'),
(36, 'Product search ajax', 'product.searchajax', NULL, '2023-08-23 09:46:49', '2023-08-23 09:46:49'),
(37, 'Customer profile', 'customer.profile', NULL, '2023-08-23 09:47:18', '2023-08-23 09:47:18'),
(38, 'Customer search ajax', 'customer.searchajax', NULL, '2023-08-23 09:47:38', '2023-08-23 09:47:38'),
(39, 'Customer update', 'customer.update', NULL, '2023-08-23 09:47:54', '2023-08-23 09:47:54'),
(40, 'Customer delete', 'customer.delete', NULL, '2023-08-23 09:48:04', '2023-08-23 09:48:04'),
(41, 'Order show', 'order.show', NULL, '2023-08-23 09:48:14', '2023-08-23 09:48:14'),
(42, 'Order detail', 'order.detail', NULL, '2023-08-23 09:48:30', '2023-08-23 09:48:30'),
(43, 'Ship order', 'order.ship', NULL, '2023-08-23 09:48:49', '2023-08-23 09:48:49'),
(44, 'Cancel order', 'order.cancel', NULL, '2023-08-23 09:48:59', '2023-08-23 09:48:59'),
(45, 'Order status', 'order.status', NULL, '2023-08-23 09:49:13', '2023-08-23 09:49:13'),
(46, 'Order payment completed', 'order.pmcompleted', NULL, '2023-08-23 09:49:58', '2023-08-23 09:49:58'),
(47, 'To return Order', 'order.toreturn', NULL, '2023-08-23 09:50:29', '2023-08-23 09:50:29'),
(48, 'Filter order', 'order.filter', NULL, '2023-08-23 09:50:43', '2023-08-23 09:50:43'),
(49, 'Search ajax order', 'order.searchajax', NULL, '2023-08-23 09:51:04', '2023-08-23 09:51:04'),
(50, 'Dashboard', 'dashboard.view', NULL, '2023-08-23 09:51:33', '2023-08-23 09:51:33'),
(51, 'Cat add', 'cat.add', NULL, '2023-08-23 10:00:36', '2023-08-23 10:00:36'),
(52, 'Show customer', 'customer.show', NULL, '2023-08-23 10:07:05', '2023-08-23 10:07:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `specifications` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salient_features` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `sold` int(100) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `star` float DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `specifications`, `salient_features`, `count`, `price`, `sold`, `type`, `supplier`, `star`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'Lenovo legion 5', '<p><a href=\"https://gearvn.com/collections/laptop-gaming-lenovo\" target=\"_blank\" rel=\"noopener\">Lenovo Legion 5</a>&nbsp;l&agrave; một trong d&ograve;ng&nbsp;<a href=\"https://gearvn.com/pages/laptop-gaming\" target=\"_blank\" rel=\"noopener\">laptop gaming</a>&nbsp;đ&igrave;nh đ&aacute;m của nh&agrave; Lenovo. Nếu bạn đang t&igrave;m kiếm một chiếc laptop vừa xử l&yacute; nhanh ch&oacute;ng c&aacute;c t&aacute;c vụ c&ocirc;ng việc hằng ng&agrave;y vừa chiến được mọi tựa game cực căng th&igrave; bạn kh&ocirc;ng n&ecirc;n bỏ qua&nbsp;<strong>Lenovo Legion 5 15ARH7 82RE0035VN</strong>&nbsp;nh&eacute;. Với thiết kế bắt mắt v&agrave; hiệu năng si&ecirc;u khủng, Lenovo Legion 5 hứa hẹn g&acirc;y b&atilde;o cộng đồng game thủ thời gian sắp tới.</p>', '<p>Kh&ocirc;ng c&oacute;</p>', 'Không có', 30, 1000000, NULL, 'Laptop', 'Lenovo', NULL, 13, '2023-05-02 10:56:44', '2023-08-22 21:26:30'),
(5, 'Điện thoại Sam Sung Galaxy S10', '<div class=\"title_box\">TH&Ocirc;NG TIN SẢN PHẨM</div>\r\n<div id=\"boxdesc\" class=\"boxdesc \" data-height=\"500\">\r\n<p>Samsung cuối c&ugrave;ng đ&atilde; ph&aacute;t h&agrave;nh d&ograve;ng điện thoại cao cấp h&agrave;ng đầu của m&igrave;nh l&agrave; Galaxy S23, bộ sản phẩm bao gồm: Galaxy S23, Galaxy S23 Plus v&agrave; Galaxy S23 Ultra. C&aacute;c sản phẩm của c&ocirc;ng ty từ thiết kế, m&agrave;n h&igrave;nh, camera hay pin đều c&oacute; sự cải tiến ấn tượng so với thế hệ trước. Sau đ&acirc;y, h&atilde;y c&ugrave;ng t&igrave;m hiểu chi tiết điện thoại Samsung Galaxy S23 Plus.</p>\r\n<h2><strong>Thiết kế tuyệt đẹp c&ugrave;ng m&agrave;n h&igrave;nh xuất sắc</strong></h2>\r\n<h3>Samsung Galaxy S23 Plus được sở hữu m&agrave;n h&igrave;nh cong tuyệt đẹp v&agrave; phần m&aacute;y ảnh được thiết kế th&agrave;nh từng ống k&iacute;nh ri&ecirc;ng biệt tạo chất ri&ecirc;ng cho sản phẩm. Điện thoại xuất hiện với c&aacute;c biến thể m&agrave;u sắc: Đen, Kem, Xanh, T&iacute;m cho cảm gi&aacute;c đơn giản nhưng vẫn rất h&agrave;i h&ograve;a, sang trọng. Tiếp tục, m&aacute;y được bảo vệ bởi k&iacute;nh Glass Glass Victus 2 ở cả hai mặt sau v&agrave; trước tạo cảm gi&aacute;c chắc chắn v&agrave; c&ograve;n được trang bị cảm biến v&acirc;n tay dưới m&agrave;n h&igrave;nh.</h3>\r\n<p style=\"padding-left: 40px;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n</div>', '<p>Đang cập nhật</p>', 'Không có', 11, 800000, NULL, 'Điện thoại', 'Samsung', NULL, 13, '2023-05-03 05:59:35', '2023-08-13 09:12:28'),
(7, 'Macbook Pro 14 inch 2021', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Chip M1 Pro 10 nh&acirc;n&nbsp; - Xử l&yacute; mượt m&agrave; mọi t&aacute;c vụ</li>\r\n<li>SSD 512GB - Tăng tốc to&agrave;n diện m&aacute;y t&iacute;nh, khởi động m&aacute;y v&agrave; c&aacute;c phần mềm nặng chỉ trong v&agrave;i gi&acirc;y</li>\r\n<li>M&agrave;n h&igrave;nh 16.2 inch Liquid Retina XDR (3456 x 2234) - Chất lượng h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc rực rỡ, sống động</li>\r\n<li>Đa dạng kết nối: 3 x Thunderbolt 4 USB-C, HDMI, Jack 3.5 mm</li>\r\n</ul>\r\n<p>Macbook Pro 14 inch 2021&nbsp;được trang bị cấu h&igrave;nh khủng với chip Apple M1 Pro (10CPU/16GPU) kết hợp với bộ nhớ RAM 16GB v&agrave; SSD 1TB mang lại trải nghiệm tuyệt vời với hiệu suất cực đỉnh.</p>\r\n<p>Sản phẩm h&agrave;ng ch&iacute;nh h&atilde;ng Apple Việt Nam, bảo h&agrave;nh 12 th&aacute;ng, đổi mới 30 ng&agrave;y nếu lỗi, hỗ trợ trả g&oacute;p 0% v&agrave; thu cũ đổi mới.</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>16 GPU</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>M1 Pro/M1 Max 10 CPU</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>16GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>1TB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13 inches</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>Trọng lượng</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>', 'Ổ cứng SSD, Viền màn hình siêu mỏng, Wi-Fi 6, Bảo mật vân tay, Nhận diện khuôn mặt', 15, 50000000, NULL, 'Laptop', 'Apple', NULL, 13, '2023-05-05 07:47:21', '2023-08-22 05:00:49'),
(9, 'Apple Smart Watch SE 2023 Premium', '<div class=\"p-2 box_shadow rounded-10 modal-open pl-lg-3 pr-lg-3 mb-3\">\r\n<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<h2>Apple Watch SE 40mm - Sang trọng, đẳng cấp như bản cao cấp</h2>\r\n<p>Năm 2020, chắc hẳn c&aacute;c iFan đang h&aacute;o hức đ&oacute;n chờ c&aacute;c si&ecirc;u phẩm được ra mắt từ Apple. Đặc biệt Apple Watch SE 40mm&nbsp; GPS) l&agrave; một trong những phi&ecirc;n bản được Apple ra mắt v&agrave;o năm 2020 v&agrave; đang được nhiều người d&ugrave;ng quan t&acirc;m kh&ocirc;ng k&eacute;m g&igrave; phi&ecirc;n bản ch&iacute;nh thức cao cấp.</p>\r\n<h3>Thiết kế thời trang, m&agrave;n h&igrave;nh Retina LTPO OLED hiển thị chất lượng cao</h3>\r\n<p>Apple Watch SE 40mm (GPS) c&oacute; thiết kế vừa năng động v&agrave; mang đậm t&iacute;nh thời trang rất giống với thế hệ trước đ&acirc;y m&agrave; nh&agrave; sản xuất Apple đ&atilde; thiết kế.</p>\r\n<p>Hơn thế, d&acirc;y đeo được l&agrave;m từ chất liệu silicon c&oacute; độ đ&agrave;n hồi cao gi&uacute;p người d&ugrave;ng c&oacute; thể đeo trong thời gian d&agrave;i m&agrave; kh&ocirc;ng bị đau tay. Với chất liệu n&agrave;y người d&ugrave;ng dễ d&agrave;ng vệ sinh v&agrave; hạn chế b&aacute;m bẩn v&agrave; mồ h&ocirc;i.</p>\r\n<p>Apple Watch SE 40mm (GPS) c&oacute; thiết kế m&agrave;n h&igrave;nh Retina LTPO OLED rộng gần giống tương tự Apple Watch Series 6 l&agrave; 40mm x 34mm x 10mm.</p>\r\n<p>Với m&agrave;n h&igrave;nh k&iacute;ch thước rộng c&ugrave;ng với độ ph&acirc;n giải cao 448 x 368 pixels hỗ trợ chất lượng hiển thị h&igrave;nh ảnh tr&ecirc;n m&agrave;n h&igrave;nh cao v&agrave; sắc n&eacute;t, mang đến h&igrave;nh ảnh c&oacute; m&agrave;u sắc ch&acirc;n thật v&agrave; tự nhi&ecirc;n.</p>\r\n<h3><strong>Bộ xử l&yacute; S5 SiP mạnh mẽ, chống nước 5 ATM (50m)</strong></h3>\r\n<p>Apple Watch SE&nbsp;40mm (GPS) được h&atilde;ng trang bị bộ xử l&yacute; SiP l&otilde;i k&eacute;p S5 mạnh mẽ cho hiệu suất xử l&yacute; dữ liệu một c&aacute;ch nhanh ch&oacute;ng. Đi k&egrave;m với đ&oacute; l&agrave; bộ nhớ ram 1GB v&agrave; 32GB bộ nhớ trong lưu trữ được nhiều hơn.</p>\r\n<p>Ngo&agrave;i ra chiếc đồng hồ n&agrave;y c&ograve;n được trang bị t&iacute;nh năng đo tiếng ồn v&agrave; ph&aacute;t hiện t&eacute; ng&atilde;, tự động b&aacute;o khẩn cấp nếu người d&ugrave;ng bị t&eacute; ng&atilde; v&agrave; kh&ocirc;ng cử động trong một thời gian nhất định.</p>\r\n<p>Đặc biệt, Apple Watch SE 40mm (GPS) c&ograve;n được t&iacute;ch hợp c&ocirc;ng nghệ chống nước 5 ATM gi&uacute;p thiết bị c&oacute; thể hoạt động b&igrave;nh thường dưới mặt nước 50m m&agrave; kh&ocirc;ng c&oacute; bất kỳ ảnh hưởng g&igrave; hay đi dưới mưa an to&agrave;n.</p>\r\n<h3><strong>Hỗ trợ Bluetooth 5.0, n&acirc;ng cấp nhiều cảm biến quan trọng</strong></h3>\r\n<p>Apple Watch SE 40mm (GPS) được Apple hỗ trợ kết nối hiện đại đ&oacute; l&agrave; Bluetooth 5.0. Gi&uacute;p thiết bị c&oacute; thể kết nối trong khoảng c&aacute;ch l&ecirc;n đến 10m.</p>\r\n<p>C&oacute; thể n&oacute;i Apple Watch SE 40mm l&agrave; smartwatch rất đ&aacute;ng để người d&ugrave;ng sở hữu. So với c&aacute;c thế hệ trước th&igrave; Apple Watch SE 40mm (GPS) n&agrave;y được n&acirc;ng cấp độ cảm biến rất nhạy.</p>\r\n<p>Hơn thế, tr&ecirc;n smartwatch bạn c&ograve;n c&oacute; thể t&igrave;m thấy rất nhiều chế độ tập luyện như chạy, đi bộ, yoga, đạp xe, luyện tập với cường độ cao ngắt qu&atilde;ng v&agrave; khi&ecirc;u vũ hỗ trợ cho người d&ugrave;ng rất nhiều trong tập luyện.</p>\r\n<p>Ngo&agrave;i ra, Apple Watch SE 40mm (GPS) c&ograve;n được trang bị những t&iacute;nh năng hữu &iacute;ch như độ cảm biến đo nhịp tim với thời gian nhanh v&agrave; độ ch&iacute;nh x&aacute;c hơn so với c&aacute;c thế hệ trước ph&ugrave; hợp vận động, leo n&uacute;i,...</p>\r\n</div>\r\n<div class=\"view_mores text-center mb-2\"><a class=\"two pt-2 pb-2 pl-4 pr-4 modal-open position-relative btn rounded-10 box_shadow font-weight-bold\" title=\"Thu gọn\">Thu gọn&nbsp;<img class=\"m_less\" src=\"https://bizweb.dktcdn.net/thumb/pico/100/459/533/themes/868331/assets/sortdown.png?1684809612485\" alt=\"Thu gọn\" /></a></div>\r\n</div>\r\n</div>\r\n<div class=\"m_product p-2 box_shadow rounded-10 modal-open pl-lg-3 pr-lg-3\">&nbsp;</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>LTPO OLED display (1000 nits)</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>448 x 368 pixels</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>1.78 inches</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kĩ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Pin</td>\r\n<td>L&ecirc;n đến 14 ng&agrave;y</td>\r\n</tr>\r\n<tr>\r\n<td>Thời gian sạc</td>\r\n<td>2 giờ</td>\r\n</tr>\r\n<tr>\r\n<td>Cổng sạc</td>\r\n<td>Kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Chất liệu mặt &amp; D&acirc;y</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Chất liệu viền</td>\r\n<td>Nh&ocirc;m</td>\r\n</tr>\r\n<tr>\r\n<td>Chất liệu d&acirc;y (lọc)</td>\r\n<td>Cao su</td>\r\n</tr>\r\n<tr>\r\n<td>Độ d&agrave;i d&acirc;y</td>\r\n<td>140 - 210 mm</td>\r\n</tr>\r\n<tr>\r\n<td>C&oacute; thể thay d&acirc;y</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>32 GB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" style=\"width: 77.0295%; height: 44.8px;\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr style=\"height: 44.8px;\">\r\n<td style=\"width: 41.3922%; height: 44.8px;\">Bluetooth</td>\r\n<td style=\"width: 54.5958%; height: 44.8px;\">5.0, A2DP, LE</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>T&iacute;nh năng nổi bật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng kh&aacute;c</td>\r\n<td>Theo d&otilde;i giấc ngủ, Đo nhịp tim, T&iacute;nh lượng Calories ti&ecirc;u thụ, Ph&aacute;t hiện t&eacute; ng&atilde;, Đếm số bước ch&acirc;n, Chế độ luyện tập &hellip;</td>\r\n</tr>\r\n<tr>\r\n<td>H&atilde;ng sản xuất</td>\r\n<td>Apple Ch&iacute;nh h&atilde;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Chống nước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Chống nước</td>\r\n<td>C&oacute;, độ s&acirc;u dưới 50m</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 100, 13000000, NULL, 'Đồng hồ', 'Apple', NULL, 13, '2023-05-25 05:58:36', '2023-08-23 00:25:44'),
(11, 'Apple Macbook Air M2 2022 8GB 256GB', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<h2><strong>Macbook Air 2022 - Vi xử l&yacute; Apple M2 mạnh mẽ</strong></h2>\r\n<p>Sau th&agrave;nh c&ocirc;ng của d&ograve;ng Macbook M1 th&igrave; Apple lại chuẩn bị mang đến cho người d&ugrave;ng d&ograve;ng sản phẩm Macbook Air 2022 với những điểm n&acirc;ng cấp đ&aacute;ng ch&uacute; &yacute;. B&ecirc;n cạnh đ&oacute; mức gi&aacute; th&agrave;nh lại thấp hơn so với hiện tại, chắc chắn rằng c&aacute;c iFan đang rất n&oacute;ng l&ograve;ng chờ đ&oacute;n sự xuất hiện của d&ograve;ng sản phẩm mới n&agrave;y.</p>\r\n<h3><strong>Thiết kế mỏng nhẹ, m&agrave;n h&igrave;nh Liquid Retina 13.6 inch&nbsp;</strong></h3>\r\n<p>Macbook Air 2022 được thiết kế mỏng nhẹ với trọng lượng 1.24 kg. To&agrave;n bộ phần vỏ vẫn được giữ nguy&ecirc;n chất liệu nh&ocirc;m cứng c&aacute;p, bền bỉ n&ecirc;n vẫn thể hiện được sự sang trọng v&agrave; đẳng cấp. B&ecirc;n cạnh đ&oacute;, c&aacute;c cạnh bo tr&ograve;n mềm mại c&ugrave;ng được v&aacute;t mỏng mang đến một tổng thể tuyệt mỹ v&agrave; v&ocirc; c&ugrave;ng gọn g&agrave;ng.</p>\r\n<p>Tr&ecirc;n Macbook Air 2022 n&agrave;y, Apple sẽ trang bị cho m&aacute;y m&agrave;n h&igrave;nh Liquid Retina k&iacute;ch thước 13.6 inch, hỗ trợ đến 1 tỷ m&agrave;u. B&ecirc;n cạnh đ&oacute; l&agrave; độ s&aacute;ng 500 nits, dải m&agrave;u rộng P3 c&ugrave;ng c&ocirc;ng nghệ True Tone.</p>\r\n<p>Nhờ vậy m&agrave; h&igrave;nh ảnh hiển thị sống động, rực rỡ, độ tương phản phong ph&uacute;, chi tiết sắc n&eacute;t hơn rất nhiều. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; m&agrave;n h&igrave;nh lớn v&agrave; s&aacute;ng nhất so với c&aacute;c thế hệ Macbook Air trước đ&acirc;y.</p>\r\n<h3><strong>Hiệu năng cực khủng với chip M2</strong>&nbsp;</h3>\r\n<p>Macbook Air 2022 mang đến sự kh&aacute;c biệt về hiệu năng khi được trang bị con chip Apple thế hệ Silicon tiếp theo. Tốc độ v&agrave; hiệu suất năng lượng cao hơn so với thế hệ M1, do đ&oacute; người d&ugrave;ng c&oacute; thể ho&agrave;n th&agrave;nh được nhiều t&aacute;c vụ, c&ocirc;ng việc.</p>\r\n<p>Với chip Silicon Macbook Air 2022 mang đến hiệu năng v&ocirc; c&ugrave;ng mạnh mẽ. Bạn c&oacute; thể thoải m&aacute;i hiện nhiều t&aacute;c vụ nặng như dựng c&aacute;c video 4K v&agrave; 8K Apple m&agrave; kh&ocirc;ng hề gặp bất kỳ kh&oacute; khăn n&agrave;o. Đồng thời hiệu suất m&agrave; ch&uacute;ng mang lại cũng mạnh mẽ hơn v&agrave; ti&ecirc;u tốn &iacute;t năng lượng hơn.</p>\r\n<p>Ngo&agrave;i ra, bộ vi xử l&yacute; mới n&agrave;y cũng được tối ưu. Ch&uacute;ng gi&uacute;p giao diện được n&acirc;ng cấp, tối giản ho&aacute; biểu tượng, đồng thời quản l&yacute; th&ocirc;ng b&aacute;o cũng như t&ugrave;y chỉnh c&aacute;c thiết lập nhanh được trở n&ecirc;n dễ d&agrave;ng.</p>\r\n<h3><strong>Tăng tốc độ truy cập, t&iacute;nh năng th&uacute; vị với thiết bị kh&aacute;c trong hệ sinh th&aacute;i Apple&nbsp;</strong></h3>\r\n<p>Với hơn 10.000 ứng dụng v&agrave; plugin được tối ưu ho&aacute; cho chipset, người d&ugrave;ng dễ d&agrave;ng s&aacute;ng tạo hơn trong c&ocirc;ng việc. Th&ecirc;m v&agrave;o đ&oacute; thao t&aacute;c truy cập v&agrave;o c&aacute;c ứng dụng diễn ra chỉ trong t&iacute;ch tắc, bao gồm Microsoft 365 v&agrave; nhiều ứng dụng iOS kh&aacute;c.</p>\r\n<p>Đặc biệt, thiết bị c&ograve;n c&oacute; t&iacute;nh năng thực hiện v&agrave; nhận cuộc gọi iPhone, kết nối iPad như m&agrave;n h&igrave;nh hiển thị thứ hai v&agrave; mở kho&aacute; Macbook bằng Apple Watch.</p>\r\n<h3><strong>Dung lượng pin lớn, hệ thống tản nhiệt th&ocirc;ng minh</strong></h3>\r\n<p>Nhờ được trang bị bộ vi xử l&yacute; mới v&ocirc; c&ugrave;ng độc đ&aacute;o gi&uacute;p Macbook Air 2022 tiết kiệm năng lượng một c&aacute;ch tối đa. Với trang bị vi&ecirc;n pin lớn, bạn thoải m&aacute;i lướt web, nghe nhạc, giải tr&iacute; hoặc l&agrave;m việc trong cả ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng lo hết pin.</p>\r\n<p align=\"center\">B&ecirc;n cạnh đ&oacute;, hệ thống tản nhiệt th&ocirc;ng minh được trang bị tr&ecirc;n m&aacute;y gi&uacute;p m&aacute;y kh&ocirc;ng bị n&oacute;ng trong qu&aacute; tr&igrave;nh hoạt động. Đặc biệt, gi&uacute;p cho hiệu suất lu&ocirc;n được duy tr&igrave; v&agrave; đảm bảo trong thời gian d&agrave;i.</p>\r\n<h3><strong>TrackPad đa điểm, b&agrave;n ph&iacute;m t&iacute;ch hợp nhiều chức năng</strong></h3>\r\n<p>Một trong những điểm nổi bật nữa của MacBook Air 2022 mang đặc trưng của nh&agrave; Apple đ&oacute; l&agrave; TrackPad, với c&aacute;c cử động được thao t&aacute;c ho&agrave;n to&agrave;n bằng c&aacute;c ng&oacute;n tay sẽ cho bạn l&agrave;m chủ mọi thứ tr&ecirc;n chiếc MacBook Air n&agrave;y.</p>\r\n<p>B&agrave;n ph&iacute;m Magic Keyboard c&oacute; h&agrave;ng ph&iacute;m chức năng hỗ trợ truy cập nhanh, ph&iacute;m điều khiển v&agrave; ph&iacute;m tắt. Ngo&agrave;i ra, touch ID gi&uacute;p mở kho&aacute; dễ d&agrave;ng v&agrave; thanh to&aacute;n an to&agrave;n chỉ bằng một thao t&aacute;c chạm.</p>\r\n<h3><strong>Chất lượng h&igrave;nh ảnh cuộc gọi sắc n&eacute;t, &acirc;m thanh sống động</strong></h3>\r\n<p>MacBook Air 2022 sở hữu t&iacute;nh năng gọi điện video camera Facetime độ ph&acirc;n giải 1080 kết hợp micro. Trong qu&aacute; tr&igrave;nh tr&ograve; chuyện, bạn sẽ cảm nhận được h&igrave;nh ảnh r&otilde; r&agrave;ng, sắc n&eacute;t, hiệu suất &aacute;nh s&aacute;ng được cải thiện.</p>\r\n<p>Hệ thống &acirc;m thanh 4 loa (2 loa tweeter v&agrave; 2 loa trầm) kết hợp c&ocirc;ng nghệ Spatial Audio cho &acirc;m thanh r&otilde; r&agrave;ng d&ugrave; bạn đang ở bất kỳ đ&acirc;u. Đồng thời, người d&ugrave;ng sẽ đắm ch&igrave;m trong kh&ocirc;ng gian &acirc;m nhạc tuyệt vời c&ugrave;ng c&aacute;c bản nhạc đầy cảm x&uacute;c v&agrave; giọng h&aacute;t ấm trong.</p>\r\n<h3><strong>Kết nối đơn giản, kho lưu trữ khổng lồ</strong></h3>\r\n<p>Cổng Masafe hỗ trợ cắm v&agrave; th&aacute;o sạc nam ch&acirc;m nhanh ch&oacute;ng. Hai cổng Thunderbolt cho ph&eacute;p kết nối v&agrave; sạc pin tốc độ cao cho c&aacute;c phụ kiện, người d&ugrave;ng c&oacute; thể kết nối với m&agrave;n h&igrave;nh 6K. Cuối c&ugrave;ng jack cắm tai nghe 3.5 hỗ trợ kết nối với tai nghe trở kh&aacute;ng cao.</p>\r\n<p>Ổ SSD dữ liệu khổng lồ cho ph&eacute;p lưu trữ khối lượng dữ liệu, c&aacute;c file nặng như: video, h&igrave;nh ảnh, &acirc;m thanh, words, excel hay c&aacute;c ứng dụng cần ti&ecirc;u tốn lượng lớn kh&ocirc;ng gian. Với con chip mạnh mẽ, d&ugrave; file nặng nhưng bạn vẫn c&oacute; thể mở ra trong nh&aacute;y mắt.</p>\r\n<h2><strong>Macbook Air M2 2022 gi&aacute; bao nhi&ecirc;u tiền, khi n&agrave;o ra mắt?</strong></h2>\r\n<p>Macbook Air M2 2022 được h&atilde;ng c&ocirc;ng nghệ Apple ch&iacute;nh thức được giới thiệu đến người ti&ecirc;u d&ugrave;ng tại sự kiện&nbsp;WWDC 2022 vừa qua. M&aacute;y sẽ l&ecirc;n kệ với gi&aacute; b&aacute;n khoảng&nbsp;1.199 USD, hơn 27 triệu đồng. Mức gi&aacute; n&agrave;y ch&ecirc;nh lệch 200 USD so với Macbook Air M1 (999 USD).</p>\r\n<p>Macbook Air M2 2022 với con chip mới mạnh hơn 20% so với phi&ecirc;n bản tiền nhiệm. Đ&acirc;y l&agrave; một mẫu Macbook đ&aacute;ng để trải nghiệm v&agrave; sở hữu nếu bạn đang sở hữu Macbook M1 th&igrave; ho&agrave;n to&agrave;n c&oacute; thể c&acirc;n nhắc l&ecirc;n thế hệ M2. Tuy nhi&ecirc;n nếu bạn đang ph&acirc;n chọn mua Macbook M1 hay Macbook M2 để sử dụng th&igrave; Macbook M1 2020 vẫn l&agrave; một lựa chọn l&yacute; tưởng.</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>Apple M2</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>8 nh&acirc;n GPU, 16 nh&acirc;n Neural Engine</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>8GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>256GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13 inches</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p data-v-4e304e03=\"\">Trọng lượng</p>\r\n</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 34, 33000000, NULL, 'Laptop', 'Apple', NULL, 13, '2023-05-25 06:08:37', '2023-08-23 19:12:46'),
(12, 'OPPO Reno6 Z 5G', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<h2 align=\"center\"><strong>Đ&aacute;nh gi&aacute; Oppo Reno6 Z 5G&nbsp;</strong><strong>&ndash; Smartphone mạnh mẽ với&nbsp;</strong><strong>thiết kế sang trọng</strong></h2>\r\n<p>Tiếp nối sự th&agrave;nh c&ocirc;ng của Reno5 Series, Oppo tiếp tục mang đến cho người d&ugrave;ng d&ograve;ng sản phẩm mới mang t&ecirc;n&nbsp;Oppo&nbsp;Reno6&nbsp;với nhiều n&acirc;ng cấp đ&aacute;ng gi&aacute;. Trong series lần n&agrave;y, người d&ugrave;ng sẽ thấy v&ocirc; c&ugrave;ng ngạc nhi&ecirc;n khi xuất hiện tới 4 phi&ecirc;n bản. Sự c&oacute; mặt của&nbsp;<strong>Oppo Reno6 Z 5G</strong>&nbsp;trong lần ra mắt n&agrave;y sẽ thu h&uacute;t được đ&ocirc;ng đảo người ch&uacute; &yacute; bởi hiệu năng cực đỉnh để mang đến những trải nghiệm đỉnh cao.</p>\r\n<p>Ngo&agrave;i ra, bạn cũng c&oacute; thể tham khảo&nbsp;điện thoại OPPO Reno7 Z 5G&nbsp;với thiết kế cực đẹp c&ugrave;ng hệ thống camera chất lượng v&agrave; cấu h&igrave;nh ấn tượng trong tầm gi&aacute;.</p>\r\n<h3><strong>Thiết kế thời thượng, đẳng cấp vượt trội</strong></h3>\r\n<p>Điện thoại Reno6 Z 5G sở hữu thiết kế v&ocirc; c&ugrave;ng thời thượng. C&aacute;c đường n&eacute;t, chi tiết tr&ecirc;n m&aacute;y được trau chuốt ho&agrave;n hảo v&agrave; cực kỳ hấp dẫn. C&aacute;c khung viền bo cong uyển chuyển, mềm mại mang đến cho người d&ugrave;ng cảm gi&aacute;c &ecirc;m tay khi cầm nắm. Ngo&agrave;i ra, k&iacute;ch thước tổng thể của m&aacute;y rất nhỏ gọn v&agrave; thuận tiện để người d&ugrave;ng mang theo b&ecirc;n m&igrave;nh mọi nơi.</p>\r\n<p>Mặt trước của điện thoại OPPO Reno6 Z 5G được thiết kế tr&agrave;n viền v&agrave; độ cong mềm mại 2.5D. Hai cạnh viền cực mỏng với camera đục lỗ từ đ&oacute; gi&uacute;p gia tăng diện t&iacute;ch hiển thị đến mức tối đa.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh lớn, sắc n&eacute;t với tốc độ l&agrave;m mới cao</strong></h3>\r\n<p>B&ecirc;n cạnh thiết kế nổi trội th&igrave;&nbsp;Reno6 Z 5G&nbsp;c&ograve;n được trang bị m&agrave;n h&igrave;nh lớn với tấm nền AMOLED chất lượng. B&ecirc;n cạnh đ&oacute; độ ph&acirc;n giải FHD+ mang đến chất lượng h&igrave;nh ảnh v&ocirc; c&ugrave;ng ch&acirc;n thật v&agrave; sắc n&eacute;t.</p>\r\n<p>Đặc biệt, tốc độ l&agrave;m mới m&agrave;n h&igrave;nh cao gi&uacute;p Oppo Reno6 Z 5G c&oacute; độ phản hồi nhanh. Bạn c&oacute; thể cảm nhận r&otilde; r&agrave;ng khi trải nghiệm những phim chất lượng cao hoặc l&agrave; chơi những game đồ họa nặng. Từ đ&oacute;, người d&ugrave;ng c&oacute; thể tận hưởng trọn vẹn v&agrave; kh&ocirc;ng bỏ lỡ bất kỳ khoảnh khắc ấn tượng n&agrave;o.</p>\r\n<h3><strong>Hiệu năng cực đỉnh với con chip hiện đại nhất</strong></h3>\r\n<p>Để mang đến hiệu năng cực đỉnh, Oppo đ&atilde; trang bị cho&nbsp;Reno6 Z 5G&nbsp;con chip mạnh mẽ bậc nhất hiện nay. Với trang bị ấn tượng n&agrave;y, người d&ugrave;ng thoải m&aacute;i thực hiện c&aacute;c t&aacute;c vụ đa nhiệm cũng như tự tin chiếm mọi tựa game đồ hoạ hiện nay.</p>\r\n<p>Đi c&ugrave;ng với con chip h&agrave;ng đầu l&agrave; dung lượng RAM kh&aacute; lớn gi&uacute;p người d&ugrave;ng thoải m&aacute;i trải nghiệm những ứng dụng giải tr&iacute; mượt m&agrave; tr&ecirc;n&nbsp;OPPO Reno6 Z 5G. B&ecirc;n cạnh đ&oacute; l&agrave; bộ nhớ trong lớn đ&aacute;p ứng được tối đa nhu cầu lưu trữ t&agrave;i liệu hay tải những ứng dụng, tr&ograve; chơi hấp dẫn m&agrave; kh&ocirc;ng lo đầy bộ nhớ.</p>\r\n<h3><strong>Camera chuy&ecirc;n nghiệp với cảm biến cực lớn</strong></h3>\r\n<p>Kh&ocirc;ng chỉ g&acirc;y ấn tượng với người d&ugrave;ng bởi hiệu năng mạnh mẽ m&agrave;&nbsp;<strong>Reno6 Z 5G&nbsp;</strong>c&ograve;n gi&uacute;p người d&ugrave;ng trở th&agrave;nh một nhiếp ảnh gia chuy&ecirc;n nghiệp với ống k&iacute;nh ấn tượng. Cụm 4 camera sau với độ ph&acirc;n giải cực lớn c&ugrave;ng với v&ocirc; v&agrave;n c&aacute;c t&iacute;nh năng ưu việt, hỗ trợ người d&ugrave;ng c&oacute; thể bắt trọn từng khoảnh khắc trong khung h&igrave;nh một c&aacute;ch độc đ&aacute;o v&agrave; ấn tượng.</p>\r\n<p>Camera selfie l&agrave; điểm nổi bật của d&ograve;ng smartphone đến từ Trung Quốc n&agrave;y. Điện thoại c&oacute; camera trước độ ph&acirc;n giải cao n&ecirc;n ho&agrave;n to&agrave;n đ&aacute;p ứng được nhu cầu selfie của người d&ugrave;ng. B&ecirc;n cạnh đ&oacute; l&agrave; c&aacute;c t&iacute;nh năng mới bao gồm: chụp cận cảnh, chụp xo&aacute; ph&ocirc;ng hay chụp trong điều kiện thiếu s&aacute;ng. Tất cả mang đến cho người d&ugrave;ng sự h&agrave;i l&ograve;ng nhất.</p>\r\n<p>Ngo&agrave;i ra,&nbsp;Reno6 Z 5G&nbsp;c&ograve;n hỗ trợ quay phim HDR, chế độ quay ngược s&aacute;ng m&agrave; vẫn giữ được c&aacute;c chi tiết tổng thể tự nhi&ecirc;n v&agrave; r&otilde; n&eacute;t. B&ecirc;n cạnh đ&oacute;, chế độ si&ecirc;u chống rung c&ugrave;ng với quay đồng thời 2 camera gi&uacute;p người d&ugrave;ng c&oacute; thể thoải m&aacute;i s&aacute;ng tạo c&aacute;c video, tạo ra c&aacute;c vlog đẹp v&agrave; đa dạng ở mọi g&oacute;c nh&igrave;n.</p>\r\n<h3><strong>Dung lượng pin lớn, c&ocirc;ng nghệ sạc nhanh hiện đại</strong></h3>\r\n<p>OPPO Reno6 Z 5G&nbsp;sở hữu vi&ecirc;n pin c&oacute; dung lượng lớn. Bạn c&oacute; thể thoải m&aacute;i trải nghiệm cả ng&agrave;y d&agrave;i m&agrave; kh&ocirc;ng lo vấn đề bị gi&aacute;n đoạn do hết pin.</p>\r\n<p>Để tiết kiệm được tối đa thời gian sạc, h&atilde;ng cũng trang bị cho m&aacute;y c&ocirc;ng nghệ sạc nhanh với c&ocirc;ng suất lớn. Từ đ&oacute; người d&ugrave;ng c&oacute; thể r&uacute;t ngắn thời gian sạc m&aacute;y để n&acirc;ng cao thời gian trải nghiệm tr&ecirc;n điện thoại.</p>\r\n<h2><strong>Điện thoại OPPO Reno6 Z 5G&nbsp;gi&aacute; bao nhi&ecirc;u, khi n&agrave;o ra mắt?</strong></h2>\r\n<p>Reno6 Z 5G&nbsp;được ra mắt c&ugrave;ng với series Reno 6 v&agrave;o ng&agrave;y cuối th&aacute;ng 7 sắp tới. Đ&acirc;y chắc chắn l&agrave; sự kiện thu h&uacute;t được đ&ocirc;ng đảo người quan t&acirc;m.</p>\r\n<p>Hiện tại gi&aacute; b&aacute;n của sản phẩm đang ở mức 36,415 Rs ở thị trường Ấn Độ tương đương khoảng hơn 9 triệu đồng.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\n<td>AMOLED</td>\n</tr>\n<tr>\n<td>Độ ph&acirc;n giải</td>\n<td>1080 x 2400 pixels (FullHD+)</td>\n</tr>\n<tr>\n<td>M&agrave;n h&igrave;nh rộng</td>\n<td>6.43 inches</td>\n</tr>\n<tr>\n<td>T&iacute;nh năng m&agrave;n h&igrave;nh</td>\n<td>Tần số qu&eacute;t 60 Hz, Độ s&aacute;ng tối đa 430 nits</td>\n</tr>\n</tbody>\n</table>\n<h4>Camera sau</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>Độ ph&acirc;n giải</td>\n<td>64MP (Ch&iacute;nh) + 8MP (G&oacute;c rộng) + 2MP (Marco)</td>\n</tr>\n<tr>\n<td>Quay phim</td>\n<td>4K 2160p@30fps, FullHD 1080p@60fps</td>\n</tr>\n<tr>\n<td>Đ&egrave;n flash</td>\n<td>C&oacute;</td>\n</tr>\n<tr>\n<td>T&iacute;nh năng</td>\n<td>G&oacute;c rộng<br />G&oacute;c si&ecirc;u rộng<br />HDR<br />Lấy n&eacute;t theo pha (PDAF)<br />Si&ecirc;u cận<br />To&agrave;n cảnh<br />X&oacute;a ph&ocirc;ng</td>\n</tr>\n</tbody>\n</table>\n<h4>Camera trước</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>Độ ph&acirc;n giải</td>\n<td>32 MP</td>\n</tr>\n<tr>\n<td>Quay phim</td>\n<td>1080p@30fps</td>\n</tr>\n</tbody>\n</table>\n<h4>Hệ điều h&agrave;nh</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>OS</td>\n<td>ColorOS 11.3, nền tảng Android 11</td>\n</tr>\n<tr>\n<td>CPU</td>\n<td>2 nh&acirc;n 2.4 GHz &amp; 6 nh&acirc;n 2 GHz</td>\n</tr>\n<tr>\n<td>Chipset</td>\n<td>MediaTek Dimensity 800U 5G 8 nh&acirc;n</td>\n</tr>\n<tr>\n<td>GPU</td>\n<td>Mali-G57 MC3</td>\n</tr>\n</tbody>\n</table>\n<h4>Bộ nhớ, lưu trữ</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>RAM</td>\n<td>8GB</td>\n</tr>\n<tr>\n<td>Bộ nhớ trong</td>\n<td>256GB</td>\n</tr>\n<tr>\n<td>Bộ nhớ khả dụng</td>\n<td>~100GB</td>\n</tr>\n<tr>\n<td>Thẻ nhớ</td>\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\n</tr>\n<tr>\n<td>Danh bạ</td>\n<td>Kh&ocirc;ng giới hạn</td>\n</tr>\n</tbody>\n</table>\n<h4>Kết nối</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>Mạng di động</td>\n<td>Hỗ trợ 5G</td>\n</tr>\n<tr>\n<td>SIM</td>\n<td>2 SIM (Nano-SIM)</td>\n</tr>\n<tr>\n<td>Wifi</td>\n<td>Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot</td>\n</tr>\n<tr>\n<td>GPS</td>\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\n</tr>\n<tr>\n<td>Bluetooth</td>\n<td>5.2, A2DP, LE</td>\n</tr>\n<tr>\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\n<td>Type-C</td>\n</tr>\n<tr>\n<td>Jack tai nghe</td>\n<td>3.5</td>\n</tr>\n<tr>\n<td>Kết nối kh&aacute;c</td>\n<td>NFC</td>\n</tr>\n</tbody>\n</table>\n<h4>Pin, sạc</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>Dung lượng pin</td>\n<td>4500 mAh</td>\n</tr>\n<tr>\n<td>Loại pin</td>\n<td>Li-po</td>\n</tr>\n<tr>\n<td>Hỗ trợ sạc tối đa</td>\n<td>25W</td>\n</tr>\n<tr>\n<td>C&ocirc;ng nghệ pin</td>\n<td>Sạc pin nhanh</td>\n</tr>\n</tbody>\n</table>\n<h4>Tiện &iacute;ch</h4>\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\n<tbody>\n<tr>\n<td>Bảo mật n&acirc;ng cao</td>\n<td>Cảm biến v&acirc;n tay cạnh b&ecirc;n</td>\n</tr>\n<tr>\n<td>T&iacute;nh năng đặc biệt</td>\n<td>Hỗ trợ 5G, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\n</tr>\n<tr>\n<td>C&aacute;c loại cảm biến</td>\n<td>Cảm biến gia tốc, Cảm biến tiệm cận, La b&agrave;n, Con quay hồi chuyển</td>\n</tr>\n</tbody>\n</table>', NULL, 35, 13000000, NULL, 'Điện thoại', 'Oppo', NULL, 13, '2023-05-25 06:11:09', '2023-07-14 05:35:31');
INSERT INTO `products` (`id`, `name`, `description`, `specifications`, `salient_features`, `count`, `price`, `sold`, `type`, `supplier`, `star`, `user_id`, `created_at`, `updated_at`) VALUES
(13, 'iPhone 13 128GB', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<ul>\r\n<li>Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao</li>\r\n<li>Kh&ocirc;ng gian hiển thị sống động - M&agrave;n h&igrave;nh 6.1\" Super Retina XDR độ s&aacute;ng cao, sắc n&eacute;t</li>\r\n<li>Trải nghiệm điện ảnh đỉnh cao - Camera k&eacute;p 12MP, hỗ trợ ổn định h&igrave;nh ảnh quang học</li>\r\n<li>Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 ph&uacute;t</li>\r\n</ul>\r\n<h2><strong>Đ&aacute;nh gi&aacute; iPhone 13 - Flagship được mong chờ năm 2021</strong></h2>\r\n<p>Cuối năm 2020, bộ 4 iPhone 12 đ&atilde; được ra mắt với nhiều c&aacute;i tiến. Sau đ&oacute;, mọi sự quan t&acirc;m lại đổ dồn v&agrave;o sản phẩm tiếp theo &ndash;&nbsp;<strong>iPhone 13.</strong>&nbsp;Vậy iP&nbsp;13 sẽ c&oacute; những g&igrave; nổi bật, h&atilde;y t&igrave;m hiểu ngay sau đ&acirc;y nh&eacute;!</p>\r\n<h3><strong>Thiết kế với nhiều đột ph&aacute;</strong></h3>\r\n<p>Về k&iacute;ch thước, iPhone 13 sẽ c&oacute; 4 phi&ecirc;n bản kh&aacute;c nhau v&agrave; k&iacute;ch thước kh&ocirc;ng đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 c&oacute; sự thay đổi trong thiết kế từ g&oacute;c cạnh bo tr&ograve;n (Thiết kế được duy tr&igrave; từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vu&ocirc;ng vắn (đ&atilde; từng c&oacute; mặt tr&ecirc;n iPhone 4 đến iPhone 5S, SE).</p>\r\n<p>Th&igrave; tr&ecirc;n&nbsp;<strong>điện thoại iPhone 13</strong>&nbsp;vẫn được duy tr&igrave; một thiết kế tương tự. M&aacute;y&nbsp;vẫn c&oacute; phi&ecirc;n bản khung viền th&eacute;p, một số phi&ecirc;n bản khung nh&ocirc;m c&ugrave;ng mặt lưng k&iacute;nh. Tương tự năm ngo&aacute;i, Apple&nbsp;cũng sẽ cho ra mắt 4 phi&ecirc;n bản l&agrave; iPhone 13, 13 mini, 13 Pro v&agrave; 13 Pro Max.</p>\r\n<p>Phần tai thỏ tr&ecirc;n iPhone 13 cũng c&oacute; thay đổi so với thế hệ trước, cụ thể tai thỏ n&agrave;y được l&agrave;m nhỏ hơn so với 20%, trong khi đ&oacute; độ d&agrave;y của m&aacute;y vẫn được giữ nguy&ecirc;n.&nbsp;Điểm kh&aacute;c biệt nhất về thiết kế tr&ecirc;n thế hệ iPhone 2021 n&agrave;y đ&oacute; l&agrave; camera ch&eacute;o.</p>\r\n<p>M&agrave;u sắc tr&ecirc;n mẫu iPhone mới n&agrave;y cũng đa dạng hơn, trong đ&oacute; nổi bật l&agrave; iPhone 13 m&agrave;u hồng. C&aacute;c m&agrave;u sắc c&ograve;n lại đề đ&atilde; từng được xuất hiện tr&ecirc;n c&aacute;c phi&ecirc;n bản trước đ&oacute; như trắng, đen, đỏ, xanh blue.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh m&agrave;n h&igrave;nh Super Retina XDR độ s&aacute;ng cao</strong></h3>\r\n<p>Điện thoại iPhone 13 sẽ được sử dụng tấm nền OLED chất lượng cao v&agrave; c&oacute; k&iacute;ch thước 6.1 inch, lớn hơn&nbsp;<strong>iPhone 13 mini</strong>&nbsp;(5.4 inch). Với tấm nền n&agrave;y với c&ocirc;ng nghệ ProMotion gi&uacute;p iPhone 13 tiết kiệm pin đến tối đa khi sử dụng. Người d&ugrave;ng cũng c&oacute; thể dễ d&agrave;ng điều chỉnh tốc độ l&agrave;m tươi t&ugrave;y theo &yacute; th&iacute;ch.</p>\r\n<p>Về khả năng hiển thị, mang đến chất lượng hiển thị vượt trội với m&agrave;n h&igrave;nh OLED độ ph&acirc;n giải cao, độ s&aacute;ng lớn. Nhờ đ&oacute; người d&ugrave;ng c&oacute; thể nh&igrave;n r&otilde; trong nhiều điều kiện s&aacute;ng kh&aacute;c nhau, kể cả ngo&agrave;i trời.</p>\r\n<p>Cụ thể, m&agrave;n h&igrave;nh&nbsp;Super Retina XDR với độ s&aacute;ng cao l&ecirc;n đ&ecirc;n 800 nits, v&agrave; tối đa c&oacute; thể l&ecirc;n tới&nbsp;1200 nits c&ugrave;ng dải m&agrave;u rộng P3, tỉ lệ tương phản lớn. Ph&iacute;a b&ecirc;n ngo&agrave;i m&agrave;n h&igrave;nh được phủ lớp&nbsp;oleophobic gi&uacute;p chống b&aacute;m v&acirc;n tay. Nhờ đ&oacute; hạn chế được c&aacute;c t&igrave;nh trạng b&aacute;m bụi bẩn v&agrave; mồ h&ocirc;i trong qu&aacute; tr&igrave;nh sử dụng.</p>\r\n<h3><strong>Camera k&eacute;p 12MP, hỗ trợ ổn định h&igrave;nh ảnh quang học</strong></h3>\r\n<p>iPhone 13 c&oacute; một sự thay đổi lớn về camera so với tr&ecirc;n iPhone 12 Series. Cụ thể, iPhone c&oacute; thể được trang bị ống k&iacute;nh si&ecirc;u rộng mới gi&uacute;p m&aacute;y hiển thị được nhiều chi tiết hơn ở c&aacute;c bức h&igrave;nh thiếu s&aacute;ng.&nbsp;Trong khi đ&oacute; ống k&iacute;nh g&oacute;c rộng c&oacute; thể thu được nhiều s&aacute;ng hơn, l&ecirc;n đến 47% gi&uacute;p chất lượng bức ảnh, video được cải thiện hơn.</p>\r\n<p>Cụm camera được trang bị t&iacute;nh năng ổn định h&igrave;nh ảnh quang học c&ugrave;ng cảm biến mới, nhờ đ&oacute; bức h&igrave;nh chụp mang lại khả năng ổn định.</p>\r\n<p>Số ống k&iacute;nh tr&ecirc;n iPhone 13 vẫn được giữ nguy&ecirc;n so với iPhone 12, chỉ kh&aacute;c về vị tr&iacute; từng ống kinh. Cả hai ống k&iacute;nh vẫn sở hữu độ ph&acirc;n giải 12MP. Trong đ&oacute; camera g&oacute;c rộng được trang bị khẩu độ&nbsp;&fnof; / 1.6 trong khi g&oacute;c si&ecirc;u rộng l&agrave;&nbsp;&fnof; / 2.4 c&ugrave;ng g&oacute;c quay 120 độ.</p>\r\n<p>Với iP13, người d&ugrave;ng c&oacute; thể quay phim chuy&ecirc;n nghiệp với chế độ điện ảnh. Cụm camera n&agrave;y cũng hỗ trợ người d&ugrave;ng chụp c&ugrave;ng l&uacute;c nhiều bức ảnh kh&aacute;c nhau m&agrave; kh&ocirc;ng cần nhấc ng&oacute;n tay. Đặc biệt với chế độ ch&acirc;n dung hỗ trợ l&agrave;m mờ hậu cảnh chuy&ecirc;n nghiệp gi&uacute;p to&agrave;n bức ảnh tập trung v&agrave;o chủ thể m&agrave; người d&ugrave;ng hướng tới.</p>\r\n<p>Ở chế độ chụp&nbsp;Smart HDR 4, m&aacute;y c&oacute; thể nhận diện được tối đa bốn người kh&aacute;c nhau trong một khung h&igrave;nh. Sau đ&oacute; sẽ tiến h&agrave;nh tối ưu h&oacute;a &aacute;nh s&aacute;ng, độ tương phản v&agrave; tone m&agrave;y cho từng người, mang lại một bức ảnh chất lượng tốt nhất.&nbsp;Nếu sử dụng b&ecirc;n đ&ecirc;m để chụp c&aacute;c bức ảnh thiếu s&aacute;ng, l&uacute;c n&agrave;y chế độ&nbsp;Deep Fusion k&iacute;ch hoạt v&agrave; ph&acirc;n t&iacute;ch chế độ phơi s&aacute;ng ở từng&nbsp;pixel.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Nhờ đ&oacute;, ảnh chụp tr&ecirc;n điện thoại hứa hẹn mang đến chất lượng như được chụp từ một m&aacute;y ảnh chuy&ecirc;n nghiệp. H&igrave;nh ảnh cho ra với chi tiết r&otilde;, dải nhạy s&aacute;ng cao, m&agrave;u sắc ch&acirc;n thực. Khả năng chụp đ&ecirc;m tr&ecirc;n 13 cũng được cải thiện với khả năng phơi s&aacute;ng tốt hơn mang đến nhi&ecirc;u chi tiết hơn.</p>\r\n<p>Về camera trước, điện thoại vẫn được trang bị camera đơn nằm trong notch tai thỏ với độ ph&acirc;n giải&nbsp;12MP c&ugrave;ng&nbsp;khẩu độ&nbsp;&fnof; / 2.2. Camera selfie n&agrave;y cũng được trang bị nhiều c&ocirc;ng nghệ chụp ảnh chuy&ecirc;n nghiệp như&nbsp;hiệu ứng bokeh, chế độ điện ảnh,&nbsp;Animoji v&agrave; Memoji,... mang lại những bức h&igrave;nh selfie chất lượng.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Khả năng quay video được cải thiện</strong></h3>\r\n<p>Về khả năng quay video, iPhone 13 c&oacute; thể hỗ trợ quay video 4K ở tốc độ ở ba tốc độ khung h&igrave;nh kh&aacute;c nhau. M&aacute;y cũng hỗ trợ t&iacute;nh năng ổn định h&igrave;nh ảnh quang học c&ugrave;ng khả năng zoom 3x.&nbsp;Nhờ đ&oacute;, hứa hẹn mang để khả năng quay phim chuy&ecirc;n nghiệp.</p>\r\n<p>&nbsp;</p>\r\n<p>iPhone 13 cũng hỗ trợ nhiều c&ocirc;ng cụ t&ugrave;y chỉnh n&acirc;ng cao với c&ocirc;ng nghệ Dolby Vision c&ugrave;ng khả năng quay Video HDR với độ ph&acirc;n giải 4K. Đặc biệt, người d&ugrave;ng c&oacute; thể l&agrave;m mọi việc tr&ecirc;n chiếc điện thoại n&agrave;y từ quay phim, chỉnh sửa&nbsp;đến&nbsp;render video một c&aacute;ch mượt m&agrave;.</p>\r\n<h3><strong>Tốc độ 5G tốt hơn với nhiều băng tần</strong></h3>\r\n<p>Thế hệ iPhone mới được cải thiện chất lượng 5G với nhiều băng tần hơn. Nhờ đ&oacute; việc xem trực tuyến hay tải xuống dữ liệu diễn ra nhanh hơn. Đặc biệt với chế độ dữ liệu th&ocirc;ng minh, thiết bị sẽ tự động ph&aacute;t hiện v&agrave; giảm tải tốc độ khi kh&ocirc;ng cần thiết kể tiết kiệm năng lượng.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Hiệu năng vượt trội với chip Apple A15</strong></h3>\r\n<p>iPhone 13 Series sẽ được trang bị con chip Apple A15 Bionic, chip set được sản xuất tr&ecirc;n quy tr&igrave;nh 5nm. Theo nh&agrave; sản xuất, con chip&nbsp;Apple A15 Bionic cho CPU nhanh hơn 50% v&agrave; GPU nhanh hơn 30% so với đối thủ.</p>\r\n<p>&nbsp;</p>\r\n<p>Hiệu năng tr&ecirc;n iPhone l&agrave; một điều khỏi phải b&agrave;n c&atilde;i. Vẫn mang trọng m&igrave;nh một sức mạnh vượt trội nhờ con chip Apple A15 được tối ưu, hệ điều h&agrave;nh iOS t&ugrave;y biến. iPhone 13 cũng c&oacute; thể chiến tốt mọi tựa game mới nhất mới max cấu h&igrave;nh đồ họa, mang đến những trải nghiệm chơi game mượt m&agrave;.</p>\r\n<h3><strong>C&ocirc;ng nghệ pin mới n&acirc;ng cao thời gian sử dụng</strong></h3>\r\n<p>Với bộ vi xử l&yacute; mới được tối ưu, điện thoại iPhone 13 mang lại vi&ecirc;n pin với thời gian sử dụng l&acirc;u d&agrave;i hơn. Cũng như mọi năm, Apple kh&ocirc;ng tiết lộ ch&iacute;nh x&aacute;c dung lượng pin cụ thể tr&ecirc;n thiết bị của m&igrave;nh. Tuy hi&ecirc;n, theo h&atilde;ng c&ocirc;ng bố th&igrave;&nbsp;thời lượng sử dụng pin tr&ecirc;n iPhone 13 sẽ được gia tăng đ&aacute;ng kể l&ecirc;n khoảng 2,5 tiếng so với thế hệ trước đ&oacute;.</p>\r\n<p>&nbsp;</p>\r\n<h3><strong>Dung lượng bộ nhớ được mở rộng</strong></h3>\r\n<p>iPhone 12 sở hữu bộ nhớ ti&ecirc;u chuẩn 64GB v&agrave; cao cấp nhất l&agrave; 512GB. Nhưng sang iPhone 13 lại kh&aacute;c, iPhone 13 phi&ecirc;n bản cao cấp c&oacute; thể sẽ loại bỏ phi&ecirc;n bản 64GB thay v&agrave;o đ&oacute; bản dung lượng bộ nhớ ti&ecirc;u chuẩn l&agrave; 128GB c&ugrave;ng t&ugrave;y chọn dung lượng lớn nhất l&ecirc;n đến 512B.&nbsp;&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Về dung lượng RAM, chưa c&oacute; th&ocirc;ng tin chi tiết. Tuy nhi&ecirc;n, dự đoạn sẽ được trang bị bộ nhớ RAM từ 4-6GB. Với dung lượng n&agrave;y, người d&ugrave;ng c&oacute; thể thoải m&aacute;i đa nhiệm trong sử dụng h&agrave;ng ng&agrave;y.</p>\r\n<h3><strong>C&aacute;ch t&iacute;nh năng kh&aacute;c: thẻ sim, wifi, siri</strong></h3>\r\n<p>Ngo&agrave;i những điểm tr&ecirc;n, iPhone 13 cũng vẫn được trang bị 2 sim (1 sim vật l&yacute; v&agrave; 1 esim), tiếp tục hỗ trợ 5G như tr&ecirc;n iPhone 12. C&aacute;c kết nối kh&ocirc;ng d&acirc;y kh&aacute;c như wifi, bluetooth cũng được trang bị những c&ocirc;ng nghệ mới. Hey Siri cũng l&agrave; một t&iacute;nh năng y&ecirc;u th&iacute;ch của người d&ugrave;ng iPhone.</p>\r\n<p>M&aacute;y vẫn được trang bị c&ocirc;ng nghệ mở kh&oacute;a v&agrave; bảo mật&nbsp;Face ID - nhận đạng khu&ocirc;n mặt với tốc độ nhanh hơn. B&ecirc;n cạnh đ&oacute; l&agrave; chuẩn kh&aacute;ng nước v&agrave; bụi bẩn IP68 theo chuẩn&nbsp;IEC 60529.</p>\r\n<h2><strong>Điện thoại iPhone 13 gi&aacute; bao nhi&ecirc;u? Ra mắt khi n&agrave;o?</strong></h2>\r\n<p>Điện thoại iPhone 13 đ&atilde; được ch&iacute;nh thức giới thiệu đến người ti&ecirc;u d&ugrave;ng tại sự kiện \"California Streaming\" c&ugrave;ng một loạt c&aacute;c sản phẩm Apple kh&aacute;c như&nbsp;iPad mini 6,&nbsp;Apple Watch Series 7 v&agrave;o ng&agrave;y 14/9 vừa qua.&nbsp;&nbsp;</p>\r\n<p>Sản phẩm dự kiến l&ecirc;n kệ với mức gi&aacute; khoảng gần 25 triệu đồng ở phi&ecirc;n bản ti&ecirc;u chuẩn v&agrave; hơn 30 triệu đồng - gần 31 triệu cho phi&ecirc;n bản cấu h&igrave;nh cao cấp nhất. Mức gi&aacute; n&agrave;y kh&ocirc;ng c&oacute; sự ch&ecirc;nh lệnh qu&aacute; lớn so với iPhone 12 trước đ&oacute;. M&aacute;y sẽ sớm được l&ecirc;n kệ c&aacute;c thệ thống b&aacute;n lẻ trong thời gian sắp tới.</p>\r\n<p>Sắp tới đ&acirc;y trong năm 2022, Apple sẽ tung ra thị trường phi&ecirc;n bản kế nhiệm&nbsp;<strong>iPhone 14</strong>&nbsp;hứa hẹn sẽ c&oacute; nhiều n&acirc;ng cấp về hiệu năng, camera v&agrave; thời lượng pin. Ch&uacute;ng ta h&atilde;y c&ugrave;ng chờ xem nh&eacute;!</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>OLED</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>2532 x 1170 pixels</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.1 inches</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng m&agrave;n h&igrave;nh</td>\r\n<td>M&agrave;n h&igrave;nh super Retina XDR, OLED, 460 ppi, HDR display, c&ocirc;ng nghệ True Tone Wide color (P3), Haptic Touch, Lớp phủ oleophobic chống b&aacute;m v&acirc;n tay</td>\r\n</tr>\r\n<tr>\r\n<td>Tần số qu&eacute;t</td>\r\n<td>60Hz</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Camera g&oacute;c rộng: 12MP, f/1.6<br />Camera g&oacute;c si&ecirc;u rộng: 12MP, &fnof;/2.4</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K 2160p@30fps<br />FullHD 1080p@30fps<br />FullHD 1080p@60fps<br />HD 720p@30fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Chạm lấy n&eacute;t<br />HDR<br />Nhận diện khu&ocirc;n mặt<br />Quay chậm (Slow Motion)<br />To&agrave;n cảnh (Panorama)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng<br />Nh&atilde;n d&aacute;n (AR Stickers)<br />Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>12MP, f/2.2</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>iOS 15</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Apple A15</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>4GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>128GB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>1 Nano Sim</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Wi‑Fi 6 (802.11ax)</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>GPS, GLONASS, Galileo, QZSS, and BeiDou</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Lightning</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>Lightning</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>3.240mAh</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Face ID</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Hỗ trợ 5G, Sạc kh&ocirc;ng d&acirc;y, Nhận diện khu&ocirc;n mặt, Kh&aacute;ng nước, kh&aacute;ng bụi</td>\r\n</tr>\r\n<tr>\r\n<td>Kh&aacute;ng nước, bụi</td>\r\n<td>IP67</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />MP4<br />WMV</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 100, 21000000, NULL, 'Điện thoại', 'Apple', NULL, 13, '2023-05-25 06:13:08', '2023-08-22 04:55:02'),
(14, 'Apple Watch SE 40mm (GPS) Viền Nhôm - Dây Cao Su', '<div class=\"p-2 box_shadow rounded-10 modal-open pl-lg-3 pr-lg-3 mb-3\">\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<h2>Apple Watch SE 40mm - Sang trọng, đẳng cấp như bản cao cấp</h2>\r\n<p>Năm 2020, chắc hẳn c&aacute;c iFan đang h&aacute;o hức đ&oacute;n chờ c&aacute;c si&ecirc;u phẩm được ra mắt từ Apple. Đặc biệt Apple Watch SE 40mm&nbsp; GPS) l&agrave; một trong những phi&ecirc;n bản được Apple ra mắt v&agrave;o năm 2020 v&agrave; đang được nhiều người d&ugrave;ng quan t&acirc;m kh&ocirc;ng k&eacute;m g&igrave; phi&ecirc;n bản ch&iacute;nh thức cao cấp.</p>\r\n<h3>Thiết kế thời trang, m&agrave;n h&igrave;nh Retina LTPO OLED hiển thị chất lượng cao</h3>\r\n<p>Apple Watch SE 40mm (GPS) c&oacute; thiết kế vừa năng động v&agrave; mang đậm t&iacute;nh thời trang rất giống với thế hệ trước đ&acirc;y m&agrave; nh&agrave; sản xuất Apple đ&atilde; thiết kế.</p>\r\n<p>Hơn thế, d&acirc;y đeo được l&agrave;m từ chất liệu silicon c&oacute; độ đ&agrave;n hồi cao gi&uacute;p người d&ugrave;ng c&oacute; thể đeo trong thời gian d&agrave;i m&agrave; kh&ocirc;ng bị đau tay. Với chất liệu n&agrave;y người d&ugrave;ng dễ d&agrave;ng vệ sinh v&agrave; hạn chế b&aacute;m bẩn v&agrave; mồ h&ocirc;i.</p>\r\n<p>Apple Watch SE 40mm (GPS) c&oacute; thiết kế m&agrave;n h&igrave;nh Retina LTPO OLED rộng gần giống tương tự Apple Watch Series 6 l&agrave; 40mm x 34mm x 10mm.</p>\r\n<p>Với m&agrave;n h&igrave;nh k&iacute;ch thước rộng c&ugrave;ng với độ ph&acirc;n giải cao 448 x 368 pixels hỗ trợ chất lượng hiển thị h&igrave;nh ảnh tr&ecirc;n m&agrave;n h&igrave;nh cao v&agrave; sắc n&eacute;t, mang đến h&igrave;nh ảnh c&oacute; m&agrave;u sắc ch&acirc;n thật v&agrave; tự nhi&ecirc;n.</p>\r\n<h3><strong>Bộ xử l&yacute; S5 SiP mạnh mẽ, chống nước 5 ATM (50m)</strong></h3>\r\n<p>Apple Watch SE&nbsp;40mm (GPS) được h&atilde;ng trang bị bộ xử l&yacute; SiP l&otilde;i k&eacute;p S5 mạnh mẽ cho hiệu suất xử l&yacute; dữ liệu một c&aacute;ch nhanh ch&oacute;ng. Đi k&egrave;m với đ&oacute; l&agrave; bộ nhớ ram 1GB v&agrave; 32GB bộ nhớ trong lưu trữ được nhiều hơn.</p>\r\n<p>Ngo&agrave;i ra chiếc đồng hồ n&agrave;y c&ograve;n được trang bị t&iacute;nh năng đo tiếng ồn v&agrave; ph&aacute;t hiện t&eacute; ng&atilde;, tự động b&aacute;o khẩn cấp nếu người d&ugrave;ng bị t&eacute; ng&atilde; v&agrave; kh&ocirc;ng cử động trong một thời gian nhất định.</p>\r\n<p>Đặc biệt, Apple Watch SE 40mm (GPS) c&ograve;n được t&iacute;ch hợp c&ocirc;ng nghệ chống nước 5 ATM gi&uacute;p thiết bị c&oacute; thể hoạt động b&igrave;nh thường dưới mặt nước 50m m&agrave; kh&ocirc;ng c&oacute; bất kỳ ảnh hưởng g&igrave; hay đi dưới mưa an to&agrave;n.</p>\r\n<h3><strong>Hỗ trợ Bluetooth 5.0, n&acirc;ng cấp nhiều cảm biến quan trọng</strong></h3>\r\n<p>Apple Watch SE 40mm (GPS) được Apple hỗ trợ kết nối hiện đại đ&oacute; l&agrave; Bluetooth 5.0. Gi&uacute;p thiết bị c&oacute; thể kết nối trong khoảng c&aacute;ch l&ecirc;n đến 10m.</p>\r\n<p>C&oacute; thể n&oacute;i Apple Watch SE 40mm l&agrave; smartwatch rất đ&aacute;ng để người d&ugrave;ng sở hữu. So với c&aacute;c thế hệ trước th&igrave; Apple Watch SE 40mm (GPS) n&agrave;y được n&acirc;ng cấp độ cảm biến rất nhạy.</p>\r\n<p>Hơn thế, tr&ecirc;n smartwatch bạn c&ograve;n c&oacute; thể t&igrave;m thấy rất nhiều chế độ tập luyện như chạy, đi bộ, yoga, đạp xe, luyện tập với cường độ cao ngắt qu&atilde;ng v&agrave; khi&ecirc;u vũ hỗ trợ cho người d&ugrave;ng rất nhiều trong tập luyện.</p>\r\n<p>Ngo&agrave;i ra, Apple Watch SE 40mm (GPS) c&ograve;n được trang bị những t&iacute;nh năng hữu &iacute;ch như độ cảm biến đo nhịp tim với thời gian nhanh v&agrave; độ ch&iacute;nh x&aacute;c hơn so với c&aacute;c thế hệ trước ph&ugrave; hợp vận động, leo n&uacute;i,...</p>\r\n</div>\r\n<div class=\"view_mores text-center mb-2\"><a class=\"two pt-2 pb-2 pl-4 pr-4 modal-open position-relative btn rounded-10 box_shadow font-weight-bold\" title=\"Thu gọn\">Thu gọn&nbsp;<img class=\"m_less\" src=\"https://bizweb.dktcdn.net/thumb/pico/100/459/533/themes/868331/assets/sortdown.png?1685190419017\" alt=\"Thu gọn\" /></a></div>\r\n</div>\r\n</div>\r\n<div class=\"m_product p-2 box_shadow rounded-10 modal-open pl-lg-3 pr-lg-3\">&nbsp;</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>LTPO OLED display (1000 nits)</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>448 x 368 pixels</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>1.78 inches</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kĩ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Pin</td>\r\n<td>L&ecirc;n đến 14 ng&agrave;y</td>\r\n</tr>\r\n<tr>\r\n<td>Thời gian sạc</td>\r\n<td>2 giờ</td>\r\n</tr>\r\n<tr>\r\n<td>Cổng sạc</td>\r\n<td>Kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Chất liệu mặt &amp; D&acirc;y</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Chất liệu viền</td>\r\n<td>Nh&ocirc;m</td>\r\n</tr>\r\n<tr>\r\n<td>Chất liệu d&acirc;y (lọc)</td>\r\n<td>Cao su</td>\r\n</tr>\r\n<tr>\r\n<td>Độ d&agrave;i d&acirc;y</td>\r\n<td>140 - 210 mm</td>\r\n</tr>\r\n<tr>\r\n<td>C&oacute; thể thay d&acirc;y</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>32 GB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>5.0, A2DP, LE</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>T&iacute;nh năng nổi bật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng kh&aacute;c</td>\r\n<td>Theo d&otilde;i giấc ngủ, Đo nhịp tim, T&iacute;nh lượng Calories ti&ecirc;u thụ, Ph&aacute;t hiện t&eacute; ng&atilde;, Đếm số bước ch&acirc;n, Chế độ luyện tập &hellip;</td>\r\n</tr>\r\n<tr>\r\n<td>H&atilde;ng sản xuất</td>\r\n<td>Apple Ch&iacute;nh h&atilde;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Chống nước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Chống nước</td>\r\n<td>C&oacute;, độ s&acirc;u dưới 50m</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 82, 800000, 3, 'Đồng hồ', 'Apple', NULL, 13, '2023-06-02 09:40:46', '2023-08-23 19:17:54'),
(15, 'Samsung Galaxy A73 (5G) 256GB', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<p>Samsung Galaxy A73 5G 128GB được xem l&agrave; sản phẩm nổi bật nhất d&ograve;ng Galaxy A 2022 mới ra mắt, m&aacute;y trang bị bộ th&ocirc;ng số kỹ thuật ấn tượng về phần hiệu năng, chất lượng m&agrave;n h&igrave;nh v&agrave; nổi bật nhất trong số đ&oacute; l&agrave; camera khi n&oacute; đem lại bức ảnh c&oacute; độ ph&acirc;n giải l&ecirc;n đến 108 MP.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>Super AMOLED Plus</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Full HD+</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.7inch - 120Hz</td>\r\n</tr>\r\n<tr>\r\n<td>Độ s&aacute;ng tối đa</td>\r\n<td>800 nits</td>\r\n</tr>\r\n<tr>\r\n<td>Mặt k&iacute;nh cảm ứng</td>\r\n<td>Gorilla Glass 5</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 5 MP, 5 MP</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K 2160p@30fps<br />FullHD 1080p@30fps<br />FullHD 1080p@60fps<br />HD 720p@240fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Ban đ&ecirc;m (Night Mode)<br />Bộ lọc m&agrave;u<br />Chuy&ecirc;n nghiệp (Pro)<br />Chạm lấy n&eacute;t<br />Chống rung quang học (OIS)<br />G&oacute;c rộng (Wide)<br />G&oacute;c si&ecirc;u rộng (Ultrawide)<br />HDR<br />L&agrave;m đẹp<br />Lấy n&eacute;t theo pha (PDAF)<br />Nhận diện khu&ocirc;n mặt<br />Quay chậm (Slow Motion)<br />Quay Si&ecirc;u chậm (Super Slow Motion)<br />Si&ecirc;u cận (Macro)<br />To&agrave;n cảnh (Panorama)<br />Tr&ocirc;i nhanh thời gian (Time Lapse)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng<br />Zoom kỹ thuật số</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>32MP</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />Chụp đ&ecirc;m<br />G&oacute;c rộng (Wide)<br />HDR<br />Live Photo<br />L&agrave;m đẹp<br />Nhận diện khu&ocirc;n mặt<br />Quay video Full HD<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 12</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Snapdragon 778G 5G 8 nh&acirc;n</td>\r\n</tr>\r\n<tr>\r\n<td>Tốc độ CPU</td>\r\n<td>4 nh&acirc;n 2.4 GHz &amp; 4 nh&acirc;n 1.8 GHz</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Adreno 642L</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>8GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>256GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ khả dụng</td>\r\n<td>~100GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 Nano SIM (SIM 2 chung khe thẻ nhớ)</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Dual-band (2.4 GHz/5 GHz)<br />Wi-Fi 802.11 a/b/g/n/ac/ax<br />Wi-Fi Direct<br />Wi-Fi hotspot</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>A2DP<br />LE<br />v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>5000 mAh</td>\r\n</tr>\r\n<tr>\r\n<td>Loại pin</td>\r\n<td>Li-po</td>\r\n</tr>\r\n<tr>\r\n<td>Hỗ trợ sạc tối đa</td>\r\n<td>25W</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc pin nhanh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Mở kho&aacute; v&acirc;n tay dưới m&agrave;n h&igrave;nh</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>\r\n<p>Chạm 2 lần tắt/s&aacute;ng m&agrave;n h&igrave;nh</p>\r\n<p>Chế độ trẻ em (Samsung Kids)<br />Chế độ đơn giản (Giao diện đơn giản)<br />Kh&ocirc;ng gian thứ hai (Thư mục bảo mật)<br />Mở rộng bộ nhớ RAM<br />Samsung Pay<br />Smart Switch (ứng dụng chuyển đổi dữ liệu)<br />Trợ l&yacute; ảo Samsung Bixby<br />Tối ưu game (Game Booster)<br />&Acirc;m thanh Dolby Atmos<br />Đa cửa sổ (chia đ&ocirc;i m&agrave;n h&igrave;nh)<br />Ứng dụng k&eacute;p (Dual Messenger)</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>Kh&aacute;ng nước, bụi</td>\r\n<td>IP67</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />MP4<br />WMV</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 31, 10000000, 1, 'Điện thoại', 'Samsung', NULL, 13, '2023-06-05 08:12:14', '2023-08-23 00:19:46'),
(17, 'Đồng hồ thông minh trẻ em Myalo KidsPhone K84', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<h2><strong>Myalo KidsPhone K84 - Đồng hồ chứa đựng đ&acirc;̀y đủ ti&ecirc;̣n ích c&acirc;̀n thi&ecirc;́t cho bé</strong></h2>\r\n<p>Các b&acirc;̣c phụ huynh đang tìm ki&ecirc;́m món phụ ki&ecirc;̣n cho con em mình hãy tham khảo ngay&nbsp;<strong>đ&ocirc;̀ng h&ocirc;̀ trẻ em myAlo KidsPhone K84</strong>. Đ&acirc;y là chi&ecirc;́c đ&ocirc;̀ng h&ocirc;̀ kh&ocirc;ng chỉ xinh xắn b&ecirc;n ngoài, mà còn chứa đựng nhi&ecirc;̀u ti&ecirc;̣n ích hữu dụng cho bé khi c&acirc;̀n thi&ecirc;́t.</p>\r\n<h3><strong>Ki&ecirc;̉u dáng xinh xắn, d&acirc;y đeo &ecirc;m ái, kháng nước chu&acirc;̉n IP67</strong></h3>\r\n<p>Đ&ocirc;̀ng h&ocirc;̀ myAlo KidsPhone K84 mang ki&ecirc;̉u dáng xinh xắn, thi&ecirc;́t k&ecirc;́ năng đ&ocirc;̣ng với màu xanh bi&ecirc;̉n sẽ phù hợp với cả bé trai l&acirc;̃n bé gái.&nbsp;D&acirc;y đeo được làm từ ch&acirc;́t li&ecirc;̣u đàn h&ocirc;̀i, cùng với trọng lượng nhẹ nhàng của đ&ocirc;̀ng h&ocirc;̀ giúp đảm bảo &ecirc;m ái và thoải mái tr&ecirc;n da tay bé khi đeo dài l&acirc;u.</p>\r\n</div>\r\n</div>', '<h4>T&iacute;nh năng nổi bật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>C&oacute; định vị GPS, Hiển thị th&ocirc;ng b&aacute;o điện thoại, T&ugrave;y chỉnh mặt đồng hồ</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng kh&aacute;c</td>\r\n<td>Ph&aacute;t hiện th&aacute;o đồng hồ ra khỏi tay<br />Thiết lập lịch sư h&agrave;nh tr&igrave;nh<br />Thiết lập v&ugrave;ng an to&agrave;n<br />Li&ecirc;n lạc khẩn cấp SOS</td>\r\n</tr>\r\n<tr>\r\n<td>H&atilde;ng sản xuất</td>\r\n<td>Myalo</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Chống nước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Chống nước</td>\r\n<td>IP67</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 50, 1000000, NULL, 'Đồng hồ', 'Samsung', NULL, 10, '2023-06-26 08:12:30', '2023-08-13 08:11:11'),
(18, 'Samsung Galaxy A03 (3GB - 32GB)', '<p>Nhằm mang trải nghiệm tốt hơn tr&ecirc;n d&ograve;ng sản phẩm gi&aacute; rẻ, Samsung cho ra mắt Galaxy A03 4G với một hiệu năng ổn định, camera chụp ảnh sắc n&eacute;t v&agrave; vi&ecirc;n pin khủng đ&aacute;p ứng nhu cầu sử dụng cả ng&agrave;y cho bạn c&ugrave;ng một mức gi&aacute; trang bị cực kỳ phải chăng.</p>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>PLS TFT LCD</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Full HD+ (1080 x 2408 Pixels)</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.6inch - 60Hz</td>\r\n</tr>\r\n<tr>\r\n<td>Độ s&aacute;ng tối đa</td>\r\n<td>600 nits</td>\r\n</tr>\r\n<tr>\r\n<td>Mặt k&iacute;nh cảm ứng</td>\r\n<td>Gorilla Glass 5</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Ch&iacute;nh 50 MP &amp; Phụ 5 MP, 2 MP, 2 MP</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>FullHD 1080p@30fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />G&oacute;c rộng (Wide)<br />G&oacute;c si&ecirc;u rộng (Ultrawide)<br />HDR<br />L&agrave;m đẹp<br />Lấy n&eacute;t theo pha (PDAF)<br />Si&ecirc;u cận (Macro)<br />To&agrave;n cảnh (Panorama)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>8MP</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />Hiệu ứng Bokeh<br />L&agrave;m đẹp A.I<br />Quay video Full HD<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Hệ điều h&agrave;nh</p>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 12</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Exynos 850 8 nh&acirc;n</td>\r\n</tr>\r\n<tr>\r\n<td>Tốc độ CPU</td>\r\n<td>2.0 GHz</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Mali-G52</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Bộ nhớ, lưu trữ</p>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>4GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>128GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ khả dụng</td>\r\n<td>~105GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 4G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 Nano SIM</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Dual-band (2.4 GHz/5 GHz)<br />Wi-Fi 802.11 a/b/g/n/ac<br />Wi-Fi Direct</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>3.5mm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>5000 mAh</td>\r\n</tr>\r\n<tr>\r\n<td>Loại pin</td>\r\n<td>Li-po</td>\r\n</tr>\r\n<tr>\r\n<td>Hỗ trợ sạc tối đa</td>\r\n<td>15W</td>\r\n</tr>\r\n<tr>\r\n<td>Sạc k&egrave;m theo m&aacute;y</td>\r\n<td>15W</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc pin nhanh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Mở kho&aacute; khu&ocirc;n mặt Mở kho&aacute; v&acirc;n tay cạnh viền</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>&Acirc;m thanh Dolby Atmos</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />FLV<br />MKV<br />MP4</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG<br />WAV</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 25, 12000000, 5, 'Điện thoại', 'Samsung', NULL, 10, '2023-08-12 22:53:03', '2023-08-13 09:16:15'),
(19, 'Samsung Galaxy A23', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<p><strong>Điện thoại Samsung Galaxy A23</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>Super AMOLED Plus</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Full HD+</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.7inch - 120Hz</td>\r\n</tr>\r\n<tr>\r\n<td>Độ s&aacute;ng tối đa</td>\r\n<td>800 nits</td>\r\n</tr>\r\n<tr>\r\n<td>Mặt k&iacute;nh cảm ứng</td>\r\n<td>Gorilla Glass 5</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 5 MP, 5 MP</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K 2160p@30fps<br />FullHD 1080p@30fps<br />FullHD 1080p@60fps<br />HD 720p@240fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Ban đ&ecirc;m (Night Mode)<br />Bộ lọc m&agrave;u<br />Chuy&ecirc;n nghiệp (Pro)<br />Chạm lấy n&eacute;t<br />Chống rung quang học (OIS)<br />G&oacute;c rộng (Wide)<br />G&oacute;c si&ecirc;u rộng (Ultrawide)<br />HDR<br />L&agrave;m đẹp<br />Lấy n&eacute;t theo pha (PDAF)<br />Nhận diện khu&ocirc;n mặt<br />Quay chậm (Slow Motion)<br />Quay Si&ecirc;u chậm (Super Slow Motion)<br />Si&ecirc;u cận (Macro)<br />To&agrave;n cảnh (Panorama)<br />Tr&ocirc;i nhanh thời gian (Time Lapse)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng<br />Zoom kỹ thuật số</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>32MP</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />Chụp đ&ecirc;m<br />G&oacute;c rộng (Wide)<br />HDR<br />Live Photo<br />L&agrave;m đẹp<br />Nhận diện khu&ocirc;n mặt<br />Quay video Full HD<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 12</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Snapdragon 778G 5G 8 nh&acirc;n</td>\r\n</tr>\r\n<tr>\r\n<td>Tốc độ CPU</td>\r\n<td>4 nh&acirc;n 2.4 GHz &amp; 4 nh&acirc;n 1.8 GHz</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Adreno 642L</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>8GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>256GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ khả dụng</td>\r\n<td>~100GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 Nano SIM (SIM 2 chung khe thẻ nhớ)</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Dual-band (2.4 GHz/5 GHz)<br />Wi-Fi 802.11 a/b/g/n/ac/ax<br />Wi-Fi Direct<br />Wi-Fi hotspot</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>A2DP<br />LE<br />v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>5000 mAh</td>\r\n</tr>\r\n<tr>\r\n<td>Loại pin</td>\r\n<td>Li-po</td>\r\n</tr>\r\n<tr>\r\n<td>Hỗ trợ sạc tối đa</td>\r\n<td>25W</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc pin nhanh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Mở kho&aacute; v&acirc;n tay dưới m&agrave;n h&igrave;nh</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>\r\n<p>Chạm 2 lần tắt/s&aacute;ng m&agrave;n h&igrave;nh</p>\r\n<p>Chế độ trẻ em (Samsung Kids)<br />Chế độ đơn giản (Giao diện đơn giản)<br />Kh&ocirc;ng gian thứ hai (Thư mục bảo mật)<br />Mở rộng bộ nhớ RAM<br />Samsung Pay<br />Smart Switch (ứng dụng chuyển đổi dữ liệu)<br />Trợ l&yacute; ảo Samsung Bixby<br />Tối ưu game (Game Booster)<br />&Acirc;m thanh Dolby Atmos<br />Đa cửa sổ (chia đ&ocirc;i m&agrave;n h&igrave;nh)<br />Ứng dụng k&eacute;p (Dual Messenger)</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>Kh&aacute;ng nước, bụi</td>\r\n<td>IP67</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />MP4<br />WMV</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 22, 33000000, NULL, 'Điện thoại', 'samsung', NULL, 10, '2023-08-12 22:56:28', '2023-08-12 22:56:39'),
(20, 'Samsung Galaxy S22 Ultra (12GB - 512GB)', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Vi xử l&yacute; mạnh mẽ nhất Galaxy - Snapdragon 8 Gen 1 (4 nm)</li>\r\n<li>Camera mắt thần b&oacute;ng đ&ecirc;m Nightography - Chụp đ&ecirc;m cực đỉnh</li>\r\n<li>S Pen đầu ti&ecirc;n tr&ecirc;n Galaxy S - Độ trễ thấp, dễ thao t&aacute;c</li>\r\n<li>Dung lượng pin bất chấp ng&agrave;y đ&ecirc;m - Vi&ecirc;n pin 5000mAh, sạc nhanh 45W</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Điện thoại&nbsp;Samsung Galaxy S22 Ultra&nbsp;phi&ecirc;n bản 12GB/512GB được trang bị m&agrave;n h&igrave;nh 6.8 inch bo cong nhẹ nh&agrave;ng gi&uacute;p tăng th&ecirc;m phần thẩm mỹ m&agrave; kh&ocirc;ng dẫn đến t&igrave;nh trạng cấn m&agrave;n h&igrave;nh. B&ecirc;n cạnh đ&oacute; th&igrave; trải nghiệm về mặt h&igrave;nh ảnh hiển thị tr&ecirc;n S22 Ultra thật sự tuyệt với với độ ph&acirc;n giải đến 2K c&ugrave;ng tấm nền Dynamic AMOLED 2X, vuốt chạm v&ocirc; c&ugrave;ng mượt m&agrave; nhờ tần số qu&eacute;t 120 Hz.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>Dynamic AMOLED 2X</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>1440 x 3088 pixels (QHD+)</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.8 inches</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng m&agrave;n h&igrave;nh</td>\r\n<td>Tần số qu&eacute;t 120Hz<br />C&ocirc;ng nghệ HDR10+</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>108 MP, f/1.8 g&oacute;c rộng<br />10 MP, f/4.9<br />10 MP, f/2.4<br />12 MP, f/2.2 g&oacute;c si&ecirc;u rộng</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>8K@24fps, 4K@30/60fps, 1080p@30/60/240fps, 720p@960fps, HDR10+</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>G&oacute;c rộng<br />G&oacute;c si&ecirc;u rộng<br />HDR<br />Lấy n&eacute;t theo pha (PDAF)<br />Si&ecirc;u cận<br />To&agrave;n cảnh<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>40 MP, f/2.2</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K@30/60fps, 1080p@30fps</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 12, One UI 4.1</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Octa-core (1x3.00 GHz Cortex-X2 &amp; 3x2.50 GHz Cortex-A710 &amp; 4x1.80 GHz Cortex-A510)</td>\r\n</tr>\r\n<tr>\r\n<td>Chipset</td>\r\n<td>Qualcomm Snapdragon 8 Gen 1 (4 nm)</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Adreno 730</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>12GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>512GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 Nano SIM hoặc 1 Nano + 1 eSIM</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>5.2, A2DP, LE</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe 3.5</td>\r\n<td>Ko</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>Li-Ion 5000 mAh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" style=\"width: 100.092%; height: 179.2px;\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr style=\"height: 44.8px;\">\r\n<td style=\"width: 33.2975%; height: 44.8px;\">Bảo mật n&acirc;ng cao</td>\r\n<td style=\"width: 66.6158%; height: 44.8px;\">Cảm biến v&acirc;n tay trong m&agrave;n h&igrave;nh</td>\r\n</tr>\r\n<tr style=\"height: 67.2px;\">\r\n<td style=\"width: 33.2975%; height: 67.2px;\">T&iacute;nh năng đặc biệt</td>\r\n<td style=\"width: 66.6158%; height: 67.2px;\">Hỗ trợ 5G, Sạc kh&ocirc;ng d&acirc;y, Kh&aacute;ng nước, kh&aacute;ng bụi</td>\r\n</tr>\r\n<tr style=\"height: 67.2px;\">\r\n<td style=\"width: 33.2975%; height: 67.2px;\">C&aacute;c loại cảm biến</td>\r\n<td style=\"width: 66.6158%; height: 67.2px;\">Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 45, 13000000, NULL, 'Điện thoại', 'Samsung', NULL, 10, '2023-08-12 22:58:37', '2023-08-23 10:13:35');
INSERT INTO `products` (`id`, `name`, `description`, `specifications`, `salient_features`, `count`, `price`, `sold`, `type`, `supplier`, `star`, `user_id`, `created_at`, `updated_at`) VALUES
(21, 'Samsung Galaxy A13 (4G)', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<p>Nhằm mang trải nghiệm tốt hơn tr&ecirc;n d&ograve;ng sản phẩm gi&aacute; rẻ, Samsung cho ra mắt Galaxy A13 4G với một hiệu năng ổn định, camera chụp ảnh sắc n&eacute;t v&agrave; vi&ecirc;n pin khủng đ&aacute;p ứng nhu cầu sử dụng cả ng&agrave;y cho bạn c&ugrave;ng một mức gi&aacute; trang bị cực kỳ phải chăng.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>PLS TFT LCD</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Full HD+ (1080 x 2408 Pixels)</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.6inch - 60Hz</td>\r\n</tr>\r\n<tr>\r\n<td>Độ s&aacute;ng tối đa</td>\r\n<td>600 nits</td>\r\n</tr>\r\n<tr>\r\n<td>Mặt k&iacute;nh cảm ứng</td>\r\n<td>Gorilla Glass 5</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Ch&iacute;nh 50 MP &amp; Phụ 5 MP, 2 MP, 2 MP</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>FullHD 1080p@30fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />G&oacute;c rộng (Wide)<br />G&oacute;c si&ecirc;u rộng (Ultrawide)<br />HDR<br />L&agrave;m đẹp<br />Lấy n&eacute;t theo pha (PDAF)<br />Si&ecirc;u cận (Macro)<br />To&agrave;n cảnh (Panorama)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>8MP</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Bộ lọc m&agrave;u<br />Hiệu ứng Bokeh<br />L&agrave;m đẹp A.I<br />Quay video Full HD<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Hệ điều h&agrave;nh</p>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 12</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Exynos 850 8 nh&acirc;n</td>\r\n</tr>\r\n<tr>\r\n<td>Tốc độ CPU</td>\r\n<td>2.0 GHz</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Mali-G52</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>Bộ nhớ, lưu trữ</p>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>4GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>128GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ khả dụng</td>\r\n<td>~105GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 4G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 Nano SIM</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Dual-band (2.4 GHz/5 GHz)<br />Wi-Fi 802.11 a/b/g/n/ac<br />Wi-Fi Direct</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>3.5mm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>5000 mAh</td>\r\n</tr>\r\n<tr>\r\n<td>Loại pin</td>\r\n<td>Li-po</td>\r\n</tr>\r\n<tr>\r\n<td>Hỗ trợ sạc tối đa</td>\r\n<td>15W</td>\r\n</tr>\r\n<tr>\r\n<td>Sạc k&egrave;m theo m&aacute;y</td>\r\n<td>15W</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc pin nhanh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Mở kho&aacute; khu&ocirc;n mặt Mở kho&aacute; v&acirc;n tay cạnh viền</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>&Acirc;m thanh Dolby Atmos</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />FLV<br />MKV<br />MP4</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG<br />WAV</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 20, 12500000, NULL, 'Điện thoại', 'Samsung', NULL, 10, '2023-08-13 08:26:03', '2023-08-13 08:27:05'),
(22, 'iPhone 13 256GB', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao</li>\r\n<li>Kh&ocirc;ng gian hiển thị sống động - M&agrave;n h&igrave;nh 6.1\" Super Retina XDR độ s&aacute;ng cao, sắc n&eacute;t</li>\r\n<li>Trải nghiệm điện ảnh đỉnh cao - Camera k&eacute;p 12MP, hỗ trợ ổn định h&igrave;nh ảnh quang học</li>\r\n<li>Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 ph&uacute;t</li>\r\n</ul>\r\n<p><strong>iPhone 13&nbsp;256GB</strong>&nbsp;được đ&aacute;nh gi&aacute; l&agrave; d&ograve;ng iPhone mang một thiết kế ấn tượng, gợi l&ecirc;n n&eacute;t đẹp sang trọng, ấn tượng c&ugrave;ng khả năng xử l&yacute; đồ họa vượt trội, trở th&agrave;nh phi&ecirc;n bản cuốn h&uacute;t, tạo điểm nhất độc đ&aacute;o cho người d&ugrave;ng</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>OLED</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>2532 x 1170 pixels</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.1 inches</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng m&agrave;n h&igrave;nh</td>\r\n<td>M&agrave;n h&igrave;nh super Retina XDR, OLED, 460 ppi, HDR display, c&ocirc;ng nghệ True Tone Wide color (P3), Haptic Touch, Lớp phủ oleophobic chống b&aacute;m v&acirc;n tay</td>\r\n</tr>\r\n<tr>\r\n<td>Tần số qu&eacute;t</td>\r\n<td>60Hz</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Camera g&oacute;c rộng: 12MP, f/1.6<br />Camera g&oacute;c si&ecirc;u rộng: 12MP, &fnof;/2.4</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K 2160p@30fps<br />FullHD 1080p@30fps<br />FullHD 1080p@60fps<br />HD 720p@30fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>Chạm lấy n&eacute;t<br />HDR<br />Nhận diện khu&ocirc;n mặt<br />Quay chậm (Slow Motion)<br />To&agrave;n cảnh (Panorama)<br />Tự động lấy n&eacute;t (AF)<br />X&oacute;a ph&ocirc;ng<br />Nh&atilde;n d&aacute;n (AR Stickers)<br />Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>12MP, f/2.2</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>iOS 15</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>Apple A15</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>4GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>256GB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>1 Nano Sim</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Wi‑Fi 6 (802.11ax)</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>GPS, GLONASS, Galileo, QZSS, and BeiDou</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Lightning</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>Lightning</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>3.240mAh</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc kh&ocirc;ng d&acirc;y</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Face ID</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Hỗ trợ 5G, Sạc kh&ocirc;ng d&acirc;y, Nhận diện khu&ocirc;n mặt, Kh&aacute;ng nước, kh&aacute;ng bụi</td>\r\n</tr>\r\n<tr>\r\n<td>Kh&aacute;ng nước, bụi</td>\r\n<td>IP67</td>\r\n</tr>\r\n<tr>\r\n<td>Ghi &acirc;m</td>\r\n<td>Ghi &acirc;m cuộc gọi, ghi &acirc;m mặc định</td>\r\n</tr>\r\n<tr>\r\n<td>Radio</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>Xem phim</td>\r\n<td>3GP<br />AVI<br />MP4<br />WMV</td>\r\n</tr>\r\n<tr>\r\n<td>Nghe nhạc</td>\r\n<td>AAC<br />AMR<br />FLAC<br />Midi<br />MP3<br />OGG</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 60, 33000000, NULL, 'Điện thoại', 'Apple', NULL, 10, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(23, 'Xiaomi Redmi Note 11 Pro Plus 5G', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<h2><strong>Xiaomi Redmi Note 11 Pro Plus &ndash; Cấu h&igrave;nh mạnh mẽ, camera ấn tượng</strong></h2>\r\n<p><strong>Redmi Note 11 Pro Plus</strong>&nbsp;ch&iacute;nh l&agrave; mẫu smartphone tầm trung tiếp theo được Xiaomi cho ra mắt với gi&aacute; hấp dẫn c&ugrave;ng với thiết kế mới tinh tế, cấu h&igrave;nh mạnh mẽ v&agrave; cụm camera chất lượng cao cho trải nghiệm nhiếp ảnh đầy hứa hẹn.</p>\r\n<h3><strong>Thiết kế phẳng, vu&ocirc;ng vắn hơn với cụm camera tinh tế, nhiều m&agrave;u sắc độc đ&aacute;o</strong></h3>\r\n<p>Điện thoại Redmi Note 11&nbsp;Pro+ c&oacute; thiết kế thanh lịch v&agrave; vu&ocirc;ng vắn hơn, mặt trước v&agrave; sau được v&aacute;t phẳng hơn mang đến kiểu d&aacute;ng hiện đại, hợp xu hướng. Bốn g&oacute;c của smartphone vẫn được bo cong để h&agrave;i h&ograve;a với tổng thể, mềm mại cũng như cầm nắm thoải m&aacute;i.</p>\r\n<p>Cụm camera sau được đặt gọn trong khung chữ nhật với camera ch&iacute;nh được l&agrave;m nổi bật thu h&uacute;t từ c&aacute;i nh&igrave;n đầu ti&ecirc;n. B&ecirc;n cạnh đ&oacute; Xiaomi Redmi Note 11 Pro Plus cũng được ra mắt với nhiều m&agrave;u sắc độc đ&aacute;o cho bạn thỏa sức lựa chọn.</p>\r\n<h3><strong>M&agrave;n h&igrave;nh lớn với c&ocirc;ng nghệ m&agrave;n h&igrave;nh AMOLED 120Hz hiển thị sắc n&eacute;t</strong></h3>\r\n<p>Xiaomi Redmi Note 11 Pro+ được trang bị m&agrave;n h&igrave;nh c&oacute; k&iacute;ch thước lớn v&agrave; tấm nền AMOLED Full HD+ cho h&igrave;nh ảnh kh&ocirc;ng chỉ mang độ n&eacute;t cao m&agrave; c&ograve;n c&oacute; m&agrave;u sắc đẹp, sống động, rực rỡ tr&ecirc;n một kh&ocirc;ng gian hiển thị rộng r&atilde;i.</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, Xiaomi đ&atilde; mang đến sự cải tiến khi mang đến cho m&agrave;n h&igrave;nh Xiaomi Redmi Note 11 Pro Plus tần số qu&eacute;t 120Hz ấn tượng, cho trải nghiệm mượt m&agrave;, mọi thao t&aacute;c vuốt chạm phản hồi nhanh hơn, h&igrave;nh ảnh được xử l&yacute; tốc độ cao, tr&aacute;nh t&igrave;nh trạng x&eacute; h&igrave;nh.</p>\r\n<h3><strong>&Acirc;m thanh chất lượng mang lại trải nghiệm giải tr&iacute; đỉnh cao</strong></h3>\r\n<p>Kh&ocirc;ng chỉ mang đến trải nghiệm tốt về phần nh&igrave;n, Xiaomi c&ograve;n mang đến những trải nghiệm ấn tượng về phần nghe để người d&ugrave;ng c&oacute; thể tận hưởng những bộ phim hay, chơi game sống động, ch&acirc;n thật hơn.</p>\r\n<h3><strong>Cấu h&igrave;nh ấn tượng với chip MediaTek Dimensity 920 c&ugrave;ng RAM lớn</strong></h3>\r\n<p>Mặc d&ugrave; chỉ l&agrave; smartphone thuộc ph&acirc;n kh&uacute;c tầm trung nhưng sức mạnh của Xiaomi Redmi Note 11 Pro+ vẫn kh&ocirc;ng hề thua k&eacute;m c&aacute;c d&ograve;ng cao cấp.&nbsp;Với chipset MediaTek Dimensity 920 được cải thiện cho hiệu suất tăng l&ecirc;n khoảng 9%, chơi game mượt m&agrave;, thao t&aacute;c nhanh ch&oacute;ng mọi đa nhiệm m&agrave; kh&ocirc;ng lo giật lag.</p>\r\n<p>Ngo&agrave;i ra Xiaomi Redmi Note 11 Pro Plus c&ograve;n được trang bị RAM c&oacute; dung lượng lớn cho hiệu suất ổn định trong thời gian d&agrave;i. Bộ nhớ trong cũng c&oacute; dung lượng cao, thoải m&aacute;i c&agrave;i đặt ứng dụng, tr&ograve; chơi cũng như lưu trữ h&agrave;ng ngh&igrave;n tập tin.</p>\r\n<h3><strong>Trải nghiệm nhiếp ảnh cực đỉnh với camera ch&iacute;nh 108MP</strong></h3>\r\n<p>Nếu bạn l&agrave; một người y&ecirc;u th&iacute;ch nhiếp ảnh, chắc chắn bạn sẽ kh&ocirc;ng thể bỏ qua Xiaomi Redmi Note 11 Pro+. Smartphone được trang bị bộ 3 camera chất lượng cao với th&ocirc;ng số cảm biến ấn tượng cho ảnh chụp sắc n&eacute;t v&agrave; hỗ trợ quay phim với chất lượng cao.</p>\r\n<p>B&ecirc;n cạnh đ&oacute;, camera Xiaomi Redmi Note 11 Pro Plus cũng hỗ trợ nhiều chế độ chụp ảnh như Panorama, HDR, x&oacute;a ph&ocirc;ng,&hellip;để bạn thỏa đam m&ecirc; nhiếp ảnh.</p>\r\n<h3><strong>Pin khủng t&iacute;ch hợp sạc nhanh USB-C với c&ocirc;ng suất 120W si&ecirc;u tốt</strong></h3>\r\n<p>Để c&oacute; thể vận h&agrave;nh mượt m&agrave; với thời lượng l&acirc;u d&agrave;i th&igrave; một vi&ecirc;n pin dung lượng khủng l&agrave; kh&ocirc;ng thể thiếu tr&ecirc;n Xiaomi Redmi Note 11 Pro+. Vi&ecirc;n pin n&agrave;y c&oacute; thể cho thời lượng sử dụng li&ecirc;n tục l&ecirc;n đến một ng&agrave;y hoặc hơn một ng&agrave;y nếu bạn chỉ sử dụng c&aacute;c t&aacute;c vụ cơ bản.</p>\r\n<p>Ngo&agrave;i ra Xiaomi Redmi Note 11 Pro+ cũng được trang bị t&iacute;nh năng sạc nhanh qua cổng sạc USB Type-C, c&ocirc;ng suất sạc nhanh đến 120W, nạp pin nhanh ch&oacute;ng để bạn kh&ocirc;ng mất qu&aacute; nhiều thời gian sạc pin.</p>\r\n</div>\r\n</div>', '<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>AMOLED</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>1080 x 2400 pixels (FullHD+)</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh rộng</td>\r\n<td>6.67 inches</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng m&agrave;n h&igrave;nh</td>\r\n<td>Tần số qu&eacute;t 120 Hz, Corning Gorilla Glass 5, HDR10, 700 nits, 1200 nits (peak)</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera sau</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Camera g&oacute;c rộng: 108 MP, f/1.9, PDAF<br />Camera g&oacute;c si&ecirc;u rộng: 8 MP<br />Camera macro: 2 MP, f/2.4</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>4K@30fps, 1080p@30/60fps</td>\r\n</tr>\r\n<tr>\r\n<td>Đ&egrave;n flash</td>\r\n<td>C&oacute;</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng</td>\r\n<td>G&oacute;c rộng<br />G&oacute;c si&ecirc;u rộng<br />HDR<br />Lấy n&eacute;t theo pha (PDAF)<br />Si&ecirc;u cận<br />To&agrave;n cảnh<br />X&oacute;a ph&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Camera trước</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>16MP</td>\r\n</tr>\r\n<tr>\r\n<td>Quay phim</td>\r\n<td>1080p@30fps</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Hệ điều h&agrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>OS</td>\r\n<td>Android 11, MIUI 12.5</td>\r\n</tr>\r\n<tr>\r\n<td>CPU</td>\r\n<td>2x2.5 GHz Cortex-A78 &amp; 6x2.0 GHz Cortex-A55</td>\r\n</tr>\r\n<tr>\r\n<td>Chipset</td>\r\n<td>MediaTek Dimensity 920 5G (6 nm)</td>\r\n</tr>\r\n<tr>\r\n<td>GPU</td>\r\n<td>Mali-G68 MC4</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Bộ nhớ, lưu trữ</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>RAM</td>\r\n<td>8GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ trong</td>\r\n<td>256GB</td>\r\n</tr>\r\n<tr>\r\n<td>Bộ nhớ khả dụng</td>\r\n<td>~100GB</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Danh bạ</td>\r\n<td>Kh&ocirc;ng giới hạn</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Mạng di động</td>\r\n<td>Hỗ trợ 5G</td>\r\n</tr>\r\n<tr>\r\n<td>SIM</td>\r\n<td>2 SIM (Nano-SIM)</td>\r\n</tr>\r\n<tr>\r\n<td>Wifi</td>\r\n<td>Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot</td>\r\n</tr>\r\n<tr>\r\n<td>GPS</td>\r\n<td>BEIDOU<br />GLONASS<br />GALILEO<br />GPS<br />QZSS</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>5.2, A2DP, LE</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc</td>\r\n<td>Type-C</td>\r\n</tr>\r\n<tr>\r\n<td>Jack tai nghe</td>\r\n<td>3.5</td>\r\n</tr>\r\n<tr>\r\n<td>Kết nối kh&aacute;c</td>\r\n<td>NFC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Pin, sạc</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng pin</td>\r\n<td>4500 mAh</td>\r\n</tr>\r\n<tr>\r\n<td>Loại pin</td>\r\n<td>Li-po</td>\r\n</tr>\r\n<tr>\r\n<td>Hỗ trợ sạc tối đa</td>\r\n<td>25W</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ pin</td>\r\n<td>Sạc pin nhanh</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Bảo mật n&acirc;ng cao</td>\r\n<td>Cảm biến v&acirc;n tay cạnh b&ecirc;n</td>\r\n</tr>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Hỗ trợ 5G, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n<tr>\r\n<td>C&aacute;c loại cảm biến</td>\r\n<td>Cảm biến gia tốc, Cảm biến tiệm cận, La b&agrave;n, Con quay hồi chuyển</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 45, 8000000, NULL, 'Điện thoại', 'Xiaomi', NULL, 10, '2023-08-13 08:32:25', '2023-08-13 08:32:38'),
(24, 'Macbook Pro 14 M1 Pro 8 CPU - 14 GPU 16GB 512GB 2021', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Chip M1 Pro 10 nh&acirc;n&nbsp; - Xử l&yacute; mượt m&agrave; mọi t&aacute;c vụ</li>\r\n<li>SSD 512GB - Tăng tốc to&agrave;n diện m&aacute;y t&iacute;nh, khởi động m&aacute;y v&agrave; c&aacute;c phần mềm nặng chỉ trong v&agrave;i gi&acirc;y</li>\r\n<li>M&agrave;n h&igrave;nh 16.2 inch Liquid Retina XDR (3456 x 2234) - Chất lượng h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc rực rỡ, sống động</li>\r\n<li>Đa dạng kết nối: 3 x Thunderbolt 4 USB-C, HDMI, Jack 3.5 mm</li>\r\n</ul>\r\n<p>Macbook Pro 14 inch 2021&nbsp;được trang bị cấu h&igrave;nh khủng với chip Apple M1 Pro (10CPU/16GPU) kết hợp với bộ nhớ RAM 16GB v&agrave; SSD 1TB mang lại trải nghiệm tuyệt vời với hiệu suất cực đỉnh.</p>\r\n<p>Sản phẩm h&agrave;ng ch&iacute;nh h&atilde;ng Apple Việt Nam, bảo h&agrave;nh 12 th&aacute;ng, đổi mới 30 ng&agrave;y nếu lỗi, hỗ trợ trả g&oacute;p 0% v&agrave; thu cũ đổi mới.</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>M1 Pro/M1 Max</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>14 nh&acirc;n GPU</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>16GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>512GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13 inches</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>Trọng lượng</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', NULL, 30, 33000000, NULL, 'Laptop', 'Apple', NULL, 10, '2023-08-13 08:45:57', '2023-08-13 09:01:05'),
(25, 'Apple MacBook Pro 13 Touch Bar M1 16GB 256GB 2020', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Xử l&yacute; đồ hoạ mượt m&agrave; - Chip M1 cho ph&eacute;p thao t&aacute;c tr&ecirc;n c&aacute;c phần mềm AI, Photoshop, Render Video, ph&aacute;t trực tiếp ở độ ph&acirc;n giải 4K</li>\r\n<li>Chất lượng hiển thị sắc n&eacute;t - Độ ph&acirc;n giải retina m&agrave;u sắc rực rỡ, tấm nền IPS cho g&oacute;c nh&igrave;n 178 độ</li>\r\n<li>Bảo mật cao - Trang bị cảm biến v&acirc;n tay cho ph&eacute;p mở m&aacute;y chỉ với 1 chạm</li>\r\n<li>Mỏng nhẹ cao cấp - Mỏng chỉ 15.6mm, trọng lượng chỉ 1.4kg đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c mọi nơi</li>\r\n<li>Cảm gi&aacute;c g&otilde; thoải m&aacute;i - B&agrave;n ph&iacute;m magic khắc phục hầu hết c&aacute;c nhược điểm củ thế hệ trước</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Apple MacBook Pro 13 Touch Bar M1 16GB 256GB 2020 được thiết kế như một bước nhảy vọt về hiệu suất hoạt động. Gi&uacute;p cho bạn c&oacute; thể l&agrave;m việc nhanh ch&oacute;ng v&agrave; tiện lợi d&ugrave; đang ở bất kỳ đ&acirc;u. Ngo&agrave;i ra, với thiết kế cao cấp, sang trọng, chiếc&nbsp;Macbook Pro M1 2020&nbsp;n&agrave;y lu&ocirc;n chinh phục tr&aacute;i tim của người d&ugrave;ng.<br />Bạn cũng c&oacute; thể kh&aacute;m ph&aacute; th&ecirc;m d&ograve;ng&nbsp;Apple Macbook Pro 13 Touch Bar i5 2.0 1TB 2020, đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; d&ograve;ng m&aacute;y c&oacute; khả năng hoạt động hiệu quả c&ugrave;ng khả năng hiển thị h&igrave;nh ảnh ấn tượng</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>8 nh&acirc;n với 4 nh&acirc;n hiệu năng cao v&agrave; 4 nh&acirc;n tiết kiệm điện</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>8 nh&acirc;n GPU, 16 nh&acirc;n Neural Engine</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>16GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>256GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13.3 inches</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải m&agrave;n h&igrave;nh</td>\r\n<td>2560 x 1600 pixels (2K)</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Retina</td>\r\n</tr>\r\n<tr>\r\n<td>Chất liệu tấm nền</td>\r\n<td>Tấm nền IPS</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p data-v-4e304e03=\"\">Trọng lượng</p>\r\n</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 32, 21000000, NULL, 'Laptop', 'Apple', NULL, 10, '2023-08-13 08:47:45', '2023-08-13 08:48:03'),
(26, 'Macbook Pro 14 M1 Pro 10 CPU - 16 GPU 32GB 512GB 2021', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Chip M1 Pro 10 nh&acirc;n&nbsp; - Xử l&yacute; mượt m&agrave; mọi t&aacute;c vụ</li>\r\n<li>SSD 512GB - Tăng tốc to&agrave;n diện m&aacute;y t&iacute;nh, khởi động m&aacute;y v&agrave; c&aacute;c phần mềm nặng chỉ trong v&agrave;i gi&acirc;y</li>\r\n<li>M&agrave;n h&igrave;nh 16.2 inch Liquid Retina XDR (3456 x 2234) - Chất lượng h&igrave;nh ảnh sắc n&eacute;t, m&agrave;u sắc rực rỡ, sống động</li>\r\n<li>Đa dạng kết nối: 3 x Thunderbolt 4 USB-C, HDMI, Jack 3.5 mm</li>\r\n</ul>\r\n<p>Macbook Pro 14 inch 2021&nbsp;được trang bị cấu h&igrave;nh khủng với chip Apple M1 Pro (10CPU/16GPU) kết hợp với bộ nhớ RAM 16GB v&agrave; SSD 1TB mang lại trải nghiệm tuyệt vời với hiệu suất cực đỉnh.</p>\r\n<p>Sản phẩm h&agrave;ng ch&iacute;nh h&atilde;ng Apple Việt Nam, bảo h&agrave;nh 12 th&aacute;ng, đổi mới 30 ng&agrave;y nếu lỗi, hỗ trợ trả g&oacute;p 0% v&agrave; thu cũ đổi mới.</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>16 GPU</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>M1 Pro</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>32GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>512GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13 inches</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>Trọng lượng</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', NULL, 41, 45000000, NULL, 'Laptop', 'Apple', NULL, 10, '2023-08-13 08:49:49', '2023-08-13 08:50:06'),
(27, 'Tai nghe không dây Baseus Encok W06', '<ul>\r\n<li>\r\n<div>\r\n<h3>Name: Baseus Encok True Wireless Earphones W06</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Model: Baseus Encok W06</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Material: ABS</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Version: V5.0</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Name of wireless device: Baseus Encok W06</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Communication distance: 10m</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Standby time: 300hours</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Charging time: 1.5 hours&nbsp;/ 2.5hours&nbsp;(Wireless Charger)</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Music time: 4~5&nbsp;hours&nbsp;(70% of the volume)</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Battery capacity: 30mAh/3.7V（earphones）&nbsp;380mAh/3.7V（charging&nbsp;box）</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Earphone&nbsp;rated input: DC5V⎓30mA</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Earphone rated consumption&nbsp;current: 8mA</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Charging box&nbsp;rated input: DC5V⎓380mA</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Charging box&nbsp;rated consumption&nbsp;current: 8mA</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Frequency response range: 20Hz-20KHz</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Charge interface: Type-C</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Suitable for: Compatible with all wireless devices</h3>\r\n</div>\r\n</li>\r\n<li>\r\n<div>\r\n<h3>Accessories: Type-C&nbsp;Charging cable*1, Earbuds&nbsp;*4,&nbsp;User manual*1,&nbsp;Warranty card*1</h3>\r\n</div>\r\n</li>\r\n</ul>', '<p>Đang cập nhật</p>', NULL, 15, 800000, NULL, 'Tai nghe', 'Baseus', NULL, 13, '2023-08-16 09:28:42', '2023-08-16 09:29:07'),
(29, 'Macbook Pro 14 inch 2023', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\"content_coll position-relative rte active\">\r\n<ul>\r\n<li>Hiệu năng vượt trội - C&acirc;n mọi t&aacute;c vụ từ c&ocirc;ng việc, đồ họa cho đến những tựa game nặng</li>\r\n<li>Đa nhiệm mượt m&agrave; - RAM 16 GB giải quyết khối lượng c&ocirc;ng việc &ldquo;nặng đ&ocirc;&rdquo; một c&aacute;ch nhanh ch&oacute;ng v&agrave; ấn tượng</li>\r\n<li>SSD 512 GB - Tăng tốc to&agrave;n diện v&agrave; khởi động trong t&iacute;ch tắt</li>\r\n<li>M&agrave;n h&igrave;nh 14.2 inch Liquid Retina XDR (3024 x 1964) chất lượng hiển thị v&ocirc; c&ugrave;ng sắc n&eacute;t</li>\r\n</ul>\r\n<h2><strong>Macbook Pro 14 inch - Chi&ecirc;́c Macbook đáng mong đợi nh&acirc;́t 2021</strong></h2>\r\n<p>K&ecirc;́ thừa những tinh hoa từ đời MacBook t&ocirc;́t nh&acirc;́t cùng với những n&acirc;ng c&acirc;́p đáng k&ecirc;̉ trong nhi&ecirc;̀u năm qua,&nbsp;<strong>Macbook Pro 14 inch</strong>&nbsp;dự ki&ecirc;́n sẽ là m&acirc;̃u laptop làm cho giới c&ocirc;ng ngh&ecirc;̣ \"phát s&ocirc;́t\", cũng như là c&ocirc;̃ máy xử lý c&ocirc;ng vi&ecirc;̣c t&ocirc;́i ưu hi&ecirc;̣u quả.</p>\r\n<h3><strong>Thi&ecirc;́t k&ecirc;́ lưng máy phẳng t&ocirc;́i giản, màn hình XDR Retina 14 inch rực rỡ</strong></h3>\r\n<p>M&aacute;y sẽ mang ki&ecirc;̉u dáng được Apple tái thi&ecirc;́t k&ecirc;́ lại cho dòng&nbsp;MacBook Pro&nbsp;năm 2021. MacBook Pro 14 inch 2021 sẽ được làm phẳng t&ocirc;́i giản ở các cạnh nhằm tạo vẻ hi&ecirc;̣n đại cho máy.</p>\r\n<p>Đặc bi&ecirc;̣t, m&aacute;y sẽ được trang bị khe cắm thẻ SDXC. Đ&acirc;y chính là đi&ecirc;̉m ưu đ&ocirc;́i với các nhi&ecirc;́p ảnh gia hoặc người dùng kh&ocirc;ng chu&ocirc;̣ng c&ocirc;̉ng USB-C đ&ecirc;̉ sao lưu dữ li&ecirc;̣u.<br /><br />Macbook Pro 14 2021 sẽ có màn hình kích thước 14 inch và sử dụng c&ocirc;ng ngh&ecirc;̣ m&agrave;n h&igrave;nh Liquid Retina XDR ti&ecirc;n ti&ecirc;́n. T&acirc;́m n&ecirc;̀n sẽ cải thi&ecirc;̣n đ&ocirc;̣ sáng và đ&ocirc;̣ bão hòa tr&ecirc;n màn hình m&ocirc;̣t cách đáng k&ecirc;̉, qua đó giúp cho những c&ocirc;ng vi&ecirc;̣c thi&ecirc;́t k&ecirc;́ đ&ocirc;̀ họa hay giải trí trở n&ecirc;n t&ocirc;́t hơn.</p>\r\n<h3><strong>B&ocirc;̣ vi xử lý hi&ecirc;̣u năng mạnh mẽ c&acirc;̀n thi&ecirc;́t cho mọi c&ocirc;ng vi&ecirc;̣c</strong></h3>\r\n<p>Thời gian g&acirc;̀n đ&acirc;y Apple đã tự mình phát tri&ecirc;̉n thành c&ocirc;ng b&ocirc;̣ vi xử lý ri&ecirc;ng, mang t&ecirc;n Apple M1 Pro chip, cho các dòng MacBook của hãng. Và đ&ocirc;́i với MacBook Pro 14 inch 2021, Apple mang đ&ecirc;́n cho dòng máy này con chip Apple M1 Pro Chip - th&ecirc;́ h&ecirc;̣ n&ocirc;́i ti&ecirc;́p của Apple M1 trước đó.</p>\r\n<p>Chip Apple có lõi b&ecirc;n trong và k&ecirc;́t hợp với chip đ&ocirc;̀ họa ri&ecirc;ng bi&ecirc;̣t mạnh g&acirc;́p nhiều l&acirc;̀n trước đó, giúp cho m&aacute;y hoàn toàn phù hợp đ&ecirc;̉ sử dụng ph&acirc;̀n m&ecirc;̀m đ&ocirc;̀ họa nặng, cũng như v&acirc;̣n hành mượt mà những tựa game c&acirc;́u hình cao.<br /><br />M&aacute;y được Apple trang bị c&ocirc;ng ngh&ecirc;̣ hiện đại chứa đựng RAM cùng vị trí như GPU và CPU, do đó mà với dung lượng RAM ổn định, chi&ecirc;́c máy v&acirc;̃n sẽ v&acirc;̣n hành với hi&ecirc;̣u năng t&ocirc;́t nh&acirc;́t.</p>\r\n<p>Ngoài ra, cũng đáng chú ý đó là Mac Pro 2021 14 inch sẽ hoàn toàn tương thích với c&ocirc;ng ngh&ecirc;̣ Wi-Fi 6 mới nh&acirc;́t. Bởi vì các đời MacBook Pro chạy chip M1 trước đó v&ocirc;́n đã có sẵn Wi-Fi 6, n&ecirc;n sẽ kh&ocirc;ng ngạc nhi&ecirc;n khi MacBook Pro 14 2021 cũng được lắp đặt khả năng k&ecirc;́t n&ocirc;́i mới nh&acirc;́t này.</p>\r\n<h3><strong>Thời lượng pin đáp ứng làm vi&ecirc;̣c và giải trí</strong></h3>\r\n<p>Hẳn bạn còn nhớ MacBook Pro chạy chip M1 trước đó có thời lượng sử dụng l&ecirc;n đ&ecirc;́n nhiều giờ. Vì th&ecirc;́ bạn hoàn toàn y&ecirc;n t&acirc;m v&ecirc;̀ thời gian sử dụng, bởi MacBook Pro 2021 14 inch sẽ có vi&ecirc;n pin cung c&acirc;́p cho máy khi hoạt đ&ocirc;̣ng li&ecirc;n tục. K&ecirc;́t hợp cùng với khả năng giảm lượng pin ti&ecirc;u thụ tr&ecirc;n chip, có th&ecirc;̉ khẳng định thời lượng pin tr&ecirc;n MacBook Pro 14 inch 2021 sẽ làm hài lòng t&acirc;́t cả người dùng.<br /><br />Ngoài ra, cũng đáng chú ý rằng &acirc;m thanh tr&ecirc;n Macbook Pro 14 inch cũng được n&acirc;ng c&acirc;́p đáng k&ecirc;̉. &Acirc;m thanh của m&aacute;y được tinh chỉnh nhằm tạo &acirc;m thanh c&acirc;n bằng hơn, bass s&acirc;u hơn, và tích hợp microphone ch&ocirc;́ng &ocirc;̀n giúp cho cu&ocirc;̣c trò chuy&ecirc;̣n video call trở n&ecirc;n su&ocirc;n sẻ &amp; rõ ti&ecirc;́ng.</p>\r\n<h3><strong>Hi&ecirc;̣u năng tản nhi&ecirc;̣t ổn định, tản nhiệt hiệu quả</strong></h3>\r\n<p>Ph&acirc;̀n tản nhi&ecirc;̣t chính với c&acirc;́u trúc quạt b&ecirc;n trong, cũng như bảng mạch chủ tạo kh&ocirc;ng gian thoát nhi&ecirc;̣t hi&ecirc;̣u quả hơn.&nbsp;Nhờ đó, bạn có th&ecirc;̉ y&ecirc;n t&acirc;m sử dụng MacBook Pro 14 inch và giải trí hoặc làm vi&ecirc;̣c đ&ocirc;̀ họa nặng mà kh&ocirc;ng phải lo nóng máy. H&ecirc;̣ th&ocirc;́ng tản nhi&ecirc;̣t sẽ làm cho trải nghi&ecirc;̣m dùng máy của bạn &ocirc;̉n định hơn nhi&ecirc;̀u l&acirc;̀n.</p>\r\n<p>M&ocirc;̣t chi ti&ecirc;́t khác cũng đáng chú ý đó là c&ocirc;̉ng MagSafe. Apple đã quy&ecirc;́t định mang c&ocirc;̉ng MagSafe l&ecirc;n dòng MacBook Pro mới, mà khởi đ&acirc;̀u chính là MacBook Pro 14 inch.&nbsp;</p>\r\n<p>Hơn nữa, với sự ph&ocirc;̉ bi&ecirc;́n của MagSafe đ&ocirc;́i với người dùng iPhone, kh&ocirc;ng ngạc nhi&ecirc;n khi sắp tới Apple sẽ trang bị c&ocirc;̉ng MagSafe cho MacBook Pro 2021 14 inch đ&ecirc;̉ đảm bảo người dùng có th&ecirc;̉ sử dụng cùng loại phụ ki&ecirc;̣n cho nhi&ecirc;̀u thi&ecirc;́t bị.</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>M1 Pro/M1 Max</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>14 nh&acirc;n GPU</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>16GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>512GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>14.2 inches</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải m&agrave;n h&igrave;nh</td>\r\n<td>3024 x 1964 pixels</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>120Hz, Liquid Retina, Mini LED, XDR</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Retina</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p data-v-4e304e03=\"\">Trọng lượng</p>\r\n</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, 53, 4000000, 2, 'Laptop', 'Apple', NULL, 17, '2023-08-22 05:09:28', '2023-08-23 19:17:54'),
(30, 'Apple MacBook Pro 14 Touch Bar M1 16GB 512GB 2023', '<h3 class=\"special-content_title font-weight-bold d-block w-100 pt-2 pb-2 mb-0\">Th&ocirc;ng tin chi tiết</h3>\r\n<div class=\"product-content pt-2 pb-2 mewcontent\">\r\n<div class=\" position-relative rte\">\r\n<ul>\r\n<li>Xử l&yacute; đồ hoạ mượt m&agrave; - Chip M1 cho ph&eacute;p thao t&aacute;c tr&ecirc;n c&aacute;c phần mềm AI, Photoshop, Render Video, ph&aacute;t trực tiếp ở độ ph&acirc;n giải 4K</li>\r\n<li>Chất lượng hiển thị sắc n&eacute;t - Độ ph&acirc;n giải retina m&agrave;u sắc rực rỡ, tấm nền IPS cho g&oacute;c nh&igrave;n 178 độ</li>\r\n<li>Bảo mật cao - Trang bị cảm biến v&acirc;n tay cho ph&eacute;p mở m&aacute;y chỉ với 1 chạm</li>\r\n<li>Mỏng nhẹ cao cấp - Mỏng chỉ 15.6mm, trọng lượng chỉ 1.4kg đồng h&agrave;nh c&ugrave;ng bạn mọi l&uacute;c mọi nơi</li>\r\n<li>Cảm gi&aacute;c g&otilde; thoải m&aacute;i - B&agrave;n ph&iacute;m magic khắc phục hầu hết c&aacute;c nhược điểm củ thế hệ trước</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<p>Apple MacBook Pro 13 Touch Bar M1 16GB 256GB 2020 được thiết kế như một bước nhảy vọt về hiệu suất hoạt động. Gi&uacute;p cho bạn c&oacute; thể l&agrave;m việc nhanh ch&oacute;ng v&agrave; tiện lợi d&ugrave; đang ở bất kỳ đ&acirc;u. Ngo&agrave;i ra, với thiết kế cao cấp, sang trọng, chiếc&nbsp;Macbook Pro M1 2020&nbsp;n&agrave;y lu&ocirc;n chinh phục tr&aacute;i tim của người d&ugrave;ng.<br />Bạn cũng c&oacute; thể kh&aacute;m ph&aacute; th&ecirc;m d&ograve;ng&nbsp;Apple Macbook Pro 13 Touch Bar i5 2.0 1TB 2020, đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; d&ograve;ng m&aacute;y c&oacute; khả năng hoạt động hiệu quả c&ugrave;ng khả năng hiển thị h&igrave;nh ảnh ấn tượng</p>\r\n</div>\r\n</div>', '<h4>Vi xử l&yacute; &amp; đồ họa</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Loại CPU</td>\r\n<td>8 nh&acirc;n với 4 nh&acirc;n hiệu năng cao v&agrave; 4 nh&acirc;n tiết kiệm điện</td>\r\n</tr>\r\n<tr>\r\n<td>Loại card đồ họa</td>\r\n<td>8 nh&acirc;n GPU, 16 nh&acirc;n Neural Engine</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>RAM &amp; Ổ cứng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Dung lượng RAM</td>\r\n<td>16GB</td>\r\n</tr>\r\n<tr>\r\n<td>Ổ cứng</td>\r\n<td>256GB SSD</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>M&agrave;n h&igrave;nh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước m&agrave;n h&igrave;nh</td>\r\n<td>13.3 inches</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải m&agrave;n h&igrave;nh</td>\r\n<td>2560 x 1600 pixels (2K)</td>\r\n</tr>\r\n<tr>\r\n<td>C&ocirc;ng nghệ m&agrave;n h&igrave;nh</td>\r\n<td>13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display</td>\r\n</tr>\r\n<tr>\r\n<td>M&agrave;n h&igrave;nh cảm ứng</td>\r\n<td>Kh&ocirc;ng</td>\r\n</tr>\r\n<tr>\r\n<td>Độ ph&acirc;n giải</td>\r\n<td>Retina</td>\r\n</tr>\r\n<tr>\r\n<td>Chất liệu tấm nền</td>\r\n<td>Tấm nền IPS</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Th&ocirc;ng số kỹ thuật</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Cổng giao tiếp</td>\r\n<td>1x Headphone jack<br />1x MagSafe port<br />1x HDMI<br />1x Thunderbolt 4<br />1x SDXC</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Giao tiếp &amp; kết nối</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>Hệ điều h&agrave;nh</td>\r\n<td>MacOS</td>\r\n</tr>\r\n<tr>\r\n<td>Webcam</td>\r\n<td>1080p Camera, FaceTime</td>\r\n</tr>\r\n<tr>\r\n<td>Wi-Fi</td>\r\n<td>802.11ax Wi-Fi 6</td>\r\n</tr>\r\n<tr>\r\n<td>Thẻ nhớ</td>\r\n<td>MicroSD, hỗ trợ tối đa 1 TB</td>\r\n</tr>\r\n<tr>\r\n<td>Bluetooth</td>\r\n<td>v5.0</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Thiết kế &amp; Trọng lượng</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>K&iacute;ch thước</td>\r\n<td>1.6 kg</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p data-v-4e304e03=\"\">Trọng lượng</p>\r\n</td>\r\n<td>1.55 x 31.26 x 22.12 cm</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>C&ocirc;ng nghệ &acirc;m thanh</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>C&ocirc;ng nghệ &acirc;m thanh</td>\r\n<td>6 loa</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>Tiện &iacute;ch kh&aacute;c</h4>\r\n<table class=\"table table-striped\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">\r\n<tbody>\r\n<tr>\r\n<td>T&iacute;nh năng đặc biệt</td>\r\n<td>Ổ cứng SSD, Viền m&agrave;n h&igrave;nh si&ecirc;u mỏng, Wi-Fi 6, Bảo mật v&acirc;n tay, Nhận diện khu&ocirc;n mặt</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', NULL, 20, 35000000, NULL, 'Laptop', 'Apple', NULL, 17, '2023-08-22 05:13:35', '2023-08-22 05:13:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_cat`
--

CREATE TABLE `product_cat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_cat`
--

INSERT INTO `product_cat` (`id`, `product_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL),
(7, 5, 1, NULL, NULL),
(9, 4, 4, NULL, NULL),
(11, 5, 4, NULL, NULL),
(12, 5, 5, NULL, NULL),
(13, 7, 1, NULL, NULL),
(14, 7, 5, NULL, NULL),
(18, 9, 1, NULL, NULL),
(19, 9, 4, NULL, NULL),
(20, 9, 5, NULL, NULL),
(22, 11, 1, NULL, NULL),
(23, 11, 4, NULL, NULL),
(24, 11, 5, NULL, NULL),
(25, 12, 1, NULL, NULL),
(26, 12, 4, NULL, NULL),
(27, 12, 5, NULL, NULL),
(28, 13, 1, NULL, NULL),
(29, 13, 4, NULL, NULL),
(30, 13, 5, NULL, NULL),
(31, 14, 1, NULL, NULL),
(32, 14, 4, NULL, NULL),
(33, 14, 5, NULL, NULL),
(34, 15, 1, NULL, NULL),
(35, 15, 4, NULL, NULL),
(36, 15, 5, NULL, NULL),
(40, 17, 1, NULL, NULL),
(41, 17, 4, NULL, NULL),
(42, 17, 5, NULL, NULL),
(43, 18, 1, NULL, NULL),
(44, 18, 4, NULL, NULL),
(45, 18, 5, NULL, NULL),
(46, 19, 1, NULL, NULL),
(47, 19, 4, NULL, NULL),
(48, 19, 5, NULL, NULL),
(49, 20, 1, NULL, NULL),
(50, 20, 4, NULL, NULL),
(51, 20, 5, NULL, NULL),
(52, 21, 1, NULL, NULL),
(54, 21, 5, NULL, NULL),
(55, 22, 1, NULL, NULL),
(56, 22, 4, NULL, NULL),
(57, 22, 5, NULL, NULL),
(58, 23, 1, NULL, NULL),
(59, 23, 4, NULL, NULL),
(60, 23, 5, NULL, NULL),
(61, 24, 1, NULL, NULL),
(62, 24, 4, NULL, NULL),
(63, 24, 5, NULL, NULL),
(64, 25, 1, NULL, NULL),
(65, 25, 4, NULL, NULL),
(66, 25, 5, NULL, NULL),
(67, 26, 1, NULL, NULL),
(68, 26, 4, NULL, NULL),
(69, 26, 5, NULL, NULL),
(70, 4, 6, NULL, NULL),
(71, 27, 1, NULL, NULL),
(72, 27, 4, NULL, NULL),
(73, 27, 6, NULL, NULL),
(74, 21, 4, NULL, NULL),
(75, 21, 6, NULL, NULL),
(76, 29, 1, NULL, NULL),
(77, 29, 5, NULL, NULL),
(78, 29, 6, NULL, NULL),
(79, 30, 1, NULL, NULL),
(80, 30, 5, NULL, NULL),
(81, 30, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `count` int(100) DEFAULT NULL,
  `sold` int(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color_id`, `count`, `sold`, `created_at`, `updated_at`) VALUES
(17, 9, 1, 50, NULL, NULL, NULL),
(20, 9, 9, 50, NULL, NULL, NULL),
(25, 11, 1, 6, 4, NULL, NULL),
(26, 11, 3, 28, NULL, NULL, NULL),
(27, 12, 1, 15, NULL, NULL, NULL),
(28, 12, 4, 20, 6, NULL, NULL),
(29, 13, 1, 20, NULL, NULL, NULL),
(31, 13, 8, 30, NULL, NULL, NULL),
(32, 13, 9, 50, NULL, NULL, NULL),
(33, 14, 1, 52, NULL, NULL, NULL),
(34, 14, 4, 30, NULL, NULL, NULL),
(36, 15, 1, 30, NULL, NULL, NULL),
(38, 15, 13, 1, NULL, NULL, NULL),
(42, 17, 4, 20, NULL, NULL, NULL),
(46, 18, 4, 25, NULL, NULL, NULL),
(47, 19, 7, 22, NULL, NULL, NULL),
(48, 20, 1, 15, NULL, NULL, NULL),
(49, 20, 2, 20, NULL, NULL, NULL),
(50, 20, 16, 10, NULL, NULL, NULL),
(53, 21, 7, 20, NULL, NULL, NULL),
(54, 22, 1, 30, NULL, NULL, NULL),
(55, 22, 2, 10, NULL, NULL, NULL),
(56, 22, 3, 5, NULL, NULL, NULL),
(57, 22, 4, 5, NULL, NULL, NULL),
(58, 22, 7, 5, NULL, NULL, NULL),
(59, 22, 9, 5, NULL, NULL, NULL),
(60, 23, 1, 30, NULL, NULL, NULL),
(61, 23, 9, 15, NULL, NULL, NULL),
(62, 4, 8, 15, NULL, NULL, NULL),
(63, 4, 9, 15, NULL, NULL, NULL),
(64, 7, 11, 15, NULL, NULL, NULL),
(65, 24, 11, 15, NULL, NULL, NULL),
(66, 24, 12, 15, NULL, NULL, NULL),
(67, 25, 11, 22, NULL, NULL, NULL),
(68, 25, 12, 10, NULL, NULL, NULL),
(69, 26, 1, 30, NULL, NULL, NULL),
(70, 26, 12, 11, NULL, NULL, NULL),
(71, 5, 6, 11, NULL, NULL, NULL),
(72, 27, 9, 15, NULL, NULL, NULL),
(73, 29, 3, 13, NULL, NULL, NULL),
(74, 29, 4, 20, NULL, NULL, NULL),
(75, 29, 9, 20, NULL, NULL, NULL),
(76, 30, 3, 10, NULL, NULL, NULL),
(77, 30, 11, 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_thumbs`
--

CREATE TABLE `product_thumbs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_thumbs`
--

INSERT INTO `product_thumbs` (`id`, `link`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(28, 'uploads/images/957affb7-2b9f-4ad1-84c9-752fdfd87e54_1.151ff758cb2901565a1714e1e0c9a827.png', 9, 9, '2023-05-25 05:58:36', '2023-05-25 05:59:38'),
(33, 'uploads/images/9.webp', 11, 1, '2023-05-25 06:08:37', '2023-05-25 06:09:26'),
(34, 'uploads/images/10.webp', 11, 3, '2023-05-25 06:08:37', '2023-05-25 06:09:26'),
(35, 'uploads/images/3.webp', 12, 1, '2023-05-25 06:11:09', '2023-05-25 06:11:27'),
(39, 'uploads/images/iphone-x-64gb-1.png', 13, 9, '2023-05-25 06:13:08', '2023-05-25 06:13:50'),
(40, 'uploads/images/th (12).jpg', 13, 8, '2023-05-25 06:13:08', '2023-05-25 06:13:50'),
(44, 'uploads/images/screenshot-2-39.webp', 18, 4, '2023-08-12 22:53:03', '2023-08-12 22:53:23'),
(45, 'uploads/images/samsung-galaxy-a23-cam-thumb-600x600-1.webp', 19, 7, '2023-08-12 22:56:28', '2023-08-12 22:56:39'),
(46, 'uploads/images/sm-s908-galaxys22ultra-front-burgundy-211119-b39e1c3e-8f71-47e8-9ee3-190073577b34-e238f842-5f8f-4b66-bdc8-157073082153.webp', 20, 16, '2023-08-12 22:58:37', '2023-08-22 04:58:02'),
(47, 'uploads/images/sm-s908-galaxys22ultra-front-green-211119-d48e2ccc-13ff-4e82-9977-a9c509ff3d9e-9ac23ef8-86eb-4184-ae0c-a12b319b5391.webp', 20, 2, '2023-08-12 22:58:37', '2023-08-12 22:59:02'),
(48, 'uploads/images/sm-s908-galaxys22ultra-front-phantomblack-211119-a4360b9a-98cd-4a8a-9af7-36ce47ac625b-dd421b41-9860-4c1b-bf02-6b8dacbd7237.webp', 20, 1, '2023-08-12 22:58:37', '2023-08-12 22:59:02'),
(49, 'uploads/images/mykid4g-viettel-videocall_725012c8de9348e283917669c9fe4432_master.jpg', 17, 4, '2023-08-13 08:11:11', '2023-08-13 08:11:24'),
(50, 'uploads/images/MKWA3ref_VW_34FR+watch-41-alum-starlight-cell-8s_VW_34FR_WF_CO_GEO_VN.jpg', 14, 4, '2023-08-13 08:21:19', '2023-08-13 08:21:27'),
(51, 'uploads/images/f34d1756519760ba9e7dfd78cd61d0cc.jpg', 15, 13, '2023-08-13 08:23:28', '2023-08-13 08:23:43'),
(52, 'uploads/images/galaxy-a13.webp', 21, 7, '2023-08-13 08:26:03', '2023-08-13 08:27:05'),
(53, 'uploads/images/iphone-13-05-4-7193dda0-8b4f-4f6a-95ee-c4834979fad2 (1).webp', 22, 2, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(54, 'uploads/images/iphone-13-04-4-0499e0ed-433d-42e4-be42-83acc5212d63.webp', 22, 3, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(55, 'uploads/images/iphone-13-02-28bb8c78-0a40-4f97-baaa-c25e6665f4ad.webp', 22, 7, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(56, 'uploads/images/iphone-13-01-4-da6cf5b9-02d3-496e-8356-0d45af8f485f.webp', 22, 4, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(57, 'uploads/images/iphone-13-05-4-7193dda0-8b4f-4f6a-95ee-c4834979fad2.webp', 22, 9, '2023-08-13 08:30:01', '2023-08-13 08:30:26'),
(58, 'uploads/images/11-pro-plus-blue.webp', 23, 1, '2023-08-13 08:32:25', '2023-08-13 08:32:38'),
(59, 'uploads/images/11-pro-plus-green-1.webp', 23, 9, '2023-08-13 08:32:25', '2023-08-13 08:32:38'),
(60, 'uploads/images/5938_7036_lenovo_legion_5_2022_900x900_2.jpg', 4, 8, '2023-08-13 08:39:07', '2023-08-13 08:39:54'),
(61, 'uploads/images/1973_laptopaz_lenovo_legion_5pro_r9000p_1.jpg', 4, 9, '2023-08-13 08:39:07', '2023-08-13 08:39:54'),
(63, 'uploads/images/mauxam_1_c4ab2ff14a514f6cb3c4c581b5b1d708.webp', 7, 11, '2023-08-13 08:43:23', '2023-08-13 08:43:36'),
(64, 'uploads/images/74729793977e7ee2bf286b89417ff0ee-9b19d7d7-3be8-4daa-89b5-b7075406d3d2.webp', 24, 11, '2023-08-13 08:45:57', '2023-08-22 05:00:02'),
(66, 'uploads/images/macbook-pro-2021-004-1-1-1.webp', 24, 12, '2023-08-13 08:45:57', '2023-08-22 05:00:02'),
(67, 'uploads/images/mbp-silver-select-202011-4-b1959e1a-09b4-4519-97e0-94160b0c0f7e.webp', 25, 11, '2023-08-13 08:47:45', '2023-08-13 08:48:03'),
(68, 'uploads/images/macbook-air-m2-1-1-68503a36-663c-40b7-914b-d45f541790ea.webp', 25, 12, '2023-08-13 08:47:45', '2023-08-13 08:48:03'),
(69, 'uploads/images/4ee6534c0fb39205232bb45737bef1ad-3f544934-e251-4a0a-8715-16015b98648c-096de356-d971-4237-97fc-34aed098d782.webp', 26, 1, '2023-08-13 08:49:49', '2023-08-13 08:50:06'),
(70, 'uploads/images/macbook-pro-14-inch-2021-10cpu-16gpu-32gb-1tb-96w-3-034b5f6e-809e-416e-b960-0db9dc348318-0c15a710-5169-49f6-acdb-87b02b8c361f-bef8bcab-1713-4382-891b-88b3ae68cd94.webp', 26, 12, '2023-08-13 08:49:49', '2023-08-13 08:50:06'),
(71, 'uploads/images/galaxy-a13.webp', 5, 6, '2023-08-13 08:57:36', '2023-08-13 08:58:06'),
(77, 'uploads/images/oppo-reno-10-xam.jpg.webp', 12, 4, '2023-08-15 04:55:50', '2023-08-15 04:58:59'),
(78, 'uploads/images/b49787949a9ed68aa19b1cca5fbc20.webp', 27, 9, '2023-08-16 09:29:07', '2023-08-16 09:29:13'),
(79, 'uploads/images/apple_watch_se-1_dc853adf5a2341a684f92b0b51741953.webp', 9, 1, '2023-08-22 04:53:06', '2023-08-22 04:53:13'),
(80, 'uploads/images/ip-13-white.jpg', 13, 1, '2023-08-22 04:55:02', '2023-08-22 04:55:07'),
(81, 'uploads/images/600_apple-watch-se-2022-40mm-gps-vien-nhom-day-cao-su-xtmobile.webp', 14, 1, '2023-08-22 04:55:50', '2023-08-22 04:55:54'),
(82, 'uploads/images/samsung-galaxy-a73-5g-mau-trang-didongviet.webp', 15, 1, '2023-08-22 04:56:48', '2023-08-22 04:56:52'),
(83, 'uploads/images/iphone-13-mini-white_1635926408.jpg', 22, 1, '2023-08-22 04:59:21', '2023-08-22 04:59:26'),
(84, 'uploads/images/macbook-air-m2-3.webp', 29, 9, '2023-08-22 05:09:28', '2023-08-22 05:09:48'),
(85, 'uploads/images/macbook-pro-2021-005-1-1.webp', 29, 4, '2023-08-22 05:09:28', '2023-08-22 05:09:48'),
(86, 'uploads/images/macbook-air-m2-1-1.webp', 29, 3, '2023-08-22 05:09:28', '2023-08-22 05:09:48'),
(87, 'uploads/images/mbp-silver-select-202011-4-b1959e1a-09b4-4519-97e0-94160b0c0f7e (1).webp', 30, 11, '2023-08-22 05:13:35', '2023-08-22 05:13:50'),
(88, 'uploads/images/macbook-air-m2-1-1-68503a36-663c-40b7-914b-d45f541790ea (1).webp', 30, 3, '2023-08-22 05:13:35', '2023-08-22 05:13:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` int(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `customer_id`, `product_id`, `star`, `created_at`, `updated_at`) VALUES
(1, 4, 15, 4, '2023-08-26 08:34:22', '2023-08-26 08:34:38'),
(2, 4, 7, 5, '2023-08-26 08:49:01', '2023-08-26 09:04:56'),
(3, 4, 12, 5, '2023-08-26 09:08:02', '2023-08-26 09:08:20'),
(4, 4, 14, 4, '2023-08-26 19:08:36', '2023-08-26 19:08:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(7, 'Admin', 'Quản lý toàn bộ hệ thống', '2023-04-29 21:30:56', '2023-04-29 21:30:56'),
(10, 'User manager', 'Quản lý người dùng trong hệ thống', '2023-05-01 23:19:58', '2023-05-01 23:19:58'),
(11, 'Product manager', 'Quản lý sản phẩm trong hệ thống', '2023-05-28 20:37:09', '2023-05-28 20:37:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(18, 7, 4, NULL, NULL),
(23, 7, 8, NULL, NULL),
(24, 7, 9, NULL, NULL),
(25, 7, 10, NULL, NULL),
(26, 7, 11, NULL, NULL),
(27, 7, 18, NULL, NULL),
(28, 7, 21, NULL, NULL),
(29, 7, 22, NULL, NULL),
(30, 7, 23, NULL, NULL),
(31, 7, 7, NULL, NULL),
(32, 7, 12, NULL, NULL),
(33, 7, 13, NULL, NULL),
(34, 7, 14, NULL, NULL),
(35, 7, 19, NULL, NULL),
(36, 7, 15, NULL, NULL),
(37, 7, 16, NULL, NULL),
(38, 7, 17, NULL, NULL),
(39, 7, 20, NULL, NULL),
(40, 10, 4, NULL, NULL),
(41, 10, 8, NULL, NULL),
(42, 10, 9, NULL, NULL),
(43, 10, 10, NULL, NULL),
(44, 10, 11, NULL, NULL),
(45, 10, 18, NULL, NULL),
(46, 10, 21, NULL, NULL),
(47, 10, 22, NULL, NULL),
(48, 10, 23, NULL, NULL),
(50, 11, 1, NULL, NULL),
(51, 11, 5, NULL, NULL),
(52, 11, 6, NULL, NULL),
(53, 11, 3, NULL, NULL),
(65, 7, 41, NULL, NULL),
(66, 7, 42, NULL, NULL),
(67, 7, 43, NULL, NULL),
(68, 7, 44, NULL, NULL),
(69, 7, 45, NULL, NULL),
(70, 7, 46, NULL, NULL),
(71, 7, 47, NULL, NULL),
(72, 7, 48, NULL, NULL),
(73, 7, 49, NULL, NULL),
(74, 7, 33, NULL, NULL),
(75, 7, 37, NULL, NULL),
(76, 7, 38, NULL, NULL),
(77, 7, 39, NULL, NULL),
(78, 7, 40, NULL, NULL),
(79, 7, 50, NULL, NULL),
(80, 7, 1, NULL, NULL),
(81, 7, 5, NULL, NULL),
(82, 7, 6, NULL, NULL),
(83, 7, 29, NULL, NULL),
(84, 7, 30, NULL, NULL),
(85, 7, 31, NULL, NULL),
(86, 7, 32, NULL, NULL),
(87, 7, 34, NULL, NULL),
(88, 7, 35, NULL, NULL),
(89, 7, 36, NULL, NULL),
(90, 7, 52, NULL, NULL),
(92, 7, 3, NULL, NULL),
(93, 7, 25, NULL, NULL),
(94, 7, 26, NULL, NULL),
(95, 7, 27, NULL, NULL),
(96, 7, 28, NULL, NULL),
(97, 7, 51, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatar.png',
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `messenger_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `address`, `birth`, `gender`, `note`, `created_at`, `updated_at`, `deleted_at`, `active_status`, `avatar`, `dark_mode`, `messenger_color`) VALUES
(9, 'Tran Van Dung', 'toandtq11123@gmail.com', '$2y$10$4VtlGqZr4ARcaGURBUbLWeao7bupgKKt1Uq2R91gqXB6r5hheE5LK', '0911477123', 'Hải Phòng', '2008-06-08', 'male', 'Không', '2023-04-28 03:21:21', '2023-08-23 19:29:41', '2023-08-23 19:29:41', 0, 'avatar.png', 0, NULL),
(10, 'Pham Minh Anh', 'thuymaitoanki@gmail.com', '$2y$10$TgvlblflQMPSqG585gxc/O.P/sy1Jg7pIMHMMahRm3d0pfhzAVkmu', '0911477912', 'Hà Nội', '2023-03-30', 'female', NULL, '2023-04-28 10:14:45', '2023-08-30 20:04:40', NULL, 1, 'f95e63d1-0c66-474d-ac5e-8dd269559aa9.png', 1, '#4CAF50'),
(11, 'Pham Van Phu Quyen', 'toandtq12345@gmail.com', '$2y$10$degGqBtt9OGpLQTC6ZfsG.FInzkYqepV7qcv9MuSUZ8BafgSuAYQC', '0911477123', 'Lào Cai', '2023-04-30', 'male', 'Không có', '2023-04-30 03:36:06', '2023-08-23 19:29:41', '2023-08-23 19:29:41', 0, 'avatar.png', 0, NULL),
(13, 'Pham Van Am', 'toandtq123@gmail.com', '$2y$10$2gx97mMH5oyMkAK1kECYd.5DSWpA5Z44UEw2qlQ1tZhBzrU5V.UU6', '0911477121', 'Lào Cai', '2023-05-01', 'male', 'Không', '2023-05-01 23:21:55', '2023-08-21 04:55:52', NULL, 0, 'a11211ba-f3f7-4c1e-b5c1-870ae44b4b3d.png', 1, '#673AB7'),
(15, 'Nguyen Van Tuan', 'tuannguyenlqd36@gmail.com', '$2y$10$w2kN1KCmNwz/poL.prEhFOgMlGnvsQmjEL9nEtjq5/.LFD/gTz.xa', '0911477912', 'Nam Định', '2023-08-21', 'male', 'Không', '2023-08-21 05:46:45', '2023-08-22 22:49:06', NULL, 0, 'avatar.png', 0, NULL),
(16, 'Vu Thang', 'hacktien1st@gmail.com', '$2y$10$v42C/dwN/WGr1SGCybV7f.tNl9FAmmDPIkqej2jVdWPlrrqvSyGJK', '0987654321', 'Nam Định', '2023-08-21', 'male', 'Không', '2023-08-21 05:50:43', '2023-08-22 22:49:17', NULL, 1, 'avatar.png', 0, NULL),
(17, 'Doan Duc Toan', 'toanymanh@gmail.com', '$2y$10$IF.0tzLQqOzrXYfqEvOPVOCZ6yjXuHg3fMhp36HWWgDLSR4mwN4he', '0321546879', 'Nam Định', '2023-08-21', 'male', 'Admin', '2023-08-21 05:53:42', '2023-08-23 08:33:02', NULL, 0, '990fe336-74b1-4518-9edd-df1271080f64.jpg', 1, '#2180f3'),
(19, 'Kitamura Renji', 'renji@gmail.com', '$2y$10$6msO36lzQR11agn1yINnFup2RvQJ9oNIbfQ4zCfJNkQSNy.WfVGO6', '0321546987', 'Vũng tàu', '2023-08-25', 'female', 'Renji', '2023-08-23 04:22:55', '2023-08-23 04:37:06', '2023-08-23 04:37:06', 0, 'avatar.png', 0, NULL),
(20, 'Job Fair', 'jobfair@gmail.com', '$2y$10$o6vDJvx9inBtHOsS/rKKg.galwhUK26qPx44hYG3sJtP7aOaYhSDe', '0222555888', 'Hedspi', '2023-08-25', 'male', 'None', '2023-08-23 19:15:45', '2023-08-23 19:15:45', NULL, 0, 'avatar.png', 0, NULL),
(21, 'Phan Van Cuong', 'pvcuong@gmail.com', '$2y$10$RiVNP1gBS4mReRAfg9zTgOPih623/7AocQwVB352tnrsHK4eRteBy', '0222444999', 'Hà Nội', '2023-08-24', 'male', 'Thầy Cương', '2023-08-23 20:07:46', '2023-08-23 20:07:46', NULL, 0, 'avatar.png', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

CREATE TABLE `user_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(10, 10, 7, NULL, NULL),
(17, 9, 11, NULL, NULL),
(18, 13, 7, NULL, NULL),
(20, 15, 7, NULL, NULL),
(21, 16, 7, NULL, NULL),
(22, 17, 7, NULL, NULL),
(24, 19, 7, NULL, NULL),
(25, 20, 7, NULL, NULL),
(26, 21, 7, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ch_favorites`
--
ALTER TABLE `ch_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ch_messages`
--
ALTER TABLE `ch_messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_user_id_foreign` (`user_id`),
  ADD KEY `conversations_customer_id_foreign` (`customer_id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD KEY `customers_draft_order_foreign` (`draft_order`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_customer_id_foreign` (`customer_id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_detail_order_id_foreign` (`order_id`),
  ADD KEY `order_detail_product_id_foreign` (`product_id`),
  ADD KEY `order_detail_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `product_cat`
--
ALTER TABLE `product_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_cat_product_id_foreign` (`product_id`),
  ADD KEY `product_cat_cat_id_foreign` (`cat_id`);

--
-- Chỉ mục cho bảng `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_product_id_foreign` (`product_id`),
  ADD KEY `product_color_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `product_thumbs`
--
ALTER TABLE `product_thumbs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_thumbs_product_id_foreign` (`product_id`),
  ADD KEY `product_thumbs_color_id_foreign` (`color_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_customer_id_foreign` (`customer_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cats`
--
ALTER TABLE `cats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `product_cat`
--
ALTER TABLE `product_cat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `product_thumbs`
--
ALTER TABLE `product_thumbs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_draft_order_foreign` FOREIGN KEY (`draft_order`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_cat`
--
ALTER TABLE `product_cat`
  ADD CONSTRAINT `product_cat_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `cats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_thumbs`
--
ALTER TABLE `product_thumbs`
  ADD CONSTRAINT `product_thumbs_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_thumbs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
