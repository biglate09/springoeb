-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 11:39 AM
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
  `branch_name` varchar(100) NOT NULL,
  `branch_desc` varchar(300) DEFAULT NULL,
  `address_name` varchar(300) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `sub_district` varchar(50) DEFAULT NULL,
  `road` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `line` varchar(30) DEFAULT NULL,
  `fb` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_no`, `branch_name`, `branch_desc`, `address_name`, `district`, `sub_district`, `road`, `province`, `zip`, `tel`, `line`, `fb`) VALUES
(1, 'สาขาบางแสน', '', '', '', '', '', '', '', '', '', ''),
(2, 'สาขาบางแค', '', '', '', '', '', '', '', '', '', ''),
(3, 'สาขาเอกมัย', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `branch_menu`
--

CREATE TABLE `branch_menu` (
  `branch_no` int(11) NOT NULL,
  `menu_no` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch_menu`
--

INSERT INTO `branch_menu` (`branch_no`, `menu_no`, `available`) VALUES
(1, 14, 1),
(1, 15, 0),
(1, 16, 1),
(1, 17, 1),
(1, 18, 1),
(1, 19, 1),
(1, 21, 1),
(2, 14, 1),
(2, 15, 1),
(2, 16, 1),
(2, 17, 0),
(2, 18, 0),
(2, 19, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(3, 14, 0),
(3, 15, 0),
(3, 16, 0),
(3, 17, 0),
(3, 18, 0),
(3, 19, 0),
(3, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `branch_user`
--

CREATE TABLE `branch_user` (
  `branch_user_no` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `branch_no` int(11) NOT NULL,
  `role_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `branch_user`
--

INSERT INTO `branch_user` (`branch_user_no`, `username`, `password`, `branch_no`, `role_no`) VALUES
(1, 'kopihub-master', '$2a$10$E3FxBBuaGdRCnb4PULE1x.FtZp3wDv18mwLoRCwTYB.rGaNAwW5R2', 1, 1),
(2, 'kopihub-bangkae', '$2a$10$T6iCPE2YKLr/C/5p5myUZeVgprGzHaNHvdm4JBQy/WzIVgV8zqBPK', 2, 1),
(3, 'kopihub-ekkamai', '$2a$10$./rT3rhc13NT1p0yRfZP7.OmdT780bTdLPmveX8oh3UzrSFN6Sg5C', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_table`
--

CREATE TABLE `customer_table` (
  `table_no` int(11) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `seat_amount` double NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `branch_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_table`
--

INSERT INTO `customer_table` (`table_no`, `table_name`, `seat_amount`, `is_available`, `branch_no`) VALUES
(14, 'โต๊ะที่ 1', 2, 1, 1),
(16, 'โต๊ะที่ 3', 2, 1, 1),
(17, 'โต๊ะที่ 4', 2, 1, 1),
(18, 'โต๊ะที่ 5', 2, 1, 1),
(19, 'โต๊ะที่ 6', 2, 1, 1),
(20, 'โต๊ะที่ 7', 2, 1, 1),
(21, 'โต๊ะที่ 8', 2, 1, 1),
(22, 'โต๊ะที่ 9', 2, 1, 1),
(23, 'โต๊ะที่ 10', 2, 1, 1),
(24, 'โต๊ะที่ 11', 2, 1, 1),
(25, 'โต๊ะที่ 12', 2, 1, 1);

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
(1, 'แซม', '', 'M', '2', '1', 30.00, '#ff0000', '#ffffff', 1),
(2, 'บิ๊ก', '', 'M', '1', '1', 37.00, '#00a8bf', '#ffffff', 1),
(3, 'นิ้ง', '', 'F', '3', '1', 28.00, '#097000', '#FFFFFF', 1),
(4, 'นนท์', '', 'M', '2', '2', 200.00, '#db9e00', '#FFFFFF', 1),
(5, 'จุ๊บแจง', '0813026159', 'F', '2', '1', 33.00, '#8a6300', '#FFFFFF', 1),
(6, 'เจมส์', '', 'M', '1', '2', 300.00, '#000000', '#ffffff', 1);

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
(1, 30.00, '2017-09-08 12:16:11', 6);

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
(1, 'พนักงานเสิร์ฟ'),
(2, 'กุ๊ก'),
(3, 'เชฟ'),
(4, 'เคาน์เตอร์'),
(5, 'พนักงานต้อนรับ');

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
(1, '2017-08-27', '13:00:00', '13:00:00', 3, 2),
(2, '2017-08-27', '00:00:00', '00:00:00', 1, 1),
(3, '2017-08-27', '18:00:00', '18:00:00', 4, 4),
(4, '2017-08-27', '00:00:00', '00:00:00', 5, 3),
(5, '2017-08-27', '18:00:00', '18:00:00', 2, 5),
(6, '2017-08-27', '00:00:00', '00:00:00', 3, 6),
(7, '2017-08-28', '18:00:00', '18:00:00', 4, 1),
(8, '2017-08-28', '13:00:00', '13:00:00', 1, 4),
(9, '2017-08-28', '18:00:00', '18:00:00', 2, 2),
(10, '2017-08-28', '00:00:00', '00:00:00', 5, 3),
(11, '2017-08-28', '18:00:00', '18:00:00', 3, 5),
(12, '2017-08-26', '18:00:00', '18:00:00', 3, 1),
(13, '2017-08-26', '13:00:00', '13:00:00', 2, 2),
(14, '2017-08-26', '18:00:00', '18:00:00', 4, 3),
(15, '2017-08-26', '00:00:00', '00:00:00', 5, 4),
(16, '2017-08-25', '18:00:00', '18:00:00', 3, 2),
(17, '2017-08-25', '00:00:00', '00:00:00', 1, 4),
(18, '2017-08-25', '18:00:00', '18:00:00', 1, 6),
(19, '2017-08-25', '13:00:00', '13:00:00', 4, 5),
(20, '2017-08-23', '18:00:00', '18:00:00', 4, 3),
(21, '2017-08-23', '18:00:00', '18:00:00', 3, 4),
(22, '2017-08-23', '18:00:00', '18:00:00', 5, 6);

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
(2, 'แป้ง'),
(3, 'เนื้อสัตว์'),
(4, 'ผัก'),
(5, 'เครื่องปรุงพิเศษ'),
(6, 'น้ำมัน');

-- --------------------------------------------------------

--
-- Table structure for table `material_history`
--

CREATE TABLE `material_history` (
  `mat_hist_no` int(11) NOT NULL,
  `mat_name` varchar(100) NOT NULL,
  `mat_quantity` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `importer` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `mat_item_no` int(11) NOT NULL,
  `branch_no` int(11) NOT NULL,
  `of_mat_hist_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_history`
--

INSERT INTO `material_history` (`mat_hist_no`, `mat_name`, `mat_quantity`, `date`, `time`, `importer`, `supplier`, `mat_item_no`, `branch_no`, `of_mat_hist_no`) VALUES
(112, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-09', '02:20:25', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(113, 'น้ำมันพืช', -60, '2017-09-09', '02:20:25', NULL, NULL, 10, 1, 112),
(114, 'แป้งข้าวเจ้า', -120, '2017-09-09', '02:20:25', NULL, NULL, 11, 1, 112),
(115, 'น้ำสต็อก', -240, '2017-09-09', '02:20:25', NULL, NULL, 12, 1, 112),
(116, 'ส่วนผสมอีกที', -120, '2017-09-09', '02:20:25', NULL, NULL, 15, 1, 112),
(117, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:17', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(118, 'น้ำมันพืช', -60, '2017-09-10', '02:31:17', NULL, NULL, 10, 1, 117),
(119, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:17', NULL, NULL, 11, 1, 117),
(120, 'น้ำสต็อก', -240, '2017-09-10', '02:31:17', NULL, NULL, 12, 1, 117),
(121, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:17', NULL, NULL, 15, 1, 117),
(122, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:20', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(123, 'น้ำมันพืช', -60, '2017-09-10', '02:31:20', NULL, NULL, 10, 1, 122),
(124, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:20', NULL, NULL, 11, 1, 122),
(125, 'น้ำสต็อก', -240, '2017-09-10', '02:31:20', NULL, NULL, 12, 1, 122),
(126, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:20', NULL, NULL, 15, 1, 122),
(127, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:21', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(128, 'น้ำมันพืช', -60, '2017-09-10', '02:31:21', NULL, NULL, 10, 1, 127),
(129, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:21', NULL, NULL, 11, 1, 127),
(130, 'น้ำสต็อก', -240, '2017-09-10', '02:31:21', NULL, NULL, 12, 1, 127),
(131, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:21', NULL, NULL, 15, 1, 127),
(132, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:22', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(133, 'น้ำมันพืช', -60, '2017-09-10', '02:31:22', NULL, NULL, 10, 1, 132),
(134, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:22', NULL, NULL, 11, 1, 132),
(135, 'น้ำสต็อก', -240, '2017-09-10', '02:31:22', NULL, NULL, 12, 1, 132),
(136, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:22', NULL, NULL, 15, 1, 132),
(137, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:24', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(138, 'น้ำมันพืช', -60, '2017-09-10', '02:31:24', NULL, NULL, 10, 1, 137),
(139, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:24', NULL, NULL, 11, 1, 137),
(140, 'น้ำสต็อก', -240, '2017-09-10', '02:31:24', NULL, NULL, 12, 1, 137),
(141, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:24', NULL, NULL, 15, 1, 137),
(142, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:33', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(143, 'น้ำมันพืช', -60, '2017-09-10', '02:31:33', NULL, NULL, 10, 1, 142),
(144, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:33', NULL, NULL, 11, 1, 142),
(145, 'น้ำสต็อก', -240, '2017-09-10', '02:31:33', NULL, NULL, 12, 1, 142),
(146, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:33', NULL, NULL, 15, 1, 142),
(147, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:34', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(148, 'น้ำมันพืช', -60, '2017-09-10', '02:31:34', NULL, NULL, 10, 1, 147),
(149, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:34', NULL, NULL, 11, 1, 147),
(150, 'น้ำสต็อก', -240, '2017-09-10', '02:31:34', NULL, NULL, 12, 1, 147),
(151, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:34', NULL, NULL, 15, 1, 147),
(152, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:35', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(153, 'น้ำมันพืช', -60, '2017-09-10', '02:31:35', NULL, NULL, 10, 1, 152),
(154, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:35', NULL, NULL, 11, 1, 152),
(155, 'น้ำสต็อก', -240, '2017-09-10', '02:31:35', NULL, NULL, 12, 1, 152),
(156, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:35', NULL, NULL, 15, 1, 152),
(157, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:36', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(158, 'น้ำมันพืช', -60, '2017-09-10', '02:31:36', NULL, NULL, 10, 1, 157),
(159, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:36', NULL, NULL, 11, 1, 157),
(160, 'น้ำสต็อก', -240, '2017-09-10', '02:31:36', NULL, NULL, 12, 1, 157),
(161, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:36', NULL, NULL, 15, 1, 157),
(162, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:36', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(163, 'น้ำมันพืช', -60, '2017-09-10', '02:31:36', NULL, NULL, 10, 1, 162),
(164, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:36', NULL, NULL, 11, 1, 162),
(165, 'น้ำสต็อก', -240, '2017-09-10', '02:31:36', NULL, NULL, 12, 1, 162),
(166, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:36', NULL, NULL, 15, 1, 162),
(167, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:37', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(168, 'น้ำมันพืช', -60, '2017-09-10', '02:31:37', NULL, NULL, 10, 1, 167),
(169, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:37', NULL, NULL, 11, 1, 167),
(170, 'น้ำสต็อก', -240, '2017-09-10', '02:31:37', NULL, NULL, 12, 1, 167),
(171, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:37', NULL, NULL, 15, 1, 167),
(172, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '02:31:38', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(173, 'น้ำมันพืช', -60, '2017-09-10', '02:31:38', NULL, NULL, 10, 1, 172),
(174, 'แป้งข้าวเจ้า', -120, '2017-09-10', '02:31:38', NULL, NULL, 11, 1, 172),
(175, 'น้ำสต็อก', -240, '2017-09-10', '02:31:38', NULL, NULL, 12, 1, 172),
(176, 'ส่วนผสมอีกที', -120, '2017-09-10', '02:31:38', NULL, NULL, 15, 1, 172),
(177, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:34', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(178, 'น้ำมันพืช', -60, '2017-09-10', '18:07:34', NULL, NULL, 10, 1, 177),
(179, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:34', NULL, NULL, 11, 1, 177),
(180, 'น้ำสต็อก', -240, '2017-09-10', '18:07:34', NULL, NULL, 12, 1, 177),
(181, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:34', NULL, NULL, 15, 1, 177),
(182, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:35', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(183, 'น้ำมันพืช', -60, '2017-09-10', '18:07:35', NULL, NULL, 10, 1, 182),
(184, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:35', NULL, NULL, 11, 1, 182),
(185, 'น้ำสต็อก', -240, '2017-09-10', '18:07:35', NULL, NULL, 12, 1, 182),
(186, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:35', NULL, NULL, 15, 1, 182),
(187, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:36', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(188, 'น้ำมันพืช', -60, '2017-09-10', '18:07:36', NULL, NULL, 10, 1, 187),
(189, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:36', NULL, NULL, 11, 1, 187),
(190, 'น้ำสต็อก', -240, '2017-09-10', '18:07:36', NULL, NULL, 12, 1, 187),
(191, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:36', NULL, NULL, 15, 1, 187),
(192, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:38', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(193, 'น้ำมันพืช', -60, '2017-09-10', '18:07:38', NULL, NULL, 10, 1, 192),
(194, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:38', NULL, NULL, 11, 1, 192),
(195, 'น้ำสต็อก', -240, '2017-09-10', '18:07:38', NULL, NULL, 12, 1, 192),
(196, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:38', NULL, NULL, 15, 1, 192),
(197, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:39', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(198, 'น้ำมันพืช', -60, '2017-09-10', '18:07:39', NULL, NULL, 10, 1, 197),
(199, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:39', NULL, NULL, 11, 1, 197),
(200, 'น้ำสต็อก', -240, '2017-09-10', '18:07:39', NULL, NULL, 12, 1, 197),
(201, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:39', NULL, NULL, 15, 1, 197),
(202, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:07:40', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(203, 'น้ำมันพืช', -60, '2017-09-10', '18:07:40', NULL, NULL, 10, 1, 202),
(204, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:07:40', NULL, NULL, 11, 1, 202),
(205, 'น้ำสต็อก', -240, '2017-09-10', '18:07:40', NULL, NULL, 12, 1, 202),
(206, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:07:40', NULL, NULL, 15, 1, 202),
(207, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '18:08:01', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(208, 'น้ำมันพืช', -60, '2017-09-10', '18:08:01', NULL, NULL, 10, 1, 207),
(209, 'แป้งข้าวเจ้า', -120, '2017-09-10', '18:08:01', NULL, NULL, 11, 1, 207),
(210, 'น้ำสต็อก', -240, '2017-09-10', '18:08:01', NULL, NULL, 12, 1, 207),
(211, 'ส่วนผสมอีกที', -120, '2017-09-10', '18:08:01', NULL, NULL, 15, 1, 207),
(212, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:42:12', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(213, 'น้ำมันพืช', -60, '2017-09-10', '19:42:12', NULL, NULL, 10, 1, 212),
(214, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:42:12', NULL, NULL, 11, 1, 212),
(215, 'น้ำสต็อก', -240, '2017-09-10', '19:42:12', NULL, NULL, 12, 1, 212),
(216, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:42:12', NULL, NULL, 15, 1, 212),
(217, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:42:15', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(218, 'น้ำมันพืช', -60, '2017-09-10', '19:42:15', NULL, NULL, 10, 1, 217),
(219, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:42:15', NULL, NULL, 11, 1, 217),
(220, 'น้ำสต็อก', -240, '2017-09-10', '19:42:15', NULL, NULL, 12, 1, 217),
(221, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:42:15', NULL, NULL, 15, 1, 217),
(222, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:43:05', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(223, 'น้ำมันพืช', -60, '2017-09-10', '19:43:05', NULL, NULL, 10, 1, 222),
(224, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:43:05', NULL, NULL, 11, 1, 222),
(225, 'น้ำสต็อก', -240, '2017-09-10', '19:43:05', NULL, NULL, 12, 1, 222),
(226, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:43:05', NULL, NULL, 15, 1, 222),
(227, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:43:09', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(228, 'น้ำมันพืช', -60, '2017-09-10', '19:43:09', NULL, NULL, 10, 1, 227),
(229, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:43:09', NULL, NULL, 11, 1, 227),
(230, 'น้ำสต็อก', -240, '2017-09-10', '19:43:09', NULL, NULL, 12, 1, 227),
(231, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:43:09', NULL, NULL, 15, 1, 227),
(232, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:43:10', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(233, 'น้ำมันพืช', -60, '2017-09-10', '19:43:10', NULL, NULL, 10, 1, 232),
(234, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:43:10', NULL, NULL, 11, 1, 232),
(235, 'น้ำสต็อก', -240, '2017-09-10', '19:43:10', NULL, NULL, 12, 1, 232),
(236, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:43:10', NULL, NULL, 15, 1, 232),
(237, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:43:13', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(238, 'น้ำมันพืช', -60, '2017-09-10', '19:43:13', NULL, NULL, 10, 1, 237),
(239, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:43:13', NULL, NULL, 11, 1, 237),
(240, 'น้ำสต็อก', -240, '2017-09-10', '19:43:13', NULL, NULL, 12, 1, 237),
(241, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:43:13', NULL, NULL, 15, 1, 237),
(242, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:44:06', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(243, 'น้ำมันพืช', -60, '2017-09-10', '19:44:06', NULL, NULL, 10, 1, 242),
(244, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:44:06', NULL, NULL, 11, 1, 242),
(245, 'น้ำสต็อก', -240, '2017-09-10', '19:44:06', NULL, NULL, 12, 1, 242),
(246, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:44:06', NULL, NULL, 15, 1, 242),
(247, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:44:56', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(248, 'น้ำมันพืช', -60, '2017-09-10', '19:44:56', NULL, NULL, 10, 1, 247),
(249, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:44:56', NULL, NULL, 11, 1, 247),
(250, 'น้ำสต็อก', -240, '2017-09-10', '19:44:56', NULL, NULL, 12, 1, 247),
(251, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:44:56', NULL, NULL, 15, 1, 247),
(252, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:45:13', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(253, 'น้ำมันพืช', -60, '2017-09-10', '19:45:13', NULL, NULL, 10, 1, 252),
(254, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:45:13', NULL, NULL, 11, 1, 252),
(255, 'น้ำสต็อก', -240, '2017-09-10', '19:45:13', NULL, NULL, 12, 1, 252),
(256, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:45:13', NULL, NULL, 15, 1, 252),
(257, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:17', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(258, 'น้ำมันพืช', -60, '2017-09-10', '19:46:17', NULL, NULL, 10, 1, 257),
(259, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:17', NULL, NULL, 11, 1, 257),
(260, 'น้ำสต็อก', -240, '2017-09-10', '19:46:17', NULL, NULL, 12, 1, 257),
(261, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:17', NULL, NULL, 15, 1, 257),
(262, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:18', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(263, 'น้ำมันพืช', -60, '2017-09-10', '19:46:18', NULL, NULL, 10, 1, 262),
(264, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:18', NULL, NULL, 11, 1, 262),
(265, 'น้ำสต็อก', -240, '2017-09-10', '19:46:18', NULL, NULL, 12, 1, 262),
(266, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:18', NULL, NULL, 15, 1, 262),
(267, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:19', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(268, 'น้ำมันพืช', -60, '2017-09-10', '19:46:19', NULL, NULL, 10, 1, 267),
(269, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:19', NULL, NULL, 11, 1, 267),
(270, 'น้ำสต็อก', -240, '2017-09-10', '19:46:19', NULL, NULL, 12, 1, 267),
(271, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:19', NULL, NULL, 15, 1, 267),
(272, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:20', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(273, 'น้ำมันพืช', -60, '2017-09-10', '19:46:20', NULL, NULL, 10, 1, 272),
(274, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:20', NULL, NULL, 11, 1, 272),
(275, 'น้ำสต็อก', -240, '2017-09-10', '19:46:20', NULL, NULL, 12, 1, 272),
(276, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:20', NULL, NULL, 15, 1, 272),
(277, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:21', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(278, 'น้ำมันพืช', -60, '2017-09-10', '19:46:21', NULL, NULL, 10, 1, 277),
(279, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:21', NULL, NULL, 11, 1, 277),
(280, 'น้ำสต็อก', -240, '2017-09-10', '19:46:21', NULL, NULL, 12, 1, 277),
(281, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:21', NULL, NULL, 15, 1, 277),
(282, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:23', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(283, 'น้ำมันพืช', -60, '2017-09-10', '19:46:23', NULL, NULL, 10, 1, 282),
(284, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:23', NULL, NULL, 11, 1, 282),
(285, 'น้ำสต็อก', -240, '2017-09-10', '19:46:23', NULL, NULL, 12, 1, 282),
(286, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:23', NULL, NULL, 15, 1, 282),
(287, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:24', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(288, 'น้ำมันพืช', -60, '2017-09-10', '19:46:24', NULL, NULL, 10, 1, 287),
(289, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:24', NULL, NULL, 11, 1, 287),
(290, 'น้ำสต็อก', -240, '2017-09-10', '19:46:24', NULL, NULL, 12, 1, 287),
(291, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:24', NULL, NULL, 15, 1, 287),
(292, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:25', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(293, 'น้ำมันพืช', -60, '2017-09-10', '19:46:25', NULL, NULL, 10, 1, 292),
(294, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:25', NULL, NULL, 11, 1, 292),
(295, 'น้ำสต็อก', -240, '2017-09-10', '19:46:25', NULL, NULL, 12, 1, 292),
(296, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:25', NULL, NULL, 15, 1, 292),
(297, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:27', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(298, 'น้ำมันพืช', -60, '2017-09-10', '19:46:27', NULL, NULL, 10, 1, 297),
(299, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:27', NULL, NULL, 11, 1, 297),
(300, 'น้ำสต็อก', -240, '2017-09-10', '19:46:27', NULL, NULL, 12, 1, 297),
(301, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:27', NULL, NULL, 15, 1, 297),
(302, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:27', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(303, 'น้ำมันพืช', -60, '2017-09-10', '19:46:27', NULL, NULL, 10, 1, 302),
(304, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:27', NULL, NULL, 11, 1, 302),
(305, 'น้ำสต็อก', -240, '2017-09-10', '19:46:27', NULL, NULL, 12, 1, 302),
(306, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:27', NULL, NULL, 15, 1, 302),
(307, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:29', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(308, 'น้ำมันพืช', -60, '2017-09-10', '19:46:29', NULL, NULL, 10, 1, 307),
(309, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:29', NULL, NULL, 11, 1, 307),
(310, 'น้ำสต็อก', -240, '2017-09-10', '19:46:29', NULL, NULL, 12, 1, 307),
(311, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:29', NULL, NULL, 15, 1, 307),
(312, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:30', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(313, 'น้ำมันพืช', -60, '2017-09-10', '19:46:30', NULL, NULL, 10, 1, 312),
(314, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:30', NULL, NULL, 11, 1, 312),
(315, 'น้ำสต็อก', -240, '2017-09-10', '19:46:30', NULL, NULL, 12, 1, 312),
(316, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:30', NULL, NULL, 15, 1, 312),
(317, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:46:31', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(318, 'น้ำมันพืช', -60, '2017-09-10', '19:46:31', NULL, NULL, 10, 1, 317),
(319, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:46:31', NULL, NULL, 11, 1, 317),
(320, 'น้ำสต็อก', -240, '2017-09-10', '19:46:31', NULL, NULL, 12, 1, 317),
(321, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:46:31', NULL, NULL, 15, 1, 317),
(322, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:47:21', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(323, 'น้ำมันพืช', -60, '2017-09-10', '19:47:21', NULL, NULL, 10, 1, 322),
(324, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:47:21', NULL, NULL, 11, 1, 322),
(325, 'น้ำสต็อก', -240, '2017-09-10', '19:47:21', NULL, NULL, 12, 1, 322),
(326, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:47:21', NULL, NULL, 15, 1, 322),
(327, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:56:16', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(328, 'น้ำมันพืช', -60, '2017-09-10', '19:56:16', NULL, NULL, 10, 1, 327),
(329, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:56:16', NULL, NULL, 11, 1, 327),
(330, 'น้ำสต็อก', -240, '2017-09-10', '19:56:16', NULL, NULL, 12, 1, 327),
(331, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:56:16', NULL, NULL, 15, 1, 327),
(332, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:00', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(333, 'น้ำมันพืช', -60, '2017-09-10', '19:57:00', NULL, NULL, 10, 1, 332),
(334, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:00', NULL, NULL, 11, 1, 332),
(335, 'น้ำสต็อก', -240, '2017-09-10', '19:57:00', NULL, NULL, 12, 1, 332),
(336, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:00', NULL, NULL, 15, 1, 332),
(337, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:40', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(338, 'น้ำมันพืช', -60, '2017-09-10', '19:57:40', NULL, NULL, 10, 1, 337),
(339, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:40', NULL, NULL, 11, 1, 337),
(340, 'น้ำสต็อก', -240, '2017-09-10', '19:57:40', NULL, NULL, 12, 1, 337),
(341, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:40', NULL, NULL, 15, 1, 337),
(342, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:41', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(343, 'น้ำมันพืช', -60, '2017-09-10', '19:57:41', NULL, NULL, 10, 1, 342),
(344, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:41', NULL, NULL, 11, 1, 342),
(345, 'น้ำสต็อก', -240, '2017-09-10', '19:57:41', NULL, NULL, 12, 1, 342),
(346, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:41', NULL, NULL, 15, 1, 342),
(347, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:42', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(348, 'น้ำมันพืช', -60, '2017-09-10', '19:57:42', NULL, NULL, 10, 1, 347),
(349, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:42', NULL, NULL, 11, 1, 347),
(350, 'น้ำสต็อก', -240, '2017-09-10', '19:57:42', NULL, NULL, 12, 1, 347),
(351, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:42', NULL, NULL, 15, 1, 347),
(352, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:44', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(353, 'น้ำมันพืช', -60, '2017-09-10', '19:57:44', NULL, NULL, 10, 1, 352),
(354, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:44', NULL, NULL, 11, 1, 352),
(355, 'น้ำสต็อก', -240, '2017-09-10', '19:57:44', NULL, NULL, 12, 1, 352),
(356, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:44', NULL, NULL, 15, 1, 352),
(357, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:57:46', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(358, 'น้ำมันพืช', -60, '2017-09-10', '19:57:46', NULL, NULL, 10, 1, 357),
(359, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:57:46', NULL, NULL, 11, 1, 357),
(360, 'น้ำสต็อก', -240, '2017-09-10', '19:57:46', NULL, NULL, 12, 1, 357),
(361, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:57:46', NULL, NULL, 15, 1, 357),
(362, 'แป้งซาลาเปาหมูแดงทอด', 300, '2017-09-10', '19:59:04', 'บิ๊กเอง', 'เจ๊จิ๋ม', 13, 1, NULL),
(363, 'น้ำมันพืช', -60, '2017-09-10', '19:59:04', NULL, NULL, 10, 1, 362),
(364, 'แป้งข้าวเจ้า', -120, '2017-09-10', '19:59:04', NULL, NULL, 11, 1, 362),
(365, 'น้ำสต็อก', -240, '2017-09-10', '19:59:04', NULL, NULL, 12, 1, 362),
(366, 'ส่วนผสมอีกที', -120, '2017-09-10', '19:59:04', NULL, NULL, 15, 1, 362);

-- --------------------------------------------------------

--
-- Table structure for table `material_item`
--

CREATE TABLE `material_item` (
  `mat_item_no` int(11) NOT NULL,
  `mat_item_name` varchar(200) NOT NULL,
  `quantity` double NOT NULL DEFAULT '1',
  `mat_flag` varchar(1) NOT NULL COMMENT 'I = item, M = mixed product',
  `mat_cat_no` int(11) NOT NULL,
  `unit_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_item`
--

INSERT INTO `material_item` (`mat_item_no`, `mat_item_name`, `quantity`, `mat_flag`, `mat_cat_no`, `unit_no`) VALUES
(9, 'หมูแดง', 1, 'I', 3, 2),
(10, 'น้ำมันพืช', 1, 'I', 6, 3),
(11, 'แป้งข้าวเจ้า', 1, 'I', 2, 2),
(12, 'น้ำสต็อก', 1, 'I', 5, 3),
(13, 'แป้งซาลาเปาหมูแดงทอด', 25, 'M', 2, 2),
(14, 'ไข่', 1, 'I', 3, 2),
(15, 'ส่วนผสมอีกที', 10, 'M', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `material_mixed`
--

CREATE TABLE `material_mixed` (
  `mixed_prod_no` int(11) NOT NULL,
  `item_no` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_mixed`
--

INSERT INTO `material_mixed` (`mixed_prod_no`, `item_no`, `quantity`) VALUES
(13, 10, 5),
(13, 11, 10),
(13, 12, 20),
(13, 15, 10),
(15, 10, 30),
(15, 12, 20);

-- --------------------------------------------------------

--
-- Table structure for table `material_unit`
--

CREATE TABLE `material_unit` (
  `unit_no` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_unit`
--

INSERT INTO `material_unit` (`unit_no`, `unit_name`) VALUES
(2, 'กรัม'),
(3, 'มิลลิลิตร');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_no` int(8) NOT NULL,
  `menu_name_TH` varchar(200) NOT NULL,
  `menu_name_EN` varchar(200) NOT NULL,
  `menu_desc` varchar(500) DEFAULT NULL,
  `menu_price` double(20,2) NOT NULL,
  `menu_pic_path` varchar(500) DEFAULT NULL,
  `menu_flag` varchar(1) NOT NULL COMMENT 'M = menu , S = menuset',
  `local_flag` int(11) NOT NULL COMMENT '0 = Official, อื่นๆ = Local อิงตาม BranchNo',
  `menu_group_no` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_no`, `menu_name_TH`, `menu_name_EN`, `menu_desc`, `menu_price`, `menu_pic_path`, `menu_flag`, `local_flag`, `menu_group_no`) VALUES
(14, 'ซาลาเปาหมูแดงทอด', 'Fried Red Pork Bun', 'Test', 30.00, '1504975198650Bann.png', 'M', 0, 3),
(15, 'ซาลาเปาไส้ครีม', 'Sweet Cream Bun', 'Test', 30.00, '1504975244378Dimsum_Custard_Bun1.jpg', 'M', 0, 3),
(16, 'ข้าวโพดอ่อนแต้มหน้าหมู', 'Baby Corn Served on Steamed Pork', 'Test', 20.00, '1504975343688Dimsum_Baby_Corn1.jpg', 'M', 0, 2),
(17, 'ซี่โครงหมูเต้าซี่', 'Blackbean Garlic Sauce Steamed Pork', 'Test', 30.00, '1504975368694Dimsum_Blackbean_Garlic1.jpg', 'M', 0, 2),
(18, 'บร็อคโคลี่ไส้กุ้ง', 'Broccoli served on Steamed Shrimp', 'Test', 30.00, '1504976558685Dimsum_Broccoli1.jpg', 'M', 0, 2),
(19, 'ชุดซาลาเปาแสนอร่อย', 'Salapao Aroi', '30', 79.00, '1504977883822Bann.png', 'S', 0, NULL),
(21, 'ชานมเย็นโบราณ', 'Tranditional Iced Milk Tea', 'Test', 35.00, '1505023872033ชานมเย็นโบราณ.png', 'M', 0, 5),
(22, 'Test', 'Test', 'Test', 30.00, '1505025215664Dimsum_Crab_Dumpling1.jpg', 'M', 2, 1),
(23, 'บร็อคโคลี่ไส้กุ้งd', 'Broccoli served on Steamed Shrimpd', 'Test', 29.00, '1505025607534Dimsum_Broccoli1.jpg', 'S', 2, NULL);

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
(2, 'เครื่องดื่ม'),
(3, 'ของหวาน');

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
(1, 'เค้ก', 'Cake', 3),
(2, 'ติ่มซำตะมุตะมิอิอิ', 'Dim-sum', 1),
(3, 'ซาลาเปา', 'Pao Bun', 1),
(4, 'น้ำอัดลม', 'Soft Drink', 2),
(5, 'น้ำเพื่อสุขภาพ', 'Healthy Drink', 2),
(6, 'อาหารจานเดียว', 'Individual Dish', 1);

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
(19, 14, 1),
(19, 15, 2),
(23, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_material`
--

CREATE TABLE `menu_material` (
  `menu_no` int(11) NOT NULL,
  `mat_item_no` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_material`
--

INSERT INTO `menu_material` (`menu_no`, `mat_item_no`, `quantity`) VALUES
(15, 11, 2);

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
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_no` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_no`, `role_name`) VALUES
(1, 'manager');

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
(1, '2017-08-27', NULL, NULL, 105.00, 3, 30, 1, NULL),
(2, '2017-08-27', NULL, NULL, 215.83, 5, 50, 2, NULL),
(3, '2017-08-27', NULL, NULL, 224.00, 8, 0, 3, NULL),
(4, '2017-08-27', NULL, NULL, 200.00, 7, 45, 4, NULL),
(5, '2017-08-27', NULL, NULL, 192.50, 5, 50, 5, NULL),
(6, '2017-08-27', NULL, NULL, 300.00, 6, 35, 6, NULL),
(7, '2017-08-23', NULL, NULL, 224.00, 8, 0, 3, NULL),
(8, '2017-08-23', NULL, NULL, 200.00, 7, 45, 4, NULL),
(9, '2017-08-23', NULL, NULL, 300.00, 6, 13, 6, NULL),
(10, '2017-08-25', NULL, NULL, 215.83, 5, 50, 2, NULL),
(11, '2017-08-25', NULL, NULL, 200.00, 8, 0, 4, NULL),
(12, '2017-08-25', NULL, NULL, 189.75, 5, 45, 5, NULL),
(13, '2017-08-25', NULL, NULL, 300.00, 7, 0, 6, NULL),
(14, '2017-08-27', '23:46:21', '23:48:35', 1.00, 0, 2, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_no`);

--
-- Indexes for table `branch_menu`
--
ALTER TABLE `branch_menu`
  ADD PRIMARY KEY (`branch_no`,`menu_no`),
  ADD KEY `branch_no` (`branch_no`,`menu_no`),
  ADD KEY `branch_menu_ibfk_2` (`menu_no`);

--
-- Indexes for table `branch_user`
--
ALTER TABLE `branch_user`
  ADD PRIMARY KEY (`branch_user_no`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_no` (`role_no`),
  ADD KEY `branch_no` (`branch_no`),
  ADD KEY `role_no_2` (`role_no`);

--
-- Indexes for table `customer_table`
--
ALTER TABLE `customer_table`
  ADD PRIMARY KEY (`table_no`),
  ADD UNIQUE KEY `table_name` (`table_name`,`branch_no`),
  ADD KEY `branchNo` (`branch_no`);

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
-- Indexes for table `material_history`
--
ALTER TABLE `material_history`
  ADD PRIMARY KEY (`mat_hist_no`),
  ADD KEY `mat_no` (`mat_item_no`,`branch_no`),
  ADD KEY `branch_no` (`branch_no`),
  ADD KEY `of_mat_item_no` (`of_mat_hist_no`);

--
-- Indexes for table `material_item`
--
ALTER TABLE `material_item`
  ADD PRIMARY KEY (`mat_item_no`),
  ADD UNIQUE KEY `mat_item_name` (`mat_item_name`),
  ADD KEY `mat_cat_no` (`mat_cat_no`),
  ADD KEY `unit_no` (`unit_no`);

--
-- Indexes for table `material_mixed`
--
ALTER TABLE `material_mixed`
  ADD PRIMARY KEY (`mixed_prod_no`,`item_no`),
  ADD KEY `item_no` (`item_no`),
  ADD KEY `mixed_prod_no` (`mixed_prod_no`,`item_no`);

--
-- Indexes for table `material_unit`
--
ALTER TABLE `material_unit`
  ADD PRIMARY KEY (`unit_no`);

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
-- Indexes for table `menu_material`
--
ALTER TABLE `menu_material`
  ADD PRIMARY KEY (`menu_no`,`mat_item_no`),
  ADD KEY `mat_item_no` (`mat_item_no`),
  ADD KEY `menu_no` (`menu_no`,`mat_item_no`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_no`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_no`);

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
  MODIFY `branch_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `branch_user`
--
ALTER TABLE `branch_user`
  MODIFY `branch_user_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer_table`
--
ALTER TABLE `customer_table`
  MODIFY `table_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `employee_pay`
--
ALTER TABLE `employee_pay`
  MODIFY `emp_pay_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `emp_pos_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `employee_table`
--
ALTER TABLE `employee_table`
  MODIFY `emp_time_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `material_category`
--
ALTER TABLE `material_category`
  MODIFY `mat_cat_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `material_history`
--
ALTER TABLE `material_history`
  MODIFY `mat_hist_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=367;
--
-- AUTO_INCREMENT for table `material_item`
--
ALTER TABLE `material_item`
  MODIFY `mat_item_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `material_unit`
--
ALTER TABLE `material_unit`
  MODIFY `unit_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menu_cat_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `menu_group_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `work_history`
--
ALTER TABLE `work_history`
  MODIFY `work_hist_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch_menu`
--
ALTER TABLE `branch_menu`
  ADD CONSTRAINT `branch_menu_ibfk_1` FOREIGN KEY (`branch_no`) REFERENCES `branch` (`branch_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_menu_ibfk_2` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_user`
--
ALTER TABLE `branch_user`
  ADD CONSTRAINT `branch_user_ibfk_1` FOREIGN KEY (`branch_no`) REFERENCES `branch` (`branch_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_user_ibfk_2` FOREIGN KEY (`role_no`) REFERENCES `role` (`role_no`);

--
-- Constraints for table `customer_table`
--
ALTER TABLE `customer_table`
  ADD CONSTRAINT `customer_table_ibfk_1` FOREIGN KEY (`branch_no`) REFERENCES `branch` (`branch_no`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `material_history`
--
ALTER TABLE `material_history`
  ADD CONSTRAINT `material_history_ibfk_1` FOREIGN KEY (`mat_item_no`) REFERENCES `material_item` (`mat_item_no`),
  ADD CONSTRAINT `material_history_ibfk_2` FOREIGN KEY (`branch_no`) REFERENCES `branch` (`branch_no`),
  ADD CONSTRAINT `material_history_ibfk_3` FOREIGN KEY (`of_mat_hist_no`) REFERENCES `material_history` (`mat_hist_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `material_item`
--
ALTER TABLE `material_item`
  ADD CONSTRAINT `material_item_ibfk_1` FOREIGN KEY (`mat_cat_no`) REFERENCES `material_category` (`mat_cat_no`),
  ADD CONSTRAINT `material_item_ibfk_2` FOREIGN KEY (`unit_no`) REFERENCES `material_unit` (`unit_no`);

--
-- Constraints for table `material_mixed`
--
ALTER TABLE `material_mixed`
  ADD CONSTRAINT `material_mixed_ibfk_1` FOREIGN KEY (`mixed_prod_no`) REFERENCES `material_item` (`mat_item_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `material_mixed_ibfk_2` FOREIGN KEY (`item_no`) REFERENCES `material_item` (`mat_item_no`);

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
-- Constraints for table `menu_material`
--
ALTER TABLE `menu_material`
  ADD CONSTRAINT `menu_material_ibfk_1` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_material_ibfk_2` FOREIGN KEY (`mat_item_no`) REFERENCES `material_item` (`mat_item_no`);

--
-- Constraints for table `work_history`
--
ALTER TABLE `work_history`
  ADD CONSTRAINT `work_history_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
