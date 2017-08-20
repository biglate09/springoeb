-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2017 at 06:35 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `springoeb`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_no` int(8) NOT NULL,
  `username` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_no`, `username`) VALUES
(1, 'OrderEatBill');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_no` int(8) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_tel` varchar(20) DEFAULT NULL,
  `emp_gender` varchar(1) NOT NULL,
  `emp_type` varchar(30) NOT NULL,
  `pay_type` varchar(30) NOT NULL,
  `pay` double(8,2) NOT NULL,
  `bg_color` varchar(50) NOT NULL,
  `font_color` varchar(50) NOT NULL,
  `branch_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_no`, `emp_name`, `emp_tel`, `emp_gender`, `emp_type`, `pay_type`, `pay`, `bg_color`, `font_color`, `branch_no`) VALUES
(1, 'เบนซ์', '', 'F', '2', '1', 40.00, '#ff6c87', '#170404', 1),
(2, 'น้ำฝน', '', 'F', '2', '1', 35.00, '', '', 1),
(7, 'บีม', '', 'F', '2', '1', 35.00, '#ff984e', '#1c0505', 1),
(8, 'อาย', '', 'F', '2', '1', 35.00, '#1bde0a', '#260404', 1),
(11, 'เนนนี่', '', 'F', '2', '1', 30.00, '#ff9ab8', '#050000', 1),
(13, 'Amanicha', '', 'F', '1', '2', 300.00, '', '', 1),
(14, 'KayOrmma', '', 'F', '1', '2', 485.00, '', '', 1),
(16, 'เอิร์น', '', 'F', '2', '1', 35.00, '#b182c7', '#210303', 1),
(17, 'ไพริน', '', 'F', '2', '1', 35.00, '#9ac1de', '#210d0d', 1),
(18, 'เบส', '', 'M', '2', '1', 37.00, '#7686d9', '#0d0101', 1),
(19, 'เต้', '', 'M', '2', '1', 35.00, '', '', 1),
(22, 'นนท์', '', 'M', '2', '1', 30.00, '#f0f0f0', '#1f0d0d', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_pay`
--

CREATE TABLE `employee_pay` (
  `emp_pay_no` int(8) NOT NULL,
  `pay` double(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `emp_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employee_pay`
--

INSERT INTO `employee_pay` (`emp_pay_no`, `pay`, `date`, `emp_no`) VALUES
(2, 840.00, '2017-07-09 07:03:01', 2),
(3, 490.00, '2017-07-09 07:07:45', 7),
(4, 735.00, '2017-07-09 09:06:43', 16),
(6, 3219.00, '2017-07-10 08:16:31', 1),
(7, 1095.00, '2017-07-10 08:19:01', 11),
(9, 1165.00, '2017-07-10 08:24:22', 18),
(10, 490.00, '2017-07-10 08:25:16', 17),
(11, 227.00, '2017-07-10 08:27:19', 19),
(13, 2000.00, '2017-07-10 08:29:49', 13),
(14, 840.00, '2017-07-15 11:47:05', 19),
(15, 254.00, '2017-07-16 07:43:59', 19),
(16, 2614.00, '2017-07-16 07:51:15', 1),
(17, 1286.00, '2017-07-16 07:53:46', 16),
(19, 622.00, '2017-07-16 07:55:46', 11),
(20, 455.00, '2017-07-16 07:58:38', 17),
(21, 262.00, '2017-07-16 08:09:05', 8),
(22, 507.00, '2017-07-16 13:29:47', 7),
(23, 543.00, '2017-07-17 02:55:07', 7),
(24, 298.00, '2017-07-17 02:55:22', 8),
(25, 574.00, '2017-07-17 04:35:32', 18),
(26, 490.00, '2017-07-22 09:55:24', 8),
(27, 805.00, '2017-07-22 09:56:37', 7),
(28, 577.75, '2017-07-22 12:33:01', 19),
(29, 1010.00, '2017-07-22 12:37:46', 22),
(30, 3368.50, '2017-07-23 12:35:30', 1),
(31, 945.00, '2017-07-23 12:38:40', 16),
(32, 507.00, '2017-07-23 13:01:02', 17),
(33, 705.50, '2017-07-23 13:03:59', 11),
(35, 805.00, '2017-07-29 08:06:18', 17),
(36, 822.00, '2017-07-30 08:09:56', 19),
(38, 980.00, '2017-07-30 08:54:05', 16),
(39, 2840.00, '2017-07-30 08:59:52', 1),
(40, 1347.00, '2017-07-30 09:01:32', 7),
(41, 997.00, '2017-07-30 09:03:25', 8),
(42, 525.00, '2017-08-01 03:51:04', 7),
(43, 473.00, '2017-08-01 03:51:17', 8),
(44, 1054.00, '2017-08-01 06:20:04', 18),
(45, 14065.00, '2017-08-01 06:31:45', 14),
(46, 7000.00, '2017-08-03 09:53:40', 13),
(48, 280.00, '2017-08-05 06:16:43', 17),
(49, 787.00, '2017-08-05 06:17:50', 16),
(50, 1200.00, '2017-08-06 03:40:47', 22),
(51, 980.00, '2017-08-06 03:43:50', 19),
(52, 1240.00, '2017-08-06 08:35:34', 18),
(53, 755.00, '2017-08-06 08:40:33', 11),
(54, 2060.00, '2017-08-06 08:41:27', 1),
(55, 3000.00, '2017-08-20 13:10:38', 14),
(56, 200.00, '2017-08-20 13:10:52', 11),
(57, 2000.00, '2017-08-20 22:28:35', 13);

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `emp_pos_no` int(8) NOT NULL,
  `emp_pos_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employee_position`
--

INSERT INTO `employee_position` (`emp_pos_no`, `emp_pos_name`) VALUES
(2, 'All'),
(3, 'Bar'),
(4, 'เคาท์เตอร์'),
(5, 'ครัว'),
(6, 'ติ่มซำ'),
(7, 'เสิร์ฟ'),
(8, 'Manage');

-- --------------------------------------------------------

--
-- Table structure for table `employee_table`
--

CREATE TABLE `employee_table` (
  `emp_time_no` int(8) NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `emp_pos_no` int(8) DEFAULT NULL,
  `emp_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_table`
--

INSERT INTO `employee_table` (`emp_time_no`, `date`, `time_start`, `time_end`, `emp_pos_no`, `emp_no`) VALUES
(1, '2017-07-03', '08:00:00', '22:00:00', 2, 1),
(7, '2017-07-04', '00:00:00', '00:00:00', 2, 1),
(8, '2017-07-04', '00:00:00', '00:00:00', 2, 7),
(9, '2017-07-04', '00:00:00', '00:00:00', 2, 8),
(10, '2017-07-15', '00:00:00', '00:00:00', 6, 1),
(11, '2017-07-15', '00:00:00', '00:00:00', 4, 16),
(12, '2017-07-15', '00:00:00', '00:00:00', 3, 11),
(15, '2017-07-15', '13:00:00', '13:00:00', 4, 7),
(16, '2017-07-15', '13:00:00', '13:00:00', 3, 1),
(17, '2017-07-15', '13:00:00', '13:00:00', 7, 8),
(18, '2017-07-15', '00:00:00', '00:00:00', 2, 1),
(21, '2017-07-20', '18:00:00', '18:00:00', 2, 1),
(22, '2017-07-20', '18:00:00', '18:00:00', 2, 18),
(23, '2017-07-16', '00:00:00', '00:00:00', 5, 18),
(24, '2017-07-17', '18:00:00', '18:00:00', 2, 1),
(25, '2017-07-17', '00:00:00', '00:00:00', 2, 18),
(26, '2017-07-17', '13:00:00', '13:00:00', 2, 17),
(27, '2017-07-18', '00:00:00', '00:00:00', 2, 1),
(29, '2017-07-18', '13:00:00', '13:00:00', 2, 11),
(30, '2017-07-18', '13:00:00', '13:00:00', 2, 7),
(31, '2017-07-19', '00:00:00', '00:00:00', 2, 19),
(33, '2017-07-19', '13:00:00', '13:00:00', 2, 11),
(34, '2017-07-19', '13:00:00', '13:00:00', 2, 7),
(35, '2017-07-19', '13:00:00', '13:00:00', 2, 16),
(36, '2017-07-21', '18:00:00', '18:00:00', 2, 1),
(37, '2017-07-21', '00:00:00', '00:00:00', 2, 8),
(38, '2017-07-21', '13:00:00', '13:00:00', 2, 22),
(39, '2017-07-21', '13:00:00', '13:00:00', 2, 7),
(40, '2017-07-22', '00:00:00', '00:00:00', 5, 1),
(41, '2017-07-22', '00:00:00', '00:00:00', 4, 7),
(42, '2017-07-22', '00:00:00', '00:00:00', 3, 11),
(43, '2017-07-22', '00:00:00', '00:00:00', 7, 8),
(44, '2017-07-22', '13:00:00', '13:00:00', 4, 16),
(45, '2017-07-22', '13:00:00', '13:00:00', 3, 1),
(46, '2017-07-22', '13:00:00', '13:00:00', 5, 22),
(48, '2017-07-23', '18:00:00', '18:00:00', 4, 17),
(49, '2017-07-23', '13:00:00', '13:00:00', 3, 11),
(50, '2017-07-23', '18:00:00', '18:00:00', 5, 1),
(51, '2017-07-23', '00:00:00', '00:00:00', 5, 18),
(52, '2017-07-23', '18:00:00', '18:00:00', 7, 16),
(53, '2017-07-26', '18:00:00', '18:00:00', 2, 1),
(54, '2017-07-27', '18:00:00', '18:00:00', 2, 1),
(56, '2017-07-29', '18:00:00', '18:00:00', 3, 1),
(57, '2017-07-30', '18:00:00', '18:00:00', 3, 1),
(58, '2017-07-26', '13:00:00', '13:00:00', 2, 16),
(59, '2017-07-24', '00:00:00', '00:00:00', 2, 16),
(60, '2017-07-29', '00:00:00', '00:00:00', 7, 17),
(61, '2017-07-29', '00:00:00', '00:00:00', 4, 7),
(62, '2017-07-29', '13:00:00', '13:00:00', 4, 8),
(65, '2017-07-27', '00:00:00', '00:00:00', 2, 7),
(66, '2017-07-28', '00:00:00', '00:00:00', 7, 16),
(67, '2017-07-25', '00:00:00', '00:00:00', 2, 16),
(69, '2017-07-25', '13:00:00', '13:00:00', 2, 7),
(70, '2017-07-25', '13:00:00', '13:00:00', 2, 11),
(71, '2017-07-28', '13:00:00', '13:00:00', 4, 8),
(72, '2017-07-28', '00:00:00', '00:00:00', 4, 17),
(74, '2017-07-24', '13:00:00', '13:00:00', 2, 7),
(75, '2017-07-24', '00:00:00', '00:00:00', 2, 17),
(76, '2017-07-24', '13:00:00', '13:00:00', 2, 11),
(78, '2017-07-30', '13:00:00', '13:00:00', 4, 7),
(79, '2017-07-30', '18:00:00', '18:00:00', 7, 8),
(81, '2017-07-28', '13:00:00', '13:00:00', 5, 22),
(82, '2017-07-28', '18:00:00', '18:00:00', 3, 1),
(83, '2017-07-29', '13:00:00', '13:00:00', 5, 22),
(85, '2017-07-30', '13:00:00', '13:00:00', 5, 22),
(86, '2017-07-30', '00:00:00', '00:00:00', 4, 7),
(87, '2017-07-30', '00:00:00', '00:00:00', 5, 19),
(88, '2017-07-28', '00:00:00', '00:00:00', 5, 19),
(89, '2017-07-29', '00:00:00', '00:00:00', 5, 19),
(91, '2017-08-01', '00:00:00', '00:00:00', 2, 8),
(92, '2017-08-01', '00:00:00', '00:00:00', 2, 7),
(93, '2017-08-01', '13:00:00', '13:00:00', 2, 19),
(94, '2017-08-01', '13:00:00', '13:00:00', 2, 11),
(95, '2017-08-01', '00:00:00', '00:00:00', 2, 14),
(96, '2017-08-01', '00:00:00', '00:00:00', 2, 13),
(97, '2017-08-02', '00:00:00', '00:00:00', 2, 14),
(98, '2017-08-02', '00:00:00', '00:00:00', 2, 13),
(99, '2017-08-02', '00:00:00', '00:00:00', 2, 18),
(100, '2017-08-02', '18:00:00', '18:00:00', 2, 1),
(101, '2017-08-02', '00:00:00', '00:00:00', 2, 11),
(102, '2017-08-02', '13:00:00', '13:00:00', 2, 16),
(103, '2017-08-03', '00:00:00', '00:00:00', 2, 1),
(104, '2017-08-03', '00:00:00', '00:00:00', 2, 19),
(105, '2017-08-03', '13:00:00', '13:00:00', 2, 18),
(106, '2017-08-03', '00:00:00', '00:00:00', 2, 13),
(107, '2017-08-03', '00:00:00', '00:00:00', 2, 14),
(108, '2017-08-04', '18:00:00', '18:00:00', 2, 1),
(109, '2017-08-04', '00:00:00', '00:00:00', 2, 16),
(110, '2017-08-04', '00:00:00', '00:00:00', 2, 22),
(111, '2017-08-04', '13:00:00', '13:00:00', 2, 18),
(112, '2017-08-04', '00:00:00', '00:00:00', 2, 14),
(113, '2017-08-04', '00:00:00', '00:00:00', 2, 13),
(114, '2017-08-05', '00:00:00', '00:00:00', 4, 17),
(115, '2017-08-05', '18:00:00', '18:00:00', 3, 1),
(116, '2017-08-05', '00:00:00', '00:00:00', 5, 19),
(117, '2017-08-05', '00:00:00', '00:00:00', 7, 16),
(118, '2017-08-05', '18:00:00', '18:00:00', 2, 13),
(119, '2017-08-05', '18:00:00', '18:00:00', 2, 14),
(120, '2017-08-05', '13:00:00', '13:00:00', 7, 18),
(121, '2017-08-05', '13:00:00', '13:00:00', 5, 22),
(122, '2017-08-06', '00:00:00', '00:00:00', 3, 1),
(123, '2017-08-06', '13:00:00', '13:00:00', 4, 1),
(124, '2017-08-06', '13:00:00', '13:00:00', 3, 11),
(125, '2017-08-06', '00:00:00', '00:00:00', 5, 19),
(126, '2017-08-06', '18:00:00', '18:00:00', 7, 18),
(127, '2017-08-06', '13:00:00', '13:00:00', 5, 22),
(128, '2017-08-06', '18:00:00', '18:00:00', 2, 14),
(129, '2017-08-06', '18:00:00', '18:00:00', 2, 13);

-- --------------------------------------------------------

--
-- Table structure for table `material_category`
--

CREATE TABLE `material_category` (
  `mat_cat_no` int(11) NOT NULL,
  `mat_cat_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_category`
--

INSERT INTO `material_category` (`mat_cat_no`, `mat_cat_name`) VALUES
(8, 'ผัก/ผลไม้'),
(11, 'เนื้อสัตว์');

-- --------------------------------------------------------

--
-- Table structure for table `material_item`
--

CREATE TABLE `material_item` (
  `mat_item_no` int(11) NOT NULL,
  `mat_item_name` varchar(200) NOT NULL,
  `mat_cat_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_item`
--

INSERT INTO `material_item` (`mat_item_no`, `mat_item_name`, `mat_cat_no`) VALUES
(6, 'หมูสับทรงเครื่อง', 11);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_no` int(8) NOT NULL,
  `menu_name_TH` varchar(200) NOT NULL,
  `menu_name_EN` varchar(200) NOT NULL,
  `menu_desc` varchar(500) NOT NULL,
  `menu_price` double(20,2) NOT NULL,
  `menu_pic_path` varchar(500) NOT NULL,
  `menu_group_no` int(8) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_no`, `menu_name_TH`, `menu_name_EN`, `menu_desc`, `menu_price`, `menu_pic_path`, `menu_group_no`, `available`) VALUES
(18, 'ข้าวโพดอ่อนแต้มหน้าหมู', 'Baby Corn Served on Steamed Pork', ' หมูสับพันข้าวโพดอ่อน แต้มหน้าด้วยแครอทเล็กน้อย 2 ชิ้นจ้า', 25.00, '1502879392778Dimsum_Baby_Corn1.jpg', 39, 0),
(19, 'ซี่โครงหมูเต้าซี่', 'Blackbean Garlic Sauce Steamed Pork', 'ซี่โครงหมูเต้าซี่อบรมควัน เสิร์ฟพร้อมกับถั่วดำ กระเทียม และซอสสูตรพิเศษ', 30.00, '1502626001096Dimsum_Blackbean_Garlic1.jpg', 37, 1),
(20, 'บร็อคโคลี่ไส้กุ้ง', 'Broccoli served on Steamed Shrimp', 'กุ้งนึ่งพันกับบร็อคโคลี่ แต้มหน้าด้วยแครอทเล็กน้อยเพื่อความสวยงาม กุ้งสดหวานรอให้คุณลิ้มลอง', 30.00, '1502566772064Dimsum_Broccoli1.jpg', 39, 1),
(21, 'กะหล่ำห่อกุ้งปูอัด', 'Steamed Cabbage Roll Stuffed with Shrimp', 'กะหล่ำห่อกุ้งธรรมดาๆ แต่รสชาติอร่อยถูกปาก อย่าบอกใคร', 30.00, '1502566881515Dimsum_Cabbage_Rolls1.jpg', 39, 1),
(22, 'ขนมจีบปู', 'Crab Chinese Steamed Dumpling', 'ขนมจีบปูธรรมดา แต่เดี๋ยวก่อนมีอะไรเด็ดกว่านั้น อยากรู้ต้องลิ้มลอง', 30.00, '1502567070801Dimsum_Crab_Dumpling1.jpg', 39, 1),
(23, 'ซาลาเปาไส้ครีม', 'Sweet Cream Bun', 'ซาลาเปาไส้ครีมแสนอร่อย เป็นของหวานในร่างของคาว', 30.00, '1502567151197Dimsum_Custard_Bun1.jpg', 40, 0),
(24, 'ปลาหมึกกระดองแต้มหน้าหมูสับสามชั้น', 'Cuttlefish served on Steamed Pork', 'สูตรใหม่ สูตรเด็ดของทางร้าน', 30.00, '1502629141929Dimsum_Cuttleffish1.jpg', 39, 0),
(25, 'ไข่แดงแต้มหน้าหมูสับ', 'Egg Yolk on Steamed Pork', 'เฉยๆ เรียบๆ แต่หวาน มัน อร่อย ครบรส', 30.00, '1502567329494Dimsum_Egg_Yolk1.jpg', 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `menu_cat_no` int(8) NOT NULL,
  `menu_cat_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`menu_cat_no`, `menu_cat_name`) VALUES
(1, 'อาหาร'),
(3, 'ของหวาน'),
(4, 'อื่นๆ'),
(6, 'เครื่องดื่ม');

-- --------------------------------------------------------

--
-- Table structure for table `menu_group`
--

CREATE TABLE `menu_group` (
  `menu_group_no` int(8) NOT NULL,
  `menu_group_name_TH` varchar(200) NOT NULL,
  `menu_group_name_EN` varchar(200) NOT NULL,
  `menu_cat_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_group`
--

INSERT INTO `menu_group` (`menu_group_no`, `menu_group_name_TH`, `menu_group_name_EN`, `menu_cat_no`) VALUES
(37, 'บิงซู', 'Bing-soo', 3),
(39, 'ติ่มซำ', 'Dim sum', 4),
(40, 'ซาลาเปา', 'Pao Bun', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_set`
--

CREATE TABLE `menu_set` (
  `menu_set_no` int(8) NOT NULL,
  `menu_set_name_TH` varchar(200) NOT NULL,
  `menu_set_name_EN` varchar(200) NOT NULL,
  `menu_set_desc` varchar(500) NOT NULL,
  `menu_set_price` double(20,2) NOT NULL,
  `menu_set_pic_path` varchar(500) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_set`
--

INSERT INTO `menu_set` (`menu_set_no`, `menu_set_name_TH`, `menu_set_name_EN`, `menu_set_desc`, `menu_set_price`, `menu_set_pic_path`, `available`) VALUES
(56, 'หมูเต็มๆ', 'Only Pig', 'เซตนี้มีแต่หมูนะคะ อิอิ', 99.00, '1503139018071Dimsum_Baby_Corn1.jpg', 1),
(57, 'เซตอะไรวะ', 'Set Arai Wa', 'รายละเอียดจ้า', 108.00, '1503131401074Dimsum_Cabbage_Rolls1.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_set_menu`
--

CREATE TABLE `menu_set_menu` (
  `menu_set_no` int(8) NOT NULL,
  `menu_no` int(8) NOT NULL,
  `amount` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_set_menu`
--

INSERT INTO `menu_set_menu` (`menu_set_no`, `menu_no`, `amount`) VALUES
(56, 18, 2),
(56, 24, 2),
(57, 20, 2),
(57, 21, 2);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_no` int(11) NOT NULL,
  `promotion_name` varchar(200) NOT NULL,
  `promotion_desc` varchar(1000) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('OrderEatBill', '$2a$10$ObZ9UEYRsdJqrXM.zc8swu4jvyhzaHSp6zsvCH2FlMiLG3c9FIAzu');

-- --------------------------------------------------------

--
-- Table structure for table `work_history`
--

CREATE TABLE `work_history` (
  `work_hist_no` int(8) NOT NULL,
  `work_date` date NOT NULL,
  `work_pay` double(8,2) DEFAULT NULL,
  `work_hour` int(11) DEFAULT NULL,
  `work_min` int(8) DEFAULT NULL,
  `emp_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `work_history`
--

INSERT INTO `work_history` (`work_hist_no`, `work_date`, `work_pay`, `work_hour`, `work_min`, `emp_no`) VALUES
(1, '2017-07-02', 485.00, 15, 0, 14),
(2, '2017-07-02', 300.00, 15, 0, 13),
(5, '2017-07-02', 333.00, 9, 0, 18),
(7, '2017-07-02', 573.50, 15, 30, 1),
(9, '2017-07-03', 407.00, 11, 0, 1),
(10, '2017-07-03', 245.00, 7, 0, 7),
(12, '2017-07-03', 300.00, 5, 0, 13),
(13, '2017-07-03', 485.00, 5, 0, 14),
(14, '2017-07-04', 245.00, 7, 0, 7),
(17, '2017-07-04', 240.50, 6, 30, 1),
(18, '2017-07-04', 485.00, 5, 0, 14),
(19, '2017-07-04', 300.00, 5, 0, 13),
(20, '2017-07-05', 499.50, 13, 30, 1),
(23, '2017-07-05', 485.00, 7, 0, 14),
(24, '2017-07-05', 300.00, 7, 0, 13),
(25, '2017-07-06', 481.00, 13, 0, 1),
(27, '2017-07-06', 227.50, 6, 30, 2),
(28, '2017-07-06', 227.50, 6, 30, 19),
(29, '2017-07-06', 485.00, 5, 0, 14),
(30, '2017-07-06', 300.00, 5, 0, 13),
(31, '2017-07-07', 129.50, 3, 30, 1),
(33, '2017-07-07', 405.00, 13, 30, 11),
(35, '2017-07-07', 262.50, 7, 30, 16),
(36, '2017-07-07', 300.00, 6, 0, 13),
(37, '2017-07-07', 485.00, 6, 0, 14),
(39, '2017-07-08', 240.00, 8, 0, 11),
(41, '2017-07-08', 314.50, 8, 30, 18),
(42, '2017-07-08', 332.50, 9, 30, 2),
(43, '2017-07-08', 351.50, 9, 30, 1),
(44, '2017-07-08', 485.00, 5, 0, 14),
(45, '2017-07-08', 300.00, 5, 0, 13),
(46, '2017-07-09', 280.00, 8, 0, 2),
(48, '2017-07-04', 227.50, 6, 30, 16),
(49, '2017-07-06', 245.00, 7, 0, 16),
(50, '2017-07-02', 315.00, 9, 0, 16),
(51, '2017-07-10', 245.00, 7, 0, 17),
(52, '2017-07-09', 450.00, 15, 0, 11),
(53, '2017-07-09', 536.50, 14, 30, 1),
(55, '2017-07-09', 245.00, 7, 0, 17),
(56, '2017-07-09', 300.00, 5, 0, 13),
(57, '2017-07-09', 485.00, 5, 0, 14),
(58, '2017-07-09', 518.00, 14, 0, 18),
(61, '2017-07-10', 227.50, 6, 30, 17),
(62, '2017-07-10', 536.50, 14, 30, 1),
(63, '2017-07-10', 297.50, 8, 30, 19),
(64, '2017-07-10', 300.00, 5, 0, 13),
(65, '2017-07-10', 485.00, 5, 0, 14),
(66, '2017-07-11', 462.50, 12, 30, 1),
(68, '2017-07-11', 192.50, 5, 30, 19),
(69, '2017-07-11', 485.00, 5, 0, 14),
(70, '2017-07-11', 300.00, 5, 0, 13),
(71, '2017-07-12', 308.33, 8, 20, 1),
(72, '2017-07-12', 350.00, 10, 0, 19),
(73, '2017-07-12', 195.00, 6, 30, 11),
(74, '2017-07-12', 227.50, 6, 30, 16),
(77, '2017-07-12', 300.00, 2, 0, 13),
(78, '2017-07-12', 485.00, 2, 0, 14),
(80, '2017-07-13', 234.33, 6, 20, 1),
(81, '2017-07-13', 218.75, 6, 15, 16),
(82, '2017-07-13', 187.50, 6, 15, 11),
(83, '2017-07-13', 485.00, 2, 0, 14),
(84, '2017-07-13', 300.00, 2, 0, 13),
(85, '2017-07-14', 245.00, 7, 0, 16),
(86, '2017-07-14', 499.50, 13, 30, 1),
(87, '2017-07-14', 245.00, 7, 0, 7),
(88, '2017-07-14', 485.00, 2, 0, 14),
(89, '2017-07-14', 300.00, 2, 0, 13),
(90, '2017-07-13', 253.75, 7, 15, 19),
(91, '2017-07-15', 280.00, 8, 0, 16),
(92, '2017-07-15', 573.50, 15, 30, 1),
(93, '2017-07-15', 262.50, 7, 30, 7),
(94, '2017-07-15', 262.50, 7, 30, 8),
(96, '2017-07-15', 240.00, 8, 0, 11),
(97, '2017-07-15', 225.00, 7, 30, 22),
(98, '2017-07-16', 227.50, 6, 30, 17),
(99, '2017-07-15', 485.00, 2, 0, 14),
(100, '2017-07-15', 300.00, 2, 0, 13),
(101, '2017-07-16', 573.50, 15, 30, 18),
(102, '2017-07-16', 542.50, 15, 30, 7),
(103, '2017-07-16', 450.00, 15, 0, 22),
(104, '2017-07-16', 297.50, 8, 30, 8),
(105, '2017-07-16', 485.00, 3, 0, 14),
(106, '2017-07-16', 300.00, 3, 0, 13),
(107, '2017-07-16', 573.50, 15, 30, 1),
(108, '2017-07-17', 536.50, 14, 30, 1),
(109, '2017-07-17', 70.00, 2, 0, 17),
(110, '2017-07-17', 259.00, 7, 0, 18),
(111, '2017-07-17', 192.50, 5, 30, 19),
(112, '2017-07-18', 259.00, 7, 0, 1),
(113, '2017-07-18', 192.50, 5, 30, 7),
(115, '2017-07-18', 165.00, 5, 30, 11),
(116, '2017-07-19', 245.00, 7, 0, 16),
(117, '2017-07-19', 245.00, 7, 0, 19),
(118, '2017-07-19', 175.00, 5, 0, 7),
(120, '2017-07-19', 150.00, 5, 0, 11),
(121, '2017-07-20', 518.00, 14, 0, 1),
(122, '2017-07-20', 518.00, 14, 0, 18),
(123, '2017-07-21', 481.00, 13, 0, 1),
(124, '2017-07-21', 195.00, 6, 30, 22),
(125, '2017-07-21', 227.50, 6, 30, 7),
(126, '2017-07-21', 227.50, 6, 30, 8),
(130, '2017-07-22', 210.00, 6, 0, 7),
(131, '2017-07-22', 262.50, 7, 30, 8),
(133, '2017-07-22', 240.00, 8, 0, 11),
(134, '2017-07-17', 300.00, 2, 0, 13),
(135, '2017-07-17', 485.00, 2, 0, 14),
(136, '2017-07-18', 485.00, 2, 0, 14),
(137, '2017-07-18', 300.00, 2, 0, 13),
(138, '2017-07-19', 485.00, 2, 0, 14),
(139, '2017-07-19', 300.00, 2, 0, 13),
(140, '2017-07-20', 300.00, 2, 0, 13),
(141, '2017-07-20', 485.00, 2, 0, 14),
(142, '2017-07-21', 300.00, 2, 0, 13),
(143, '2017-07-21', 485.00, 2, 0, 14),
(144, '2017-07-22', 140.00, 4, 0, 19),
(146, '2017-07-22', 140.00, 4, 40, 22),
(147, '2017-07-22', 262.50, 7, 30, 16),
(148, '2017-07-22', 520.00, 13, 0, 1),
(149, '2017-07-23', 437.50, 12, 30, 16),
(150, '2017-07-23', 437.50, 12, 30, 17),
(151, '2017-07-23', 480.00, 12, 0, 1),
(152, '2017-07-23', 277.50, 7, 30, 18),
(153, '2017-07-23', 150.00, 5, 0, 11),
(154, '2017-07-23', 300.00, 2, 0, 13),
(155, '2017-07-23', 485.00, 2, 0, 14),
(156, '2017-07-24', 245.00, 7, 0, 16),
(157, '2017-07-24', 245.00, 7, 0, 17),
(158, '2017-07-24', 175.00, 5, 0, 7),
(159, '2017-07-24', 150.00, 5, 0, 11),
(160, '2017-07-25', 245.00, 7, 0, 16),
(161, '2017-07-25', 192.50, 5, 30, 7),
(163, '2017-07-25', 165.00, 5, 30, 11),
(164, '2017-07-26', 210.00, 6, 0, 16),
(165, '2017-07-26', 520.00, 13, 0, 1),
(167, '2017-07-27', 560.00, 14, 0, 1),
(168, '2017-07-27', 245.00, 7, 0, 7),
(170, '2017-07-28', 280.00, 8, 0, 16),
(171, '2017-07-28', 280.00, 8, 0, 17),
(172, '2017-07-28', 600.00, 15, 0, 1),
(173, '2017-07-28', 280.00, 8, 0, 19),
(174, '2017-07-28', 225.00, 7, 30, 22),
(175, '2017-07-28', 262.50, 7, 30, 8),
(178, '2017-07-29', 280.00, 8, 0, 17),
(179, '2017-07-29', 280.00, 8, 0, 19),
(181, '2017-07-29', 280.00, 8, 0, 7),
(184, '2017-07-29', 640.00, 16, 0, 1),
(185, '2017-07-29', 240.00, 8, 0, 22),
(186, '2017-07-29', 280.00, 8, 0, 8),
(189, '2017-07-30', 262.50, 7, 30, 19),
(195, '2017-07-30', 150.00, 5, 0, 22),
(196, '2017-07-30', 455.00, 13, 0, 7),
(197, '2017-07-30', 455.00, 13, 0, 8),
(200, '2017-07-24', 300.00, 5, 0, 13),
(201, '2017-07-24', 485.00, 5, 0, 14),
(202, '2017-07-25', 300.00, 5, 0, 13),
(203, '2017-07-25', 485.00, 5, 0, 14),
(204, '2017-07-26', 485.00, 5, 0, 14),
(205, '2017-07-26', 300.00, 5, 0, 13),
(206, '2017-07-27', 485.00, 4, 0, 14),
(207, '2017-07-27', 300.00, 4, 0, 13),
(208, '2017-07-26', 300.00, 5, 0, 13),
(212, '2017-07-28', 300.00, 5, 0, 13),
(213, '2017-07-28', 485.00, 5, 0, 14),
(214, '2017-07-29', 485.00, 4, 0, 14),
(215, '2017-07-29', 300.00, 4, 0, 13),
(216, '2017-07-30', 300.00, 5, 0, 13),
(217, '2017-07-30', 485.00, 5, 0, 14),
(218, '2017-07-31', 280.00, 8, 0, 7),
(219, '2017-07-31', 227.50, 6, 30, 8),
(220, '2017-07-31', 192.50, 5, 30, 19),
(221, '2017-07-31', 120.00, 4, 0, 11),
(222, '2017-07-31', 300.00, 4, 0, 13),
(223, '2017-07-31', 485.00, 4, 0, 14),
(224, '2017-08-01', 245.00, 7, 0, 8),
(225, '2017-08-01', 245.00, 7, 0, 7),
(227, '2017-08-01', 180.00, 6, 0, 11),
(228, '2017-08-01', 300.00, 2, 0, 13),
(229, '2017-08-01', 485.00, 2, 0, 14),
(230, '2017-08-02', 262.50, 7, 30, 16),
(231, '2017-08-02', 400.00, 10, 0, 1),
(232, '2017-08-02', 259.00, 7, 0, 18),
(233, '2017-08-02', 140.00, 4, 40, 11),
(234, '2017-08-02', 300.00, 2, 0, 13),
(235, '2017-08-02', 485.00, 2, 0, 14),
(236, '2017-08-03', 540.00, 13, 30, 1),
(237, '2017-08-03', 259.00, 7, 0, 18),
(238, '2017-08-03', 227.50, 6, 30, 19),
(239, '2017-08-03', 300.00, 2, 0, 13),
(240, '2017-08-03', 485.00, 2, 0, 14),
(241, '2017-08-04', 245.00, 7, 0, 16),
(242, '2017-08-04', 570.00, 14, 15, 1),
(243, '2017-08-04', 268.25, 7, 15, 18),
(244, '2017-08-04', 187.50, 6, 15, 22),
(245, '2017-08-04', 300.00, 2, 0, 13),
(246, '2017-08-04', 485.00, 2, 0, 14),
(247, '2017-08-05', 280.00, 8, 0, 16),
(248, '2017-08-05', 280.00, 8, 0, 17),
(249, '2017-08-05', 550.00, 13, 45, 1),
(250, '2017-08-05', 138.75, 3, 45, 18),
(251, '2017-08-05', 350.00, 10, 0, 19),
(252, '2017-08-05', 172.50, 5, 45, 22),
(253, '2017-08-05', 300.00, 2, 0, 13),
(254, '2017-08-05', 485.00, 2, 0, 14),
(255, '2017-08-06', 573.33, 14, 20, 1),
(256, '2017-08-06', 314.50, 8, 30, 18),
(257, '2017-08-06', 221.67, 6, 20, 19),
(258, '2017-08-06', 225.00, 7, 30, 22),
(259, '2017-08-06', 190.00, 6, 20, 11),
(260, '2017-08-06', 300.00, 5, 0, 13),
(261, '2017-08-06', 485.00, 5, 0, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_no`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_no`),
  ADD KEY `branch_no` (`branch_no`),
  ADD KEY `branch_no_2` (`branch_no`);

--
-- Indexes for table `employee_pay`
--
ALTER TABLE `employee_pay`
  ADD PRIMARY KEY (`emp_pay_no`),
  ADD KEY `emp_no` (`emp_no`),
  ADD KEY `emp_no_2` (`emp_no`);

--
-- Indexes for table `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`emp_pos_no`);

--
-- Indexes for table `employee_table`
--
ALTER TABLE `employee_table`
  ADD PRIMARY KEY (`emp_time_no`),
  ADD KEY `emp_no` (`emp_no`),
  ADD KEY `employee_table_ibfk_2` (`emp_pos_no`);

--
-- Indexes for table `material_category`
--
ALTER TABLE `material_category`
  ADD PRIMARY KEY (`mat_cat_no`);

--
-- Indexes for table `material_item`
--
ALTER TABLE `material_item`
  ADD PRIMARY KEY (`mat_item_no`),
  ADD KEY `mat_cat_no` (`mat_cat_no`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_no`),
  ADD KEY `menuTypeNo` (`menu_group_no`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`menu_cat_no`);

--
-- Indexes for table `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`menu_group_no`),
  ADD KEY `stock_cat_no` (`menu_cat_no`);

--
-- Indexes for table `menu_set`
--
ALTER TABLE `menu_set`
  ADD PRIMARY KEY (`menu_set_no`);

--
-- Indexes for table `menu_set_menu`
--
ALTER TABLE `menu_set_menu`
  ADD PRIMARY KEY (`menu_set_no`,`menu_no`),
  ADD KEY `menu_set_no` (`menu_set_no`,`menu_no`),
  ADD KEY `menu_no` (`menu_no`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `work_history`
--
ALTER TABLE `work_history`
  ADD PRIMARY KEY (`work_hist_no`),
  ADD KEY `emp_no` (`emp_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branch_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `employee_pay`
--
ALTER TABLE `employee_pay`
  MODIFY `emp_pay_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `emp_pos_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `employee_table`
--
ALTER TABLE `employee_table`
  MODIFY `emp_time_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `material_category`
--
ALTER TABLE `material_category`
  MODIFY `mat_cat_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `material_item`
--
ALTER TABLE `material_item`
  MODIFY `mat_item_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menu_cat_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `menu_group_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `menu_set`
--
ALTER TABLE `menu_set`
  MODIFY `menu_set_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_history`
--
ALTER TABLE `work_history`
  MODIFY `work_hist_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`branch_no`) REFERENCES `branch` (`branch_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_pay`
--
ALTER TABLE `employee_pay`
  ADD CONSTRAINT `employee_pay_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_table`
--
ALTER TABLE `employee_table`
  ADD CONSTRAINT `employee_table_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_table_ibfk_2` FOREIGN KEY (`emp_pos_no`) REFERENCES `employee_position` (`emp_pos_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_item`
--
ALTER TABLE `material_item`
  ADD CONSTRAINT `material_item_ibfk_1` FOREIGN KEY (`mat_cat_no`) REFERENCES `material_category` (`mat_cat_no`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_group_no`) REFERENCES `menu_group` (`menu_group_no`);

--
-- Constraints for table `menu_group`
--
ALTER TABLE `menu_group`
  ADD CONSTRAINT `menu_group_ibfk_1` FOREIGN KEY (`menu_cat_no`) REFERENCES `menu_category` (`menu_cat_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_set_menu`
--
ALTER TABLE `menu_set_menu`
  ADD CONSTRAINT `menu_set_menu_ibfk_1` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_set_menu_ibfk_2` FOREIGN KEY (`menu_set_no`) REFERENCES `menu_set` (`menu_set_no`) ON DELETE CASCADE;

--
-- Constraints for table `work_history`
--
ALTER TABLE `work_history`
  ADD CONSTRAINT `work_history_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
