-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2017 at 02:23 PM
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
(0, 'OrderEatBill');

-- --------------------------------------------------------

--
-- Table structure for table `branch_menu`
--

CREATE TABLE `branch_menu` (
  `branchNo` int(11) NOT NULL,
  `menuNo` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'เบนซ์', '', 'F', '2', '1', 40.00, '#ff6c87', '#170404', 0),
(2, 'น้ำฝน', '', 'F', '2', '1', 35.00, '', '', 0),
(7, 'บีม', '', 'F', '2', '1', 35.00, '#ff984e', '#1c0505', 0),
(8, 'อาย', '', 'F', '2', '1', 35.00, '#1bde0a', '#260404', 0),
(11, 'เนนนี่', '', 'F', '2', '1', 30.00, '#ff9ab8', '#050000', 0),
(13, 'Amanicha', '', 'F', '1', '2', 300.00, '', '', 0),
(14, 'KayOrmma', '', 'F', '1', '2', 485.00, '', '', 0),
(16, 'เอิร์น', '', 'F', '2', '1', 35.00, '#b182c7', '#210303', 0),
(17, 'ไพริน', '', 'F', '2', '1', 35.00, '#9ac1de', '#210d0d', 0),
(18, 'เบส', '', 'M', '2', '1', 37.00, '#7686d9', '#0d0101', 0),
(19, 'เต้', '', 'M', '2', '1', 35.00, '', '', 0),
(22, 'นนท์', '', 'M', '2', '1', 30.00, '#f0f0f0', '#1f0d0d', 0);

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
(57, 2000.00, '2017-08-20 22:28:35', 13),
(58, 60.00, '2017-08-21 14:52:52', 1),
(59, 12.00, '2017-08-21 21:33:31', 19),
(60, 1.00, '2017-08-21 21:33:37', 19);

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
(129, '2017-08-06', '18:00:00', '18:00:00', 2, 13),
(132, '2017-08-21', '00:00:00', '00:00:00', 2, 1),
(133, '2017-08-21', '13:00:00', '13:00:00', 2, 11),
(134, '2017-08-21', '18:00:00', '18:00:00', 2, 19),
(135, '2017-08-22', '00:00:00', '00:00:00', 3, 1);

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
  `menu_flag` varchar(1) NOT NULL COMMENT 'M = menu , S = menuset',
  `local_flag` int(11) NOT NULL COMMENT '0 = Official, อื่นๆ = Local อิงตาม BranchNo',
  `menu_group_no` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_no`, `menu_name_TH`, `menu_name_EN`, `menu_desc`, `menu_price`, `menu_pic_path`, `menu_flag`, `local_flag`, `menu_group_no`) VALUES
(26, 'ข้าวโพดอ่อนแต้มหน้าหมู', 'Baby Corn Served on Steamed Pork', 'ข้าวโพดอ่อนแต้มหน้าหมูแสนอร่อย ไม่บันยะบันยัง', 25.00, '1503247257896Dimsum_Baby_Corn1.jpg', 'M', 0, 39),
(27, 'ซาลาเปาไส้ครีม', 'Sweet Cream Bun', 'ซาลาเปาสองลูก อุ่นๆหอมๆ', 30.00, '1503250131279Dimsum_Custard_Bun1.jpg', 'M', 0, 40),
(30, 'vgewgeqgvgregvrewgv3', 'qwgqgwgqwgewvgwegewgvewgvew3', 'btefgre3', 333.00, '1503337307731Dimsum_Cabbage_Rolls1.jpg', 'M', 0, 40),
(31, 'gasgass', 'trbtrr', 'gasgasg', 699.00, '1503339952738Dimsum_Blackbean_Garlic1.jpg', 'S', 0, NULL),
(32, 'gasgas', 'trbtr', 'btrbtr', 123.00, '1503341994254Dimsum_Custard_Bun1.jpg', 'S', 0, NULL);

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
-- Table structure for table `menu_in_set`
--

CREATE TABLE `menu_in_set` (
  `menu_no` int(8) NOT NULL COMMENT 'เมนูเซต',
  `menu_sub_no` int(8) NOT NULL COMMENT 'เมนูเดี่ยว',
  `amount` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_in_set`
--

INSERT INTO `menu_in_set` (`menu_no`, `menu_sub_no`, `amount`) VALUES
(31, 26, 3),
(31, 30, 2),
(32, 26, 1),
(32, 27, 8),
(32, 30, 4);

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_no` int(11) NOT NULL,
  `promotion_name` varchar(200) NOT NULL,
  `promotion_desc` varchar(1000) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `repeat` varchar(3) NOT NULL,
  `available` tinyint(1) NOT NULL
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
  `work_start` time DEFAULT NULL,
  `work_end` time DEFAULT NULL,
  `work_pay` double(8,2) DEFAULT NULL,
  `work_hour` int(11) DEFAULT NULL,
  `work_min` int(8) DEFAULT NULL,
  `emp_no` int(8) NOT NULL,
  `emp_time_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `work_history`
--

INSERT INTO `work_history` (`work_hist_no`, `work_date`, `work_start`, `work_end`, `work_pay`, `work_hour`, `work_min`, `emp_no`, `emp_time_no`) VALUES
(1, '2017-07-02', NULL, NULL, 485.00, 15, 0, 14, NULL),
(2, '2017-07-02', NULL, NULL, 300.00, 15, 0, 13, NULL),
(5, '2017-07-02', NULL, NULL, 333.00, 9, 0, 18, NULL),
(7, '2017-07-02', NULL, NULL, 573.50, 15, 30, 1, NULL),
(9, '2017-07-03', NULL, NULL, 407.00, 11, 0, 1, NULL),
(10, '2017-07-03', NULL, NULL, 245.00, 7, 0, 7, NULL),
(12, '2017-07-03', NULL, NULL, 300.00, 5, 0, 13, NULL),
(13, '2017-07-03', NULL, NULL, 485.00, 5, 0, 14, NULL),
(14, '2017-07-04', NULL, NULL, 245.00, 7, 0, 7, NULL),
(17, '2017-07-04', NULL, NULL, 240.50, 6, 30, 1, NULL),
(18, '2017-07-04', NULL, NULL, 485.00, 5, 0, 14, NULL),
(19, '2017-07-04', NULL, NULL, 300.00, 5, 0, 13, NULL),
(20, '2017-07-05', NULL, NULL, 499.50, 13, 30, 1, NULL),
(23, '2017-07-05', NULL, NULL, 485.00, 7, 0, 14, NULL),
(24, '2017-07-05', NULL, NULL, 300.00, 7, 0, 13, NULL),
(25, '2017-07-06', NULL, NULL, 481.00, 13, 0, 1, NULL),
(27, '2017-07-06', NULL, NULL, 227.50, 6, 30, 2, NULL),
(28, '2017-07-06', NULL, NULL, 227.50, 6, 30, 19, NULL),
(29, '2017-07-06', NULL, NULL, 485.00, 5, 0, 14, NULL),
(30, '2017-07-06', NULL, NULL, 300.00, 5, 0, 13, NULL),
(31, '2017-07-07', NULL, NULL, 129.50, 3, 30, 1, NULL),
(33, '2017-07-07', NULL, NULL, 405.00, 13, 30, 11, NULL),
(35, '2017-07-07', NULL, NULL, 262.50, 7, 30, 16, NULL),
(36, '2017-07-07', NULL, NULL, 300.00, 6, 0, 13, NULL),
(37, '2017-07-07', NULL, NULL, 485.00, 6, 0, 14, NULL),
(39, '2017-07-08', NULL, NULL, 240.00, 8, 0, 11, NULL),
(41, '2017-07-08', NULL, NULL, 314.50, 8, 30, 18, NULL),
(42, '2017-07-08', NULL, NULL, 332.50, 9, 30, 2, NULL),
(43, '2017-07-08', NULL, NULL, 351.50, 9, 30, 1, NULL),
(44, '2017-07-08', NULL, NULL, 485.00, 5, 0, 14, NULL),
(45, '2017-07-08', NULL, NULL, 300.00, 5, 0, 13, NULL),
(46, '2017-07-09', NULL, NULL, 280.00, 8, 0, 2, NULL),
(48, '2017-07-04', NULL, NULL, 227.50, 6, 30, 16, NULL),
(49, '2017-07-06', NULL, NULL, 245.00, 7, 0, 16, NULL),
(50, '2017-07-02', NULL, NULL, 315.00, 9, 0, 16, NULL),
(51, '2017-07-10', NULL, NULL, 245.00, 7, 0, 17, NULL),
(52, '2017-07-09', NULL, NULL, 450.00, 15, 0, 11, NULL),
(53, '2017-07-09', NULL, NULL, 536.50, 14, 30, 1, NULL),
(55, '2017-07-09', NULL, NULL, 245.00, 7, 0, 17, NULL),
(56, '2017-07-09', NULL, NULL, 300.00, 5, 0, 13, NULL),
(57, '2017-07-09', NULL, NULL, 485.00, 5, 0, 14, NULL),
(58, '2017-07-09', NULL, NULL, 518.00, 14, 0, 18, NULL),
(61, '2017-07-10', NULL, NULL, 227.50, 6, 30, 17, NULL),
(62, '2017-07-10', NULL, NULL, 536.50, 14, 30, 1, NULL),
(63, '2017-07-10', NULL, NULL, 297.50, 8, 30, 19, NULL),
(64, '2017-07-10', NULL, NULL, 300.00, 5, 0, 13, NULL),
(65, '2017-07-10', NULL, NULL, 485.00, 5, 0, 14, NULL),
(66, '2017-07-11', NULL, NULL, 462.50, 12, 30, 1, NULL),
(68, '2017-07-11', NULL, NULL, 192.50, 5, 30, 19, NULL),
(69, '2017-07-11', NULL, NULL, 485.00, 5, 0, 14, NULL),
(70, '2017-07-11', NULL, NULL, 300.00, 5, 0, 13, NULL),
(71, '2017-07-12', NULL, NULL, 308.33, 8, 20, 1, NULL),
(72, '2017-07-12', NULL, NULL, 350.00, 10, 0, 19, NULL),
(73, '2017-07-12', NULL, NULL, 195.00, 6, 30, 11, NULL),
(74, '2017-07-12', NULL, NULL, 227.50, 6, 30, 16, NULL),
(77, '2017-07-12', NULL, NULL, 300.00, 2, 0, 13, NULL),
(78, '2017-07-12', NULL, NULL, 485.00, 2, 0, 14, NULL),
(80, '2017-07-13', NULL, NULL, 234.33, 6, 20, 1, NULL),
(81, '2017-07-13', NULL, NULL, 218.75, 6, 15, 16, NULL),
(82, '2017-07-13', NULL, NULL, 187.50, 6, 15, 11, NULL),
(83, '2017-07-13', NULL, NULL, 485.00, 2, 0, 14, NULL),
(84, '2017-07-13', NULL, NULL, 300.00, 2, 0, 13, NULL),
(85, '2017-07-14', NULL, NULL, 245.00, 7, 0, 16, NULL),
(86, '2017-07-14', NULL, NULL, 499.50, 13, 30, 1, NULL),
(87, '2017-07-14', NULL, NULL, 245.00, 7, 0, 7, NULL),
(88, '2017-07-14', NULL, NULL, 485.00, 2, 0, 14, NULL),
(89, '2017-07-14', NULL, NULL, 300.00, 2, 0, 13, NULL),
(90, '2017-07-13', NULL, NULL, 253.75, 7, 15, 19, NULL),
(91, '2017-07-15', NULL, NULL, 280.00, 8, 0, 16, NULL),
(92, '2017-07-15', NULL, NULL, 573.50, 15, 30, 1, NULL),
(93, '2017-07-15', NULL, NULL, 262.50, 7, 30, 7, NULL),
(94, '2017-07-15', NULL, NULL, 262.50, 7, 30, 8, NULL),
(96, '2017-07-15', NULL, NULL, 240.00, 8, 0, 11, NULL),
(97, '2017-07-15', NULL, NULL, 225.00, 7, 30, 22, NULL),
(98, '2017-07-16', NULL, NULL, 227.50, 6, 30, 17, NULL),
(99, '2017-07-15', NULL, NULL, 485.00, 2, 0, 14, NULL),
(100, '2017-07-15', NULL, NULL, 300.00, 2, 0, 13, NULL),
(101, '2017-07-16', NULL, NULL, 573.50, 15, 30, 18, NULL),
(102, '2017-07-16', NULL, NULL, 542.50, 15, 30, 7, NULL),
(103, '2017-07-16', NULL, NULL, 450.00, 15, 0, 22, NULL),
(104, '2017-07-16', NULL, NULL, 297.50, 8, 30, 8, NULL),
(105, '2017-07-16', NULL, NULL, 485.00, 3, 0, 14, NULL),
(106, '2017-07-16', NULL, NULL, 300.00, 3, 0, 13, NULL),
(107, '2017-07-16', NULL, NULL, 573.50, 15, 30, 1, NULL),
(108, '2017-07-17', NULL, NULL, 536.50, 14, 30, 1, NULL),
(109, '2017-07-17', NULL, NULL, 70.00, 2, 0, 17, NULL),
(110, '2017-07-17', NULL, NULL, 259.00, 7, 0, 18, NULL),
(111, '2017-07-17', NULL, NULL, 192.50, 5, 30, 19, NULL),
(112, '2017-07-18', NULL, NULL, 259.00, 7, 0, 1, NULL),
(113, '2017-07-18', NULL, NULL, 192.50, 5, 30, 7, NULL),
(115, '2017-07-18', NULL, NULL, 165.00, 5, 30, 11, NULL),
(116, '2017-07-19', NULL, NULL, 245.00, 7, 0, 16, NULL),
(117, '2017-07-19', NULL, NULL, 245.00, 7, 0, 19, NULL),
(118, '2017-07-19', NULL, NULL, 175.00, 5, 0, 7, NULL),
(120, '2017-07-19', NULL, NULL, 150.00, 5, 0, 11, NULL),
(121, '2017-07-20', NULL, NULL, 518.00, 14, 0, 1, NULL),
(122, '2017-07-20', NULL, NULL, 518.00, 14, 0, 18, NULL),
(123, '2017-07-21', NULL, NULL, 481.00, 13, 0, 1, NULL),
(124, '2017-07-21', NULL, NULL, 195.00, 6, 30, 22, NULL),
(125, '2017-07-21', NULL, NULL, 227.50, 6, 30, 7, NULL),
(126, '2017-07-21', NULL, NULL, 227.50, 6, 30, 8, NULL),
(130, '2017-07-22', NULL, NULL, 210.00, 6, 0, 7, NULL),
(131, '2017-07-22', NULL, NULL, 262.50, 7, 30, 8, NULL),
(133, '2017-07-22', NULL, NULL, 240.00, 8, 0, 11, NULL),
(134, '2017-07-17', NULL, NULL, 300.00, 2, 0, 13, NULL),
(135, '2017-07-17', NULL, NULL, 485.00, 2, 0, 14, NULL),
(136, '2017-07-18', NULL, NULL, 485.00, 2, 0, 14, NULL),
(137, '2017-07-18', NULL, NULL, 300.00, 2, 0, 13, NULL),
(138, '2017-07-19', NULL, NULL, 485.00, 2, 0, 14, NULL),
(139, '2017-07-19', NULL, NULL, 300.00, 2, 0, 13, NULL),
(140, '2017-07-20', NULL, NULL, 300.00, 2, 0, 13, NULL),
(141, '2017-07-20', NULL, NULL, 485.00, 2, 0, 14, NULL),
(142, '2017-07-21', NULL, NULL, 300.00, 2, 0, 13, NULL),
(143, '2017-07-21', NULL, NULL, 485.00, 2, 0, 14, NULL),
(144, '2017-07-22', NULL, NULL, 140.00, 4, 0, 19, NULL),
(146, '2017-07-22', NULL, NULL, 140.00, 4, 40, 22, NULL),
(147, '2017-07-22', NULL, NULL, 262.50, 7, 30, 16, NULL),
(148, '2017-07-22', NULL, NULL, 520.00, 13, 0, 1, NULL),
(149, '2017-07-23', NULL, NULL, 437.50, 12, 30, 16, NULL),
(150, '2017-07-23', NULL, NULL, 437.50, 12, 30, 17, NULL),
(151, '2017-07-23', NULL, NULL, 480.00, 12, 0, 1, NULL),
(152, '2017-07-23', NULL, NULL, 277.50, 7, 30, 18, NULL),
(153, '2017-07-23', NULL, NULL, 150.00, 5, 0, 11, NULL),
(154, '2017-07-23', NULL, NULL, 300.00, 2, 0, 13, NULL),
(155, '2017-07-23', NULL, NULL, 485.00, 2, 0, 14, NULL),
(156, '2017-07-24', NULL, NULL, 245.00, 7, 0, 16, NULL),
(157, '2017-07-24', NULL, NULL, 245.00, 7, 0, 17, NULL),
(158, '2017-07-24', NULL, NULL, 175.00, 5, 0, 7, NULL),
(159, '2017-07-24', NULL, NULL, 150.00, 5, 0, 11, NULL),
(160, '2017-07-25', NULL, NULL, 245.00, 7, 0, 16, NULL),
(161, '2017-07-25', NULL, NULL, 192.50, 5, 30, 7, NULL),
(163, '2017-07-25', NULL, NULL, 165.00, 5, 30, 11, NULL),
(164, '2017-07-26', NULL, NULL, 210.00, 6, 0, 16, NULL),
(165, '2017-07-26', NULL, NULL, 520.00, 13, 0, 1, NULL),
(167, '2017-07-27', NULL, NULL, 560.00, 14, 0, 1, NULL),
(168, '2017-07-27', NULL, NULL, 245.00, 7, 0, 7, NULL),
(170, '2017-07-28', NULL, NULL, 280.00, 8, 0, 16, NULL),
(171, '2017-07-28', NULL, NULL, 280.00, 8, 0, 17, NULL),
(172, '2017-07-28', NULL, NULL, 600.00, 15, 0, 1, NULL),
(173, '2017-07-28', NULL, NULL, 280.00, 8, 0, 19, NULL),
(174, '2017-07-28', NULL, NULL, 225.00, 7, 30, 22, NULL),
(175, '2017-07-28', NULL, NULL, 262.50, 7, 30, 8, NULL),
(178, '2017-07-29', NULL, NULL, 280.00, 8, 0, 17, NULL),
(179, '2017-07-29', NULL, NULL, 280.00, 8, 0, 19, NULL),
(181, '2017-07-29', NULL, NULL, 280.00, 8, 0, 7, NULL),
(184, '2017-07-29', NULL, NULL, 640.00, 16, 0, 1, NULL),
(185, '2017-07-29', NULL, NULL, 240.00, 8, 0, 22, NULL),
(186, '2017-07-29', NULL, NULL, 280.00, 8, 0, 8, NULL),
(189, '2017-07-30', NULL, NULL, 262.50, 7, 30, 19, NULL),
(195, '2017-07-30', NULL, NULL, 150.00, 5, 0, 22, NULL),
(196, '2017-07-30', NULL, NULL, 455.00, 13, 0, 7, NULL),
(197, '2017-07-30', NULL, NULL, 455.00, 13, 0, 8, NULL),
(200, '2017-07-24', NULL, NULL, 300.00, 5, 0, 13, NULL),
(201, '2017-07-24', NULL, NULL, 485.00, 5, 0, 14, NULL),
(202, '2017-07-25', NULL, NULL, 300.00, 5, 0, 13, NULL),
(203, '2017-07-25', NULL, NULL, 485.00, 5, 0, 14, NULL),
(204, '2017-07-26', NULL, NULL, 485.00, 5, 0, 14, NULL),
(205, '2017-07-26', NULL, NULL, 300.00, 5, 0, 13, NULL),
(206, '2017-07-27', NULL, NULL, 485.00, 4, 0, 14, NULL),
(207, '2017-07-27', NULL, NULL, 300.00, 4, 0, 13, NULL),
(208, '2017-07-26', NULL, NULL, 300.00, 5, 0, 13, NULL),
(212, '2017-07-28', NULL, NULL, 300.00, 5, 0, 13, NULL),
(213, '2017-07-28', NULL, NULL, 485.00, 5, 0, 14, NULL),
(214, '2017-07-29', NULL, NULL, 485.00, 4, 0, 14, NULL),
(215, '2017-07-29', NULL, NULL, 300.00, 4, 0, 13, NULL),
(216, '2017-07-30', NULL, NULL, 300.00, 5, 0, 13, NULL),
(217, '2017-07-30', NULL, NULL, 485.00, 5, 0, 14, NULL),
(218, '2017-07-31', NULL, NULL, 280.00, 8, 0, 7, NULL),
(219, '2017-07-31', NULL, NULL, 227.50, 6, 30, 8, NULL),
(220, '2017-07-31', NULL, NULL, 192.50, 5, 30, 19, NULL),
(221, '2017-07-31', NULL, NULL, 120.00, 4, 0, 11, NULL),
(222, '2017-07-31', NULL, NULL, 300.00, 4, 0, 13, NULL),
(223, '2017-07-31', NULL, NULL, 485.00, 4, 0, 14, NULL),
(224, '2017-08-01', NULL, NULL, 245.00, 7, 0, 8, NULL),
(225, '2017-08-01', NULL, NULL, 245.00, 7, 0, 7, NULL),
(227, '2017-08-01', NULL, NULL, 180.00, 6, 0, 11, NULL),
(228, '2017-08-01', NULL, NULL, 300.00, 2, 0, 13, NULL),
(229, '2017-08-01', NULL, NULL, 485.00, 2, 0, 14, NULL),
(230, '2017-08-02', NULL, NULL, 262.50, 7, 30, 16, NULL),
(231, '2017-08-02', NULL, NULL, 400.00, 10, 0, 1, NULL),
(232, '2017-08-02', NULL, NULL, 259.00, 7, 0, 18, NULL),
(233, '2017-08-02', NULL, NULL, 140.00, 4, 40, 11, NULL),
(234, '2017-08-02', NULL, NULL, 300.00, 2, 0, 13, NULL),
(235, '2017-08-02', NULL, NULL, 485.00, 2, 0, 14, NULL),
(236, '2017-08-03', NULL, NULL, 540.00, 13, 30, 1, NULL),
(237, '2017-08-03', NULL, NULL, 259.00, 7, 0, 18, NULL),
(238, '2017-08-03', NULL, NULL, 227.50, 6, 30, 19, NULL),
(239, '2017-08-03', NULL, NULL, 300.00, 2, 0, 13, NULL),
(240, '2017-08-03', NULL, NULL, 485.00, 2, 0, 14, NULL),
(241, '2017-08-04', NULL, NULL, 245.00, 7, 0, 16, NULL),
(242, '2017-08-04', NULL, NULL, 570.00, 14, 15, 1, NULL),
(243, '2017-08-04', NULL, NULL, 268.25, 7, 15, 18, NULL),
(244, '2017-08-04', NULL, NULL, 187.50, 6, 15, 22, NULL),
(245, '2017-08-04', NULL, NULL, 300.00, 2, 0, 13, NULL),
(246, '2017-08-04', NULL, NULL, 485.00, 2, 0, 14, NULL),
(247, '2017-08-05', NULL, NULL, 280.00, 8, 0, 16, NULL),
(248, '2017-08-05', NULL, NULL, 280.00, 8, 0, 17, NULL),
(249, '2017-08-05', NULL, NULL, 550.00, 13, 45, 1, NULL),
(250, '2017-08-05', NULL, NULL, 138.75, 3, 45, 18, NULL),
(251, '2017-08-05', NULL, NULL, 350.00, 10, 0, 19, NULL),
(252, '2017-08-05', NULL, NULL, 172.50, 5, 45, 22, NULL),
(253, '2017-08-05', NULL, NULL, 300.00, 2, 0, 13, NULL),
(254, '2017-08-05', NULL, NULL, 485.00, 2, 0, 14, NULL),
(255, '2017-08-06', NULL, NULL, 573.33, 14, 20, 1, NULL),
(256, '2017-08-06', NULL, NULL, 314.50, 8, 30, 18, NULL),
(257, '2017-08-06', NULL, NULL, 221.67, 6, 20, 19, NULL),
(258, '2017-08-06', NULL, NULL, 225.00, 7, 30, 22, NULL),
(259, '2017-08-06', NULL, NULL, 185.00, 6, 10, 11, NULL),
(260, '2017-08-06', NULL, NULL, 300.00, 5, 0, 13, NULL),
(261, '2017-08-06', NULL, NULL, 485.00, 2, 15, 14, NULL),
(275, '2017-08-22', '18:07:34', '18:34:32', 18.00, 0, 27, 1, 135);

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
-- Indexes for table `branch_menu`
--
ALTER TABLE `branch_menu`
  ADD PRIMARY KEY (`branchNo`,`menuNo`),
  ADD KEY `menuNo` (`menuNo`);

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
  ADD UNIQUE KEY `menu_name_TH` (`menu_name_TH`),
  ADD UNIQUE KEY `menu_name_EN` (`menu_name_EN`),
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
-- Indexes for table `menu_in_set`
--
ALTER TABLE `menu_in_set`
  ADD PRIMARY KEY (`menu_no`,`menu_sub_no`),
  ADD KEY `menu_set_no` (`menu_no`),
  ADD KEY `menu_no` (`menu_no`),
  ADD KEY `menu_sub_no` (`menu_sub_no`);

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
  ADD KEY `emp_no` (`emp_no`),
  ADD KEY `emp_time_no` (`emp_time_no`);

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
  MODIFY `emp_pay_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `emp_pos_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `employee_table`
--
ALTER TABLE `employee_table`
  MODIFY `emp_time_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
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
  MODIFY `menu_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
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
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_history`
--
ALTER TABLE `work_history`
  MODIFY `work_hist_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_menu`
--
ALTER TABLE `branch_menu`
  ADD CONSTRAINT `branch_menu_ibfk_1` FOREIGN KEY (`branchNo`) REFERENCES `branch` (`branch_no`),
  ADD CONSTRAINT `branch_menu_ibfk_2` FOREIGN KEY (`menuNo`) REFERENCES `menu` (`menu_no`);

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
-- Constraints for table `menu_in_set`
--
ALTER TABLE `menu_in_set`
  ADD CONSTRAINT `menu_in_set_ibfk_1` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_in_set_ibfk_2` FOREIGN KEY (`menu_sub_no`) REFERENCES `menu` (`menu_no`);

--
-- Constraints for table `work_history`
--
ALTER TABLE `work_history`
  ADD CONSTRAINT `work_history_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
