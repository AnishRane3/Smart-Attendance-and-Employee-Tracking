-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2023 at 02:35 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeemanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `disc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `disc`) VALUES
(1, 'Head', 'Administrator Department'),
(2, 'Office', 'IT Department'),
(3, 'Sales', 'Salesman Department'),
(4, 'Factory', 'Factory Worker'),
(6, 'Marketing', 'Marketing Department');

-- --------------------------------------------------------

--
-- Table structure for table `emp_attendance`
--

CREATE TABLE `emp_attendance` (
  `id` int(11) NOT NULL,
  `attendance_date` varchar(10) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `checkin` timestamp(5) NULL DEFAULT NULL,
  `checkout` timestamp(5) NULL DEFAULT NULL,
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `total_hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_attendance`
--

INSERT INTO `emp_attendance` (`id`, `attendance_date`, `emp_id`, `checkin`, `checkout`, `longitude`, `latitude`, `total_hours`) VALUES
(7, '2021-04-19', 2, '2021-04-21 01:22:56.39772', '2021-04-21 06:36:34.00077', '', '', 5),
(8, '2021-04-21', 2, '2021-04-21 06:37:13.00081', NULL, '', '', NULL),
(9, '2021-04-21', 1, '2021-04-21 06:39:31.00053', NULL, '', '', NULL),
(10, '2022-04-10', 1, '2022-04-10 10:07:45.00089', '2022-04-10 10:53:02.00071', '', '', 0),
(11, '2022-04-10', 4, '2022-04-10 10:09:17.00063', NULL, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emp_leave`
--

CREATE TABLE `emp_leave` (
  `id` int(11) NOT NULL,
  `emp_id` int(10) NOT NULL,
  `fromdt` varchar(10) NOT NULL,
  `todt` varchar(10) NOT NULL,
  `discription` varchar(255) NOT NULL,
  `isapprove` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_leave`
--

INSERT INTO `emp_leave` (`id`, `emp_id`, `fromdt`, `todt`, `discription`, `isapprove`) VALUES
(1, 1, '2021-04-03', '2021-04-04', 'Weekend Lockdown', 0),
(3, 1, '2021-04-24', '2021-04-30', 'Lockdown', 1),
(4, 1, '2021-06-21', '2021-06-27', 'Family Trip', 2),
(5, 3, '2021-04-10', '2021-04-11', 'Weekend Lock Down', 1),
(6, 3, '2021-04-16', '2021-04-30', 'Lock down', 0),
(7, 3, '2021-07-01', '2021-07-11', 'Family Trip', 2),
(8, 4, '2021-04-10', '2021-04-11', 'Weekend Lock Down', 0),
(9, 4, '2021-04-15', '2021-04-30', 'Lockdown', 1),
(10, 4, '2021-06-02', '2021-06-13', 'Going to Village', 2),
(12, 2, '2021-04-09', '2021-04-09', 'Casual', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `department` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`, `department`) VALUES
(1, 'admin', 'admin@gmail.com', '123456', 'admin', 1),
(2, 'saud', 'saud@gmail.com', '123456', 'emp', 2),
(3, 'Veer', 'veer@gmail.com', '123456', 'admin', 2),
(4, 'Ramesh Babu', 'ramesh@gmail.com', '123456', 'emp', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_leave`
--
ALTER TABLE `emp_leave`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emp_attendance`
--
ALTER TABLE `emp_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `emp_leave`
--
ALTER TABLE `emp_leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
