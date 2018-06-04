-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th5 21, 2018 lúc 03:34 PM
-- Phiên bản máy phục vụ: 5.7.22-0ubuntu0.16.04.1
-- Phiên bản PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `exchange`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add coin', 7, 'add_coin'),
(20, 'Can change coin', 7, 'change_coin'),
(21, 'Can delete coin', 7, 'delete_coin'),
(22, 'Can add chenh lech', 8, 'add_chenhlech'),
(23, 'Can change chenh lech', 8, 'change_chenhlech'),
(24, 'Can delete chenh lech', 8, 'delete_chenhlech'),
(25, 'Can add match exchange', 9, 'add_matchexchange'),
(26, 'Can change match exchange', 9, 'change_matchexchange'),
(27, 'Can delete match exchange', 9, 'delete_matchexchange'),
(28, 'Can add exchange', 10, 'add_exchange'),
(29, 'Can change exchange', 10, 'change_exchange'),
(30, 'Can delete exchange', 10, 'delete_exchange'),
(31, 'Can add user', 11, 'add_user'),
(32, 'Can change user', 11, 'change_user'),
(33, 'Can delete user', 11, 'delete_user'),
(34, 'Can add type coin', 12, 'add_typecoin'),
(35, 'Can change type coin', 12, 'change_typecoin'),
(36, 'Can delete type coin', 12, 'delete_typecoin'),
(37, 'Can add user coin', 13, 'add_usercoin'),
(38, 'Can change user coin', 13, 'change_usercoin'),
(39, 'Can delete user coin', 13, 'delete_usercoin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$8YI4iaK4niOO$h2AyhV7wKJtrZrmslgAcS3pLLGUwEf3mN0/ptmw4SJE=', '2018-05-14 08:32:03.609580', 1, 'levante', '', '', 'haduchienmtat32@gmail.com', 1, 1, '2018-05-14 08:31:24.547843');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'general', 'chenhlech'),
(7, 'general', 'coin'),
(10, 'general', 'exchange'),
(9, 'general', 'matchexchange'),
(12, 'general', 'typecoin'),
(11, 'general', 'user'),
(13, 'general', 'usercoin'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-05-13 16:05:03.051234'),
(2, 'auth', '0001_initial', '2018-05-13 16:05:03.464345'),
(3, 'admin', '0001_initial', '2018-05-13 16:05:03.573592'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-05-13 16:05:03.618651'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-05-13 16:05:03.699535'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-05-13 16:05:03.740562'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-05-13 16:05:03.786394'),
(8, 'auth', '0004_alter_user_username_opts', '2018-05-13 16:05:03.807892'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-05-13 16:05:03.848786'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-05-13 16:05:03.852416'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-05-13 16:05:03.865954'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-05-13 16:05:03.955070'),
(13, 'general', '0001_initial', '2018-05-13 16:05:04.631719'),
(14, 'sessions', '0001_initial', '2018-05-13 16:05:04.667802'),
(15, 'general', '0002_exchange_status', '2018-05-13 16:23:24.636133');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('s52f54m3syrpaztw0e5j9t3kgh1tnr0b', 'ZjE4NDExMGQyYjVlODk1MzIzZGM5NWEyMGIyMGU0MTZhMmFhMWEyOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjAwZGFkNTlmYzVjYTkwNDRjNGEwMmZiZDkxZWZjYThhMzcxMzRhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 08:32:03.614559');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_chenhlech`
--

CREATE TABLE `general_chenhlech` (
  `id` int(11) NOT NULL,
  `value` double NOT NULL,
  `fromtypecoin_id` int(11) NOT NULL,
  `totypecoin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_chenhlech`
--

INSERT INTO `general_chenhlech` (`id`, `value`, `fromtypecoin_id`, `totypecoin_id`) VALUES
(1, 0.01, 1, 2),
(2, 0.01, 1, 3),
(3, 0.01, 1, 4),
(4, 0.01, 2, 1),
(5, 0.01, 2, 3),
(6, 0.01, 2, 4),
(7, 0.01, 3, 1),
(8, 0.01, 3, 2),
(9, 0.01, 3, 4),
(10, 0.01, 4, 1),
(11, 0.01, 4, 2),
(12, 0.01, 4, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_coin`
--

CREATE TABLE `general_coin` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `time` datetime(6) NOT NULL,
  `typecoin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_coin`
--

INSERT INTO `general_coin` (`id`, `price`, `time`, `typecoin_id`) VALUES
(1, 192409602.9, '2018-05-13 07:50:18.000000', 1),
(2, 16710552.16, '2018-05-13 07:50:18.000000', 2),
(3, 4608450.69, '2018-05-13 07:50:18.000000', 3),
(4, 22174.51, '2018-05-13 07:50:18.000000', 4),
(5, 192135156.78, '2018-05-13 08:52:41.000000', 1),
(6, 16734421.54, '2018-05-13 08:52:41.000000', 2),
(7, 4592286.36, '2018-05-13 08:52:41.000000', 3),
(8, 22145.65, '2018-05-13 08:52:41.000000', 4),
(9, 192157997.38, '2018-05-13 09:52:53.000000', 1),
(10, 16732432.42, '2018-05-13 09:52:53.000000', 2),
(11, 4592286.36, '2018-05-13 09:52:53.000000', 3),
(12, 22142.31, '2018-05-13 09:52:53.000000', 4),
(13, 191998227.11, '2018-05-14 07:54:40.000000', 1),
(14, 16746356.22, '2018-05-14 07:54:40.000000', 2),
(15, 4592286.36, '2018-05-14 07:54:40.000000', 3),
(16, 22144.13, '2018-05-14 07:54:40.000000', 4),
(17, 191975424.47, '2018-05-14 07:55:26.000000', 1),
(18, 16748345.34, '2018-05-14 07:55:26.000000', 2),
(19, 4593902.8, '2018-05-14 07:55:26.000000', 3),
(20, 22137.76, '2018-05-14 07:55:26.000000', 4),
(21, 192799746.42, '2018-05-14 09:25:38.000000', 1),
(22, 16677474.52, '2018-05-14 09:25:38.000000', 2),
(23, 4577738.47, '2018-05-14 09:25:38.000000', 3),
(24, 22302.4, '2018-05-14 09:25:38.000000', 4),
(29, 192799746.42, '2018-05-14 09:47:56.000000', 1),
(30, 16677474.52, '2018-05-14 09:47:56.000000', 2),
(31, 4577738.47, '2018-05-14 09:47:56.000000', 3),
(32, 22419.32, '2018-05-14 09:47:56.000000', 4),
(33, 193237665.75, '2018-05-14 09:53:09.000000', 1),
(34, 16639679.67, '2018-05-14 09:53:09.000000', 2),
(35, 4714410.14, '2018-05-14 09:53:09.000000', 3),
(36, 22461.38, '2018-05-14 09:53:09.000000', 4),
(37, 192799746.42, '2018-05-14 13:29:11.000000', 1),
(38, 16677501.11, '2018-05-14 13:29:11.000000', 2),
(39, 4726352.89, '2018-05-14 13:29:11.000000', 3),
(40, 22973.1, '2018-05-14 13:29:11.000000', 4),
(41, 197961430.35, '2018-05-14 14:19:01.000000', 1),
(42, 16620841.69, '2018-05-14 14:19:01.000000', 2),
(43, 4725339.34, '2018-05-14 14:19:01.000000', 3),
(44, 23717.33, '2018-05-14 14:19:01.000000', 4),
(45, 197961430.35, '2018-05-14 14:26:49.000000', 1),
(46, 16535718.28, '2018-05-14 14:26:49.000000', 2),
(47, 4721380.11, '2018-05-14 14:26:49.000000', 3),
(48, 23788.21, '2018-05-14 14:26:49.000000', 4),
(49, 197961430.35, '2018-05-14 14:28:10.000000', 1),
(50, 16525820.21, '2018-05-14 14:28:10.000000', 2),
(51, 4715441.27, '2018-05-14 14:28:10.000000', 3),
(52, 23788.24, '2018-05-14 14:28:10.000000', 4),
(53, 197961430.35, '2018-05-14 14:28:15.000000', 1),
(54, 16525820.21, '2018-05-14 14:28:15.000000', 2),
(55, 4715441.27, '2018-05-14 14:28:15.000000', 3),
(56, 23792.1, '2018-05-14 14:28:15.000000', 4),
(57, 197961430.35, '2018-05-14 14:28:20.000000', 1),
(58, 16525820.21, '2018-05-14 14:28:20.000000', 2),
(59, 4715441.27, '2018-05-14 14:28:20.000000', 3),
(60, 23792.1, '2018-05-14 14:28:20.000000', 4),
(61, 197961430.35, '2018-05-14 14:28:25.000000', 1),
(62, 16515922.13, '2018-05-14 14:28:25.000000', 2),
(63, 4715441.27, '2018-05-14 14:28:25.000000', 3),
(64, 23789.67, '2018-05-14 14:28:25.000000', 4),
(65, 197961430.35, '2018-05-14 14:28:30.000000', 1),
(66, 16515922.13, '2018-05-14 14:28:30.000000', 2),
(67, 4715441.27, '2018-05-14 14:28:30.000000', 3),
(68, 23789.67, '2018-05-14 14:28:30.000000', 4),
(69, 197961430.35, '2018-05-14 14:28:36.000000', 1),
(70, 16515922.13, '2018-05-14 14:28:36.000000', 2),
(71, 4715441.27, '2018-05-14 14:28:36.000000', 3),
(72, 23789.67, '2018-05-14 14:28:36.000000', 4),
(73, 197961430.35, '2018-05-14 14:28:41.000000', 1),
(74, 16515922.13, '2018-05-14 14:28:41.000000', 2),
(75, 4723359.73, '2018-05-14 14:28:41.000000', 3),
(76, 23789.67, '2018-05-14 14:28:41.000000', 4),
(77, 197961430.35, '2018-05-14 14:28:45.000000', 1),
(78, 16515922.13, '2018-05-14 14:28:45.000000', 2),
(79, 4723359.73, '2018-05-14 14:28:45.000000', 3),
(80, 23789.67, '2018-05-14 14:28:45.000000', 4),
(81, 197961430.35, '2018-05-14 14:28:50.000000', 1),
(82, 16515922.13, '2018-05-14 14:28:50.000000', 2),
(83, 4723359.73, '2018-05-14 14:28:50.000000', 3),
(84, 23789.67, '2018-05-14 14:28:50.000000', 4),
(85, 197961430.35, '2018-05-14 14:28:55.000000', 1),
(86, 16513942.52, '2018-05-14 14:28:55.000000', 2),
(87, 4723359.73, '2018-05-14 14:28:55.000000', 3),
(88, 23790.92, '2018-05-14 14:28:55.000000', 4),
(89, 197961430.35, '2018-05-14 14:29:00.000000', 1),
(90, 16515922.13, '2018-05-14 14:29:00.000000', 2),
(91, 4723359.73, '2018-05-14 14:29:00.000000', 3),
(92, 23786.38, '2018-05-14 14:29:00.000000', 4),
(93, 197961430.35, '2018-05-14 14:29:05.000000', 1),
(94, 16515922.13, '2018-05-14 14:29:05.000000', 2),
(95, 4723359.73, '2018-05-14 14:29:05.000000', 3),
(96, 23786.38, '2018-05-14 14:29:05.000000', 4),
(97, 197961430.35, '2018-05-14 14:29:11.000000', 1),
(98, 16539677.51, '2018-05-14 14:29:11.000000', 2),
(99, 4715441.27, '2018-05-14 14:29:11.000000', 3),
(100, 23783.69, '2018-05-14 14:29:11.000000', 4),
(101, 197961430.35, '2018-05-14 14:29:15.000000', 1),
(102, 16539677.51, '2018-05-14 14:29:15.000000', 2),
(103, 4715441.27, '2018-05-14 14:29:15.000000', 3),
(104, 23783.69, '2018-05-14 14:29:15.000000', 4),
(105, 197961430.35, '2018-05-14 14:29:20.000000', 1),
(106, 16539677.51, '2018-05-14 14:29:20.000000', 2),
(107, 4715441.27, '2018-05-14 14:29:20.000000', 3),
(108, 23783.69, '2018-05-14 14:29:20.000000', 4),
(109, 197961430.35, '2018-05-14 14:29:25.000000', 1),
(110, 16549575.58, '2018-05-14 14:29:25.000000', 2),
(111, 4715441.27, '2018-05-14 14:29:25.000000', 3),
(112, 23782.64, '2018-05-14 14:29:25.000000', 4),
(113, 197961430.35, '2018-05-14 14:29:30.000000', 1),
(114, 16549575.58, '2018-05-14 14:29:30.000000', 2),
(115, 4715441.27, '2018-05-14 14:29:30.000000', 3),
(116, 23782.64, '2018-05-14 14:29:30.000000', 4),
(117, 197961430.35, '2018-05-14 14:29:35.000000', 1),
(118, 16549575.58, '2018-05-14 14:29:35.000000', 2),
(119, 4715441.27, '2018-05-14 14:29:35.000000', 3),
(120, 23782.64, '2018-05-14 14:29:35.000000', 4),
(121, 197961430.35, '2018-05-14 14:29:40.000000', 1),
(122, 16545616.35, '2018-05-14 14:29:40.000000', 2),
(123, 4721380.11, '2018-05-14 14:29:40.000000', 3),
(124, 23782.61, '2018-05-14 14:29:40.000000', 4),
(125, 197961430.35, '2018-05-14 14:29:45.000000', 1),
(126, 16545616.35, '2018-05-14 14:29:45.000000', 2),
(127, 4721380.11, '2018-05-14 14:29:45.000000', 3),
(128, 23782.61, '2018-05-14 14:29:45.000000', 4),
(129, 197961430.35, '2018-05-14 14:29:50.000000', 1),
(130, 16545616.35, '2018-05-14 14:29:50.000000', 2),
(131, 4721380.11, '2018-05-14 14:29:50.000000', 3),
(132, 23782.61, '2018-05-14 14:29:50.000000', 4),
(133, 197961430.35, '2018-05-14 14:29:55.000000', 1),
(134, 16547595.96, '2018-05-14 14:29:55.000000', 2),
(135, 4721380.11, '2018-05-14 14:29:55.000000', 3),
(136, 23783.86, '2018-05-14 14:29:55.000000', 4),
(137, 197961430.35, '2018-05-14 14:30:01.000000', 1),
(138, 16547595.96, '2018-05-14 14:30:01.000000', 2),
(139, 4721380.11, '2018-05-14 14:30:01.000000', 3),
(140, 23783.95, '2018-05-14 14:30:01.000000', 4),
(141, 197961430.35, '2018-05-14 14:30:05.000000', 1),
(142, 16547595.96, '2018-05-14 14:30:05.000000', 2),
(143, 4721380.11, '2018-05-14 14:30:05.000000', 3),
(144, 23783.95, '2018-05-14 14:30:05.000000', 4),
(145, 197961430.35, '2018-05-14 14:30:10.000000', 1),
(146, 16547595.96, '2018-05-14 14:30:10.000000', 2),
(147, 4721380.11, '2018-05-14 14:30:10.000000', 3),
(148, 23783.95, '2018-05-14 14:30:10.000000', 4),
(149, 197961430.35, '2018-05-14 14:30:15.000000', 1),
(150, 16539677.51, '2018-05-14 14:30:15.000000', 2),
(151, 4721380.11, '2018-05-14 14:30:15.000000', 3),
(152, 23783.95, '2018-05-14 14:30:15.000000', 4),
(153, 197961430.35, '2018-05-14 14:30:20.000000', 1),
(154, 16535718.28, '2018-05-14 14:30:20.000000', 2),
(155, 4721380.11, '2018-05-14 14:30:20.000000', 3),
(156, 23783.95, '2018-05-14 14:30:20.000000', 4),
(157, 197961430.35, '2018-05-14 14:30:25.000000', 1),
(158, 16539677.51, '2018-05-14 14:30:25.000000', 2),
(159, 4721380.11, '2018-05-14 14:30:25.000000', 3),
(160, 23783.95, '2018-05-14 14:30:25.000000', 4),
(161, 197961430.35, '2018-05-14 14:30:30.000000', 1),
(162, 16537697.89, '2018-05-14 14:30:30.000000', 2),
(163, 4721380.11, '2018-05-14 14:30:30.000000', 3),
(164, 23780.64, '2018-05-14 14:30:30.000000', 4),
(165, 197961430.35, '2018-05-14 14:30:36.000000', 1),
(166, 16537697.89, '2018-05-14 14:30:36.000000', 2),
(167, 4721380.11, '2018-05-14 14:30:36.000000', 3),
(168, 23780.64, '2018-05-14 14:30:36.000000', 4),
(169, 197961430.35, '2018-05-14 14:30:40.000000', 1),
(170, 16537697.89, '2018-05-14 14:30:40.000000', 2),
(171, 4721380.11, '2018-05-14 14:30:40.000000', 3),
(172, 23780.64, '2018-05-14 14:30:40.000000', 4),
(173, 197961430.35, '2018-05-14 14:30:45.000000', 1),
(174, 16535718.28, '2018-05-14 14:30:45.000000', 2),
(175, 4721380.11, '2018-05-14 14:30:45.000000', 3),
(176, 23780.89, '2018-05-14 14:30:45.000000', 4),
(177, 197961430.35, '2018-05-14 14:30:50.000000', 1),
(178, 16535718.28, '2018-05-14 14:30:50.000000', 2),
(179, 4721380.11, '2018-05-14 14:30:50.000000', 3),
(180, 23780.89, '2018-05-14 14:30:50.000000', 4),
(181, 197961430.35, '2018-05-14 14:30:55.000000', 1),
(182, 16535718.28, '2018-05-14 14:30:55.000000', 2),
(183, 4721380.11, '2018-05-14 14:30:55.000000', 3),
(184, 23780.89, '2018-05-14 14:30:55.000000', 4),
(185, 197961430.35, '2018-05-14 14:31:01.000000', 1),
(186, 16533738.66, '2018-05-14 14:31:01.000000', 2),
(187, 4721380.11, '2018-05-14 14:31:01.000000', 3),
(188, 23785.95, '2018-05-14 14:31:01.000000', 4),
(189, 197961430.35, '2018-05-14 14:31:06.000000', 1),
(190, 16531759.05, '2018-05-14 14:31:06.000000', 2),
(191, 4725339.34, '2018-05-14 14:31:06.000000', 3),
(192, 23785.95, '2018-05-14 14:31:06.000000', 4),
(193, 197961430.35, '2018-05-14 14:31:11.000000', 1),
(194, 16533738.66, '2018-05-14 14:31:11.000000', 2),
(195, 4721380.11, '2018-05-14 14:31:11.000000', 3),
(196, 23785.95, '2018-05-14 14:31:11.000000', 4),
(197, 197961430.35, '2018-05-14 14:31:15.000000', 1),
(198, 16531759.05, '2018-05-14 14:31:15.000000', 2),
(199, 4725339.34, '2018-05-14 14:31:15.000000', 3),
(200, 23785.95, '2018-05-14 14:31:15.000000', 4),
(201, 197961430.35, '2018-05-14 14:31:20.000000', 1),
(202, 16533738.66, '2018-05-14 14:31:20.000000', 2),
(203, 4719400.5, '2018-05-14 14:31:20.000000', 3),
(204, 23789.98, '2018-05-14 14:31:20.000000', 4),
(205, 197961430.35, '2018-05-14 14:31:25.000000', 1),
(206, 16533738.66, '2018-05-14 14:31:25.000000', 2),
(207, 4719400.5, '2018-05-14 14:31:25.000000', 3),
(208, 23789.98, '2018-05-14 14:31:25.000000', 4),
(209, 197961430.35, '2018-05-14 14:31:30.000000', 1),
(210, 16525820.21, '2018-05-14 14:31:30.000000', 2),
(211, 4719400.5, '2018-05-14 14:31:30.000000', 3),
(212, 23787.07, '2018-05-14 14:31:30.000000', 4),
(213, 197961430.35, '2018-05-14 14:31:35.000000', 1),
(214, 16529779.43, '2018-05-14 14:31:35.000000', 2),
(215, 4719400.5, '2018-05-14 14:31:35.000000', 3),
(216, 23787.07, '2018-05-14 14:31:35.000000', 4),
(217, 197961430.35, '2018-05-14 14:31:40.000000', 1),
(218, 16525820.21, '2018-05-14 14:31:40.000000', 2),
(219, 4719400.5, '2018-05-14 14:31:40.000000', 3),
(220, 23787.07, '2018-05-14 14:31:40.000000', 4),
(221, 197961430.35, '2018-05-14 14:31:45.000000', 1),
(222, 16529779.43, '2018-05-14 14:31:45.000000', 2),
(223, 4719400.5, '2018-05-14 14:31:45.000000', 3),
(224, 23787.04, '2018-05-14 14:31:45.000000', 4),
(225, 197961430.35, '2018-05-14 14:31:50.000000', 1),
(226, 16529779.43, '2018-05-14 14:31:50.000000', 2),
(227, 4719400.5, '2018-05-14 14:31:50.000000', 3),
(228, 23787.04, '2018-05-14 14:31:50.000000', 4),
(229, 197961430.35, '2018-05-14 14:31:55.000000', 1),
(230, 16529779.43, '2018-05-14 14:31:55.000000', 2),
(231, 4719400.5, '2018-05-14 14:31:55.000000', 3),
(232, 23797.79, '2018-05-14 14:31:55.000000', 4),
(233, 197961430.35, '2018-05-14 14:32:00.000000', 1),
(234, 16529779.43, '2018-05-14 14:32:00.000000', 2),
(235, 4719400.5, '2018-05-14 14:32:00.000000', 3),
(236, 23797.79, '2018-05-14 14:32:00.000000', 4),
(237, 197961430.35, '2018-05-14 14:32:06.000000', 1),
(238, 16529779.43, '2018-05-14 14:32:06.000000', 2),
(239, 4717420.89, '2018-05-14 14:32:06.000000', 3),
(240, 23812.9, '2018-05-14 14:32:06.000000', 4),
(241, 197961430.35, '2018-05-14 14:32:10.000000', 1),
(242, 16529779.43, '2018-05-14 14:32:10.000000', 2),
(243, 4717420.89, '2018-05-14 14:32:10.000000', 3),
(244, 23812.9, '2018-05-14 14:32:10.000000', 4),
(245, 197961430.35, '2018-05-14 14:32:17.000000', 1),
(246, 16533738.66, '2018-05-14 14:32:17.000000', 2),
(247, 4717420.89, '2018-05-14 14:32:17.000000', 3),
(248, 23809.67, '2018-05-14 14:32:17.000000', 4),
(249, 197961430.35, '2018-05-14 14:32:20.000000', 1),
(250, 16533738.66, '2018-05-14 14:32:20.000000', 2),
(251, 4717420.89, '2018-05-14 14:32:20.000000', 3),
(252, 23809.67, '2018-05-14 14:32:20.000000', 4),
(253, 197961430.35, '2018-05-14 14:32:25.000000', 1),
(254, 16533738.66, '2018-05-14 14:32:25.000000', 2),
(255, 4715441.27, '2018-05-14 14:32:25.000000', 3),
(256, 23808.52, '2018-05-14 14:32:25.000000', 4),
(257, 197961430.35, '2018-05-14 14:32:30.000000', 1),
(258, 16533738.66, '2018-05-14 14:32:30.000000', 2),
(259, 4717420.89, '2018-05-14 14:32:30.000000', 3),
(260, 23808.52, '2018-05-14 14:32:30.000000', 4),
(261, 197961430.35, '2018-05-14 14:32:35.000000', 1),
(262, 16533738.66, '2018-05-14 14:32:35.000000', 2),
(263, 4715441.27, '2018-05-14 14:32:35.000000', 3),
(264, 23808.52, '2018-05-14 14:32:35.000000', 4),
(265, 197961430.35, '2018-05-14 14:32:41.000000', 1),
(266, 16533738.66, '2018-05-14 14:32:41.000000', 2),
(267, 4715441.27, '2018-05-14 14:32:41.000000', 3),
(268, 23813.02, '2018-05-14 14:32:41.000000', 4),
(269, 197961430.35, '2018-05-14 14:32:47.000000', 1),
(270, 16533738.66, '2018-05-14 14:32:47.000000', 2),
(271, 4715441.27, '2018-05-14 14:32:47.000000', 3),
(272, 23813.02, '2018-05-14 14:32:47.000000', 4),
(273, 197961430.35, '2018-05-14 14:32:50.000000', 1),
(274, 16533738.66, '2018-05-14 14:32:50.000000', 2),
(275, 4721380.11, '2018-05-14 14:32:50.000000', 3),
(276, 23813.02, '2018-05-14 14:32:50.000000', 4),
(277, 197961430.35, '2018-05-14 14:32:55.000000', 1),
(278, 16533738.66, '2018-05-14 14:32:55.000000', 2),
(279, 4721380.11, '2018-05-14 14:32:55.000000', 3),
(280, 23813.02, '2018-05-14 14:32:55.000000', 4),
(281, 197961430.35, '2018-05-14 14:33:00.000000', 1),
(282, 16533738.66, '2018-05-14 14:33:00.000000', 2),
(283, 4721380.11, '2018-05-14 14:33:00.000000', 3),
(284, 23807.66, '2018-05-14 14:33:00.000000', 4),
(285, 197961430.35, '2018-05-14 14:33:05.000000', 1),
(286, 16533738.66, '2018-05-14 14:33:05.000000', 2),
(287, 4721380.11, '2018-05-14 14:33:05.000000', 3),
(288, 23797.13, '2018-05-14 14:33:05.000000', 4),
(289, 197961430.35, '2018-05-14 14:33:10.000000', 1),
(290, 16533738.66, '2018-05-14 14:33:10.000000', 2),
(291, 4721380.11, '2018-05-14 14:33:10.000000', 3),
(292, 23797.13, '2018-05-14 14:33:10.000000', 4),
(293, 197961430.35, '2018-05-14 14:33:15.000000', 1),
(294, 16533738.66, '2018-05-14 14:33:15.000000', 2),
(295, 4721380.11, '2018-05-14 14:33:15.000000', 3),
(296, 23798.07, '2018-05-14 14:33:15.000000', 4),
(297, 197961430.35, '2018-05-14 14:33:20.000000', 1),
(298, 16533738.66, '2018-05-14 14:33:20.000000', 2),
(299, 4721380.11, '2018-05-14 14:33:20.000000', 3),
(300, 23797.13, '2018-05-14 14:33:20.000000', 4),
(301, 197961430.35, '2018-05-14 14:33:25.000000', 1),
(302, 16529779.43, '2018-05-14 14:33:25.000000', 2),
(303, 4721380.11, '2018-05-14 14:33:25.000000', 3),
(304, 23798.07, '2018-05-14 14:33:25.000000', 4),
(305, 197961430.35, '2018-05-14 14:33:30.000000', 1),
(306, 16529779.43, '2018-05-14 14:33:30.000000', 2),
(307, 4721380.11, '2018-05-14 14:33:30.000000', 3),
(308, 23798.07, '2018-05-14 14:33:30.000000', 4),
(309, 197961430.35, '2018-05-14 14:33:36.000000', 1),
(310, 16529779.43, '2018-05-14 14:33:36.000000', 2),
(311, 4721380.11, '2018-05-14 14:33:36.000000', 3),
(312, 23789.18, '2018-05-14 14:33:36.000000', 4),
(313, 197961430.35, '2018-05-14 14:33:40.000000', 1),
(314, 16529779.43, '2018-05-14 14:33:40.000000', 2),
(315, 4721380.11, '2018-05-14 14:33:40.000000', 3),
(316, 23789.18, '2018-05-14 14:33:40.000000', 4),
(317, 197961430.35, '2018-05-14 14:33:45.000000', 1),
(318, 16531759.05, '2018-05-14 14:33:45.000000', 2),
(319, 4721380.11, '2018-05-14 14:33:45.000000', 3),
(320, 23789.18, '2018-05-14 14:33:45.000000', 4),
(321, 197961430.35, '2018-05-14 14:33:50.000000', 1),
(322, 16531759.05, '2018-05-14 14:33:50.000000', 2),
(323, 4721380.11, '2018-05-14 14:33:50.000000', 3),
(324, 23789.18, '2018-05-14 14:33:50.000000', 4),
(325, 197961430.35, '2018-05-14 14:33:56.000000', 1),
(326, 16531759.05, '2018-05-14 14:33:56.000000', 2),
(327, 4721380.11, '2018-05-14 14:33:56.000000', 3),
(328, 23789.18, '2018-05-14 14:33:56.000000', 4),
(329, 197961430.35, '2018-05-14 14:34:00.000000', 1),
(330, 16531759.05, '2018-05-14 14:34:00.000000', 2),
(331, 4721380.11, '2018-05-14 14:34:00.000000', 3),
(332, 23789.18, '2018-05-14 14:34:00.000000', 4),
(333, 197961430.35, '2018-05-14 14:34:05.000000', 1),
(334, 16531759.05, '2018-05-14 14:34:05.000000', 2),
(335, 4721380.11, '2018-05-14 14:34:05.000000', 3),
(336, 23780.55, '2018-05-14 14:34:05.000000', 4),
(337, 197961430.35, '2018-05-14 14:34:10.000000', 1),
(338, 16535718.28, '2018-05-14 14:34:10.000000', 2),
(339, 4721380.11, '2018-05-14 14:34:10.000000', 3),
(340, 23778.04, '2018-05-14 14:34:10.000000', 4),
(341, 197961430.35, '2018-05-14 14:34:15.000000', 1),
(342, 16535718.28, '2018-05-14 14:34:15.000000', 2),
(343, 4721380.11, '2018-05-14 14:34:15.000000', 3),
(344, 23778.04, '2018-05-14 14:34:15.000000', 4),
(345, 197961430.35, '2018-05-14 14:34:21.000000', 1),
(346, 16535718.28, '2018-05-14 14:34:21.000000', 2),
(347, 4713461.66, '2018-05-14 14:34:21.000000', 3),
(348, 23768.3, '2018-05-14 14:34:21.000000', 4),
(349, 197961430.35, '2018-05-14 14:34:25.000000', 1),
(350, 16535718.28, '2018-05-14 14:34:25.000000', 2),
(351, 4713461.66, '2018-05-14 14:34:25.000000', 3),
(352, 23768.3, '2018-05-14 14:34:25.000000', 4),
(353, 197961430.35, '2018-05-14 14:34:32.000000', 1),
(354, 16535718.28, '2018-05-14 14:34:32.000000', 2),
(355, 4713461.66, '2018-05-14 14:34:32.000000', 3),
(356, 23768.3, '2018-05-14 14:34:32.000000', 4),
(357, 197961430.35, '2018-05-14 14:34:36.000000', 1),
(358, 16533738.66, '2018-05-14 14:34:36.000000', 2),
(359, 4711482.04, '2018-05-14 14:34:36.000000', 3),
(360, 23746.97, '2018-05-14 14:34:36.000000', 4),
(361, 197961430.35, '2018-05-14 14:34:40.000000', 1),
(362, 16535718.28, '2018-05-14 14:34:40.000000', 2),
(363, 4713461.66, '2018-05-14 14:34:40.000000', 3),
(364, 23768.3, '2018-05-14 14:34:40.000000', 4),
(365, 197961430.35, '2018-05-14 14:34:45.000000', 1),
(366, 16533738.66, '2018-05-14 14:34:45.000000', 2),
(367, 4711482.04, '2018-05-14 14:34:45.000000', 3),
(368, 23746.97, '2018-05-14 14:34:45.000000', 4),
(369, 197961430.35, '2018-05-14 14:34:51.000000', 1),
(370, 16537697.89, '2018-05-14 14:34:51.000000', 2),
(371, 4717420.89, '2018-05-14 14:34:51.000000', 3),
(372, 23746.97, '2018-05-14 14:34:51.000000', 4),
(373, 197961430.35, '2018-05-14 14:34:55.000000', 1),
(374, 16537697.89, '2018-05-14 14:34:55.000000', 2),
(375, 4717420.89, '2018-05-14 14:34:55.000000', 3),
(376, 23746.97, '2018-05-14 14:34:55.000000', 4),
(379, 194059128.88, '2018-05-14 16:23:55.000000', 1),
(380, 16337838.06, '2018-05-14 16:23:55.000000', 2),
(381, 4610844.9, '2018-05-14 16:23:55.000000', 3),
(382, 23110.04, '2018-05-14 16:23:55.000000', 4),
(383, 194059128.88, '2018-05-14 16:24:06.000000', 1),
(384, 16339778.65, '2018-05-14 16:24:06.000000', 2),
(385, 4612785.49, '2018-05-14 16:24:06.000000', 3),
(386, 23110.04, '2018-05-14 16:24:06.000000', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_exchange`
--

CREATE TABLE `general_exchange` (
  `id` int(11) NOT NULL,
  `fromcoin` int(11) NOT NULL,
  `tocoin` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `fromtypecoin_id` int(11) NOT NULL,
  `totypecoin_id` int(11) NOT NULL,
  `userid_id` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_exchange`
--

INSERT INTO `general_exchange` (`id`, `fromcoin`, `tocoin`, `time`, `fromtypecoin_id`, `totypecoin_id`, `userid_id`, `status`) VALUES
(1, 1, 10, '2018-05-13 16:17:39.000000', 1, 2, '6314826F0A', 1),
(2, 11, 10, '2018-05-13 16:18:51.000000', 4, 3, '6314826F0A', 0),
(3, 11, 100, '2018-05-13 16:18:59.000000', 1, 3, '6314826F0A', 0),
(4, 10, 100, '2018-05-13 16:19:08.000000', 2, 3, '6314826F0A', 1),
(5, 150, 10, '2018-05-13 16:19:56.000000', 3, 2, '5248CB4C2B', 1),
(6, 15, 16, '2018-05-13 16:20:05.000000', 3, 1, '5248CB4C2B', 0),
(7, 55, 16, '2018-05-13 16:20:10.000000', 3, 4, '5248CB4C2B', 0),
(8, 55, 16, '2018-05-13 16:24:14.000000', 1, 4, '5248CB4C2B', 0),
(10, 15, 1, '2018-05-13 18:44:16.000000', 2, 1, '5248CB4C2B', 1),
(11, 5, 16, '2018-05-13 18:48:41.000000', 2, 4, '5248CB4C2B', 0),
(12, 50, 16, '2018-05-13 18:48:50.000000', 2, 1, '5248CB4C2B', 0),
(13, 50, 6, '2018-05-13 18:49:26.000000', 2, 4, '5248CB4C2B', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_matchexchange`
--

CREATE TABLE `general_matchexchange` (
  `id` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `fromexchange_id` int(11) NOT NULL,
  `toexchange_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_matchexchange`
--

INSERT INTO `general_matchexchange` (`id`, `time`, `fromexchange_id`, `toexchange_id`) VALUES
(1, '2018-05-15 01:50:07.000000', 1, 10),
(2, '2018-05-15 01:50:07.000000', 4, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_typecoin`
--

CREATE TABLE `general_typecoin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_typecoin`
--

INSERT INTO `general_typecoin` (`id`, `name`) VALUES
(1, 'BTC'),
(2, 'ETH'),
(4, 'USDT'),
(3, 'XMR');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_user`
--

CREATE TABLE `general_user` (
  `id` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_user`
--

INSERT INTO `general_user` (`id`, `username`, `password`, `name`, `level`) VALUES
('5248CB4C2B', 'tuan', 'sha256$vACUFePs$448c1ed79b78a146104cef2688c89366a3d98010cf068b721cf2313296ae4383', 'Vu Quoc Tuan', 0),
('6314826F0A', 'hieu', 'sha256$XcCWRFUy$d159f2d18abe37c5f82f9c19eb9b736bd74e872c2a93c0b6a304a8cf22db6c27', 'Pham Trong Hieu', 0),
('8840716884', 'hien', 'sha256$9yA1b1U0$a3badc3a0cb44b73a6fd00d197b20bcb960b496033f720c51c8702074231b25a', 'Ha Duc Hien', 0),
('CD879BBD51', 'hiep', 'sha256$IsRypzoc$433030f4dcc256c98820d5dff646fdf2a3bd39a62928a23e1bfd0962ddfe69d6', 'Bach Ngoc Hiep', 0),
('D4AD333121', 'admin', 'sha256$aniMKcN1$3620fdc7abca0acfca7f9cdbcee446c5e353923a1ec9e59e78acca90efea8e7e', 'ADMIN', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `general_usercoin`
--

CREATE TABLE `general_usercoin` (
  `id` int(11) NOT NULL,
  `value` double NOT NULL,
  `coinid_id` int(11) NOT NULL,
  `userid_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `general_usercoin`
--

INSERT INTO `general_usercoin` (`id`, `value`, `coinid_id`, `userid_id`) VALUES
(1, 104.95, 1, '5248CB4C2B'),
(2, 114.6, 2, '5248CB4C2B'),
(3, 480, 3, '5248CB4C2B'),
(4, 90, 4, '5248CB4C2B'),
(5, 64, 1, '6314826F0A'),
(6, 239.5, 2, '6314826F0A'),
(7, 546, 3, '6314826F0A'),
(8, 180, 4, '6314826F0A'),
(9, 30, 1, '8840716884'),
(10, 20, 2, '8840716884'),
(11, 300, 3, '8840716884'),
(12, 170, 4, '8840716884'),
(13, 100, 1, 'CD879BBD51'),
(14, 150, 2, 'CD879BBD51'),
(15, 50, 3, 'CD879BBD51'),
(16, 130, 4, 'CD879BBD51'),
(17, 0.05, 1, 'D4AD333121'),
(18, 0.9, 2, 'D4AD333121'),
(19, 4, 3, 'D4AD333121'),
(20, 0, 4, 'D4AD333121');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `general_chenhlech`
--
ALTER TABLE `general_chenhlech`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `From_To` (`fromtypecoin_id`,`totypecoin_id`),
  ADD KEY `general_chenhlech_totypecoin_id_d25d85a5_fk_general_typecoin_id` (`totypecoin_id`);

--
-- Chỉ mục cho bảng `general_coin`
--
ALTER TABLE `general_coin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_coin_typecoin_id_75dcd5c8_fk_general_typecoin_id` (`typecoin_id`);

--
-- Chỉ mục cho bảng `general_exchange`
--
ALTER TABLE `general_exchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_exchange_fromtypecoin_id_3ff9b30c_fk_general_typecoin_id` (`fromtypecoin_id`),
  ADD KEY `general_exchange_totypecoin_id_fa1bc175_fk_general_typecoin_id` (`totypecoin_id`),
  ADD KEY `general_exchange_userid_id_288f0d74_fk_general_user_id` (`userid_id`);

--
-- Chỉ mục cho bảng `general_matchexchange`
--
ALTER TABLE `general_matchexchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_matchexchang_fromexchange_id_2dd0b2b8_fk_general_e` (`fromexchange_id`),
  ADD KEY `general_matchexchang_toexchange_id_a136781c_fk_general_e` (`toexchange_id`);

--
-- Chỉ mục cho bảng `general_typecoin`
--
ALTER TABLE `general_typecoin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `general_user`
--
ALTER TABLE `general_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `general_usercoin`
--
ALTER TABLE `general_usercoin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_TypeCoin` (`coinid_id`,`userid_id`),
  ADD KEY `general_usercoin_userid_id_291c62b0_fk_general_user_id` (`userid_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT cho bảng `general_chenhlech`
--
ALTER TABLE `general_chenhlech`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT cho bảng `general_coin`
--
ALTER TABLE `general_coin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;
--
-- AUTO_INCREMENT cho bảng `general_exchange`
--
ALTER TABLE `general_exchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT cho bảng `general_matchexchange`
--
ALTER TABLE `general_matchexchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `general_typecoin`
--
ALTER TABLE `general_typecoin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `general_usercoin`
--
ALTER TABLE `general_usercoin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `general_chenhlech`
--
ALTER TABLE `general_chenhlech`
  ADD CONSTRAINT `general_chenhlech_fromtypecoin_id_b0f80067_fk_general_t` FOREIGN KEY (`fromtypecoin_id`) REFERENCES `general_typecoin` (`id`),
  ADD CONSTRAINT `general_chenhlech_totypecoin_id_d25d85a5_fk_general_typecoin_id` FOREIGN KEY (`totypecoin_id`) REFERENCES `general_typecoin` (`id`);

--
-- Các ràng buộc cho bảng `general_coin`
--
ALTER TABLE `general_coin`
  ADD CONSTRAINT `general_coin_typecoin_id_75dcd5c8_fk_general_typecoin_id` FOREIGN KEY (`typecoin_id`) REFERENCES `general_typecoin` (`id`);

--
-- Các ràng buộc cho bảng `general_exchange`
--
ALTER TABLE `general_exchange`
  ADD CONSTRAINT `general_exchange_fromtypecoin_id_3ff9b30c_fk_general_typecoin_id` FOREIGN KEY (`fromtypecoin_id`) REFERENCES `general_typecoin` (`id`),
  ADD CONSTRAINT `general_exchange_totypecoin_id_fa1bc175_fk_general_typecoin_id` FOREIGN KEY (`totypecoin_id`) REFERENCES `general_typecoin` (`id`),
  ADD CONSTRAINT `general_exchange_userid_id_288f0d74_fk_general_user_id` FOREIGN KEY (`userid_id`) REFERENCES `general_user` (`id`);

--
-- Các ràng buộc cho bảng `general_matchexchange`
--
ALTER TABLE `general_matchexchange`
  ADD CONSTRAINT `general_matchexchang_fromexchange_id_2dd0b2b8_fk_general_e` FOREIGN KEY (`fromexchange_id`) REFERENCES `general_exchange` (`id`),
  ADD CONSTRAINT `general_matchexchang_toexchange_id_a136781c_fk_general_e` FOREIGN KEY (`toexchange_id`) REFERENCES `general_exchange` (`id`);

--
-- Các ràng buộc cho bảng `general_usercoin`
--
ALTER TABLE `general_usercoin`
  ADD CONSTRAINT `general_usercoin_coinid_id_a3f4ddda_fk_general_typecoin_id` FOREIGN KEY (`coinid_id`) REFERENCES `general_typecoin` (`id`),
  ADD CONSTRAINT `general_usercoin_userid_id_291c62b0_fk_general_user_id` FOREIGN KEY (`userid_id`) REFERENCES `general_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
