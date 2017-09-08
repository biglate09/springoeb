-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2017 at 09:46 PM
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
  `branch_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_no`, `branch_name`) VALUES
(1, 'สาขาหลัก บางแสน'),
(2, 'สาขารอง บางแค'),
(3, 'สาขารอง เอกมัย');

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
(1, 11, 1),
(2, 11, 0),
(3, 11, 0);

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
(116, 'ส่วนผสมอีกที', -120, '2017-09-09', '02:20:25', NULL, NULL, 15, 1, 112);

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
(11, 'ซาลาเปาหมูแดงทอด', 'Fried Red Pork Bun', 'ซาลาเปาหมูแดงทอดแสนอร่อย หอมกรุ่น', 30.00, '1504672276939Bann.png', 'M', 0, 3);

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
(2, 'ติ่มซำ', 'Dim-sum', 1),
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
(11, 9, 15),
(11, 10, 10),
(11, 13, 30);

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
  MODIFY `mat_hist_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
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
  MODIFY `menu_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
