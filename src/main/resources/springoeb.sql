-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2017 at 02:19 PM
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
(3, 'บอยคุง', '0999999999', 'M', '3', '1', 39.00, '#b02e2e', '#ffffff', 1),
(55, 'บอยจัง', '0813026159', 'M', '1', '2', 300.00, '', '', 1),
(58, 'นนท์', '30', 'M', '1', '1', 123.00, '#000000', '#ffffff', 1),
(59, 'นนท์งิ', '', 'M', '1', '2', 300.00, '#000000', '#ffffff', 1),
(60, 'lol', '123', 'M', '1', '2', 30.00, '#00ff5a', '#000000', 1),
(61, 'เหลืองแดง', '', 'M', '1', '1', 30.00, '#f1ff00', '#ff0000', 1),
(62, 'น้อย', '', 'M', '1', '1', 30.00, '#ff0000', '#ffffff', 1),
(63, 'เป้', '0851131980', 'M', '1', '1', 50.00, '#ff0000', '#30ff00', 1),
(64, 'อินทร์', '', 'M', '1', '1', 1000.00, '#000000', '#ffffff', 1),
(65, 'ewqrq', 'rq', 'M', '1', '1', 123.00, '#000000', '#ffffff', 1);

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
(43, 200.00, '2017-07-06 14:44:23', 55),
(44, 30.00, '2017-07-06 14:47:43', 3),
(45, 100.00, '2017-07-06 14:48:54', 3),
(47, 50.00, '2017-07-06 15:16:30', 55),
(48, 40.00, '2017-07-06 15:25:17', 3),
(50, 20.00, '2017-07-06 21:26:14', 55),
(56, 100.00, '2017-07-10 13:10:23', 3),
(57, 10.00, '2017-07-11 06:03:32', 3),
(63, 199.75, '2017-07-13 14:41:21', 55),
(65, 30.00, '2017-07-15 23:17:56', 3),
(68, 50.00, '2017-07-15 23:38:30', 3),
(69, 30.00, '2017-07-15 23:43:55', 55),
(70, 30.00, '2017-07-16 01:40:11', 3),
(73, 4000.00, '2017-07-16 17:12:35', 64),
(74, 1500.00, '2017-07-16 17:13:18', 63),
(75, 19000.00, '2017-07-16 17:21:04', 64);

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `emp_pos_no` int(8) NOT NULL,
  `emp_pos_name` varchar(100) NOT NULL,
  `available` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employee_position`
--

INSERT INTO `employee_position` (`emp_pos_no`, `emp_pos_name`, `available`) VALUES
(22, 'เสิร์ฟอาหาร', 1);

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
(66, '2017-07-06', '00:00:00', '00:00:00', 22, 3),
(68, '2017-07-06', '00:00:00', '00:00:00', 22, 55),
(70, '2017-07-07', '13:00:00', '13:00:00', 22, 3),
(71, '2017-07-07', '13:00:00', '13:00:00', 22, 55),
(73, '2017-07-13', '13:00:00', '13:00:00', 22, 3),
(74, '2017-07-13', '00:00:00', '00:00:00', 22, 55),
(75, '2017-07-13', '00:00:00', '00:00:00', 22, 60),
(76, '2017-07-15', '18:00:00', '18:00:00', 22, 61),
(79, '2017-07-15', '18:00:00', '18:00:00', 22, 62),
(80, '2017-07-17', '18:00:00', '18:00:00', 22, 63),
(81, '2017-07-19', '13:00:00', '13:00:00', 22, 63),
(82, '2017-07-22', '18:00:00', '18:00:00', 22, 63);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_no` int(8) NOT NULL,
  `menu_name_th` varchar(256) NOT NULL,
  `menu_name_en` varchar(256) NOT NULL,
  `menu_desc` varchar(1000) DEFAULT NULL,
  `menu_price` double(10,2) NOT NULL,
  `menu_pic_path` varchar(512) DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `menu_cat_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

CREATE TABLE `menu_category` (
  `menu_cat_no` int(8) NOT NULL,
  `menu_cat_name_th` varchar(100) NOT NULL,
  `menu_cat_name_en` varchar(100) NOT NULL,
  `stock_cat_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_set`
--

CREATE TABLE `menu_set` (
  `menu_set_no` int(8) NOT NULL,
  `menu_set_name_th` varchar(256) NOT NULL,
  `menu_set_name_en` varchar(256) NOT NULL,
  `menu_set_desc` varchar(1000) NOT NULL,
  `menu_set_price` double(10,2) NOT NULL,
  `menu_set_pic_path` varchar(512) NOT NULL,
  `available` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu_set_menu`
--

CREATE TABLE `menu_set_menu` (
  `menu_set_no` int(8) NOT NULL,
  `menu_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_category`
--

CREATE TABLE `stock_category` (
  `stock_cat_no` int(8) NOT NULL,
  `stock_cat_name_TH` varchar(100) NOT NULL,
  `stock_car_name_EN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_category`
--

INSERT INTO `stock_category` (`stock_cat_no`, `stock_cat_name_TH`, `stock_car_name_EN`) VALUES
(1, 'อาหาร', 'Food'),
(2, 'ของหวาน', 'Dessert'),
(3, 'เครื่องดื่ม', 'Beverage');

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
  `emp_time_no` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `work_history`
--

INSERT INTO `work_history` (`work_hist_no`, `work_date`, `work_start`, `work_end`, `work_pay`, `work_hour`, `work_min`, `emp_no`, `emp_time_no`) VALUES
(72, '2017-07-06', NULL, NULL, 182.00, 4, 40, 3, NULL),
(76, '2017-07-09', NULL, NULL, 117.00, 3, 0, 3, NULL),
(81, '2017-07-11', NULL, NULL, 300.00, 5, 50, 55, NULL),
(83, '2017-07-13', NULL, NULL, 182.00, 4, 40, 3, NULL),
(84, '2017-07-13', NULL, NULL, 300.00, 3, 30, 55, NULL),
(90, '2017-07-17', NULL, NULL, 900.00, 18, 0, 63, NULL),
(91, '2017-07-19', NULL, NULL, 341.67, 6, 50, 63, NULL),
(92, '2017-07-22', NULL, NULL, 850.00, 17, 0, 63, NULL),
(93, '2017-07-16', NULL, NULL, 19.50, 0, 30, 3, NULL),
(94, '2017-07-27', NULL, NULL, 897.00, 23, 0, 3, NULL),
(95, '2017-07-27', NULL, NULL, 21000.00, 21, 0, 64, NULL),
(96, '2017-07-23', NULL, NULL, 52.00, 1, 20, 3, NULL),
(97, '2017-07-27', NULL, NULL, 910.00, 23, 20, 3, NULL),
(98, '2017-07-23', NULL, NULL, 74.75, 1, 55, 3, NULL);

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
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_no`),
  ADD KEY `menu_cat_no` (`menu_cat_no`);

--
-- Indexes for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD PRIMARY KEY (`menu_cat_no`),
  ADD KEY `stock_cat_no` (`stock_cat_no`);

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
  ADD KEY `menu_no` (`menu_no`);

--
-- Indexes for table `stock_category`
--
ALTER TABLE `stock_category`
  ADD PRIMARY KEY (`stock_cat_no`);

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
  MODIFY `emp_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `employee_pay`
--
ALTER TABLE `employee_pay`
  MODIFY `emp_pay_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `emp_pos_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `employee_table`
--
ALTER TABLE `employee_table`
  MODIFY `emp_time_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `menu_cat_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu_set`
--
ALTER TABLE `menu_set`
  MODIFY `menu_set_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_category`
--
ALTER TABLE `stock_category`
  MODIFY `stock_cat_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `work_history`
--
ALTER TABLE `work_history`
  MODIFY `work_hist_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
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
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`menu_cat_no`) REFERENCES `menu_category` (`menu_cat_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_category`
--
ALTER TABLE `menu_category`
  ADD CONSTRAINT `menu_category_ibfk_1` FOREIGN KEY (`stock_cat_no`) REFERENCES `stock_category` (`stock_cat_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_set_menu`
--
ALTER TABLE `menu_set_menu`
  ADD CONSTRAINT `menu_set_menu_ibfk_1` FOREIGN KEY (`menu_set_no`) REFERENCES `menu_set` (`menu_set_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_set_menu_ibfk_2` FOREIGN KEY (`menu_no`) REFERENCES `menu` (`menu_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work_history`
--
ALTER TABLE `work_history`
  ADD CONSTRAINT `work_history_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `work_history_ibfk_2` FOREIGN KEY (`emp_time_no`) REFERENCES `employee_table` (`emp_time_no`) ON DELETE SET NULL ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
