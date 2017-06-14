-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2017 at 11:59 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_no` int(8) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_tel` varchar(20) DEFAULT NULL,
  `emp_type` varchar(30) NOT NULL,
  `pay_type` varchar(30) NOT NULL,
  `pay` double(8,2) NOT NULL,
  `branch_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_no`, `emp_name`, `emp_tel`, `emp_type`, `pay_type`, `pay`, `branch_no`) VALUES
(1, '2', '3', '4', '5', 6.00, 7);

-- --------------------------------------------------------

--
-- Table structure for table `employee_pay`
--

CREATE TABLE `employee_pay` (
  `emp_pay_no` int(8) NOT NULL,
  `pay` double(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `emp_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_position`
--

CREATE TABLE `employee_position` (
  `emp_pos_no` int(8) NOT NULL,
  `emp_pos_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_table`
--

CREATE TABLE `employee_table` (
  `emp_time_no` int(8) NOT NULL,
  `date` date NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `emp_pos_no` int(8) NOT NULL,
  `emp_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `work_history`
--

CREATE TABLE `work_history` (
  `work_hist_no` int(11) NOT NULL,
  `work_start` int(11) NOT NULL,
  `work_end` int(11) DEFAULT NULL,
  `work_pay` int(11) DEFAULT NULL,
  `emp_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_no`);

--
-- Indexes for table `employee_pay`
--
ALTER TABLE `employee_pay`
  ADD PRIMARY KEY (`emp_pay_no`),
  ADD KEY `emp_no` (`emp_no`);

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
-- Indexes for table `work_history`
--
ALTER TABLE `work_history`
  ADD PRIMARY KEY (`work_hist_no`),
  ADD KEY `emp_no` (`emp_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_pay`
--
ALTER TABLE `employee_pay`
  MODIFY `emp_pay_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_position`
--
ALTER TABLE `employee_position`
  MODIFY `emp_pos_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee_table`
--
ALTER TABLE `employee_table`
  MODIFY `emp_time_no` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `work_history`
--
ALTER TABLE `work_history`
  MODIFY `work_hist_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

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
-- Constraints for table `work_history`
--
ALTER TABLE `work_history`
  ADD CONSTRAINT `work_history_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employee` (`emp_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
