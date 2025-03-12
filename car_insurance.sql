-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 11, 2025 at 09:59 PM
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
-- Database: `car_insurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE `accident` (
  `report_number` varchar(100) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`report_number`, `date`, `location`) VALUES
('AR2197', '2012-05-10', 'Dhaka'),
('BR3301', '2021-09-15', 'Chattogram'),
('CR4402', '2012-11-20', 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `license` varchar(100) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`license`, `model`, `year`) VALUES
('AABB2000', 'Toyota', '2015'),
('CCXX3001', 'Honda', '2018'),
('DDYY4002', 'BMW', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE `owns` (
  `driver_id` varchar(100) NOT NULL,
  `license` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `owns`
--

INSERT INTO `owns` (`driver_id`, `license`) VALUES
('101', 'AABB2000'),
('102', 'CCXX3001'),
('103', 'DDYY4002');

-- --------------------------------------------------------

--
-- Table structure for table `participated`
--

CREATE TABLE `participated` (
  `driver_id` varchar(100) NOT NULL,
  `car` varchar(50) NOT NULL,
  `report_number` varchar(100) NOT NULL,
  `damage_amount` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participated`
--

INSERT INTO `participated` (`driver_id`, `car`, `report_number`, `damage_amount`) VALUES
('101', 'AABB2000', 'AR2197', 20000),
('102', 'CCXX3001', 'BR3301', 15000),
('103', 'DDYY4002', 'CR4402', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `driver_id` varchar(100) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`driver_id`, `name`, `address`) VALUES
('101', 'Abul Kalam', 'Dhaka'),
('102', 'Rahim Mia', 'Chattogram'),
('103', 'Karim Ali', 'Khulna');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident`
--
ALTER TABLE `accident`
  ADD PRIMARY KEY (`report_number`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`license`);

--
-- Indexes for table `owns`
--
ALTER TABLE `owns`
  ADD PRIMARY KEY (`driver_id`,`license`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `participated`
--
ALTER TABLE `participated`
  ADD PRIMARY KEY (`driver_id`,`car`,`report_number`),
  ADD KEY `car` (`car`),
  ADD KEY `report_number` (`report_number`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`driver_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`license`) REFERENCES `car` (`license`);

--
-- Constraints for table `participated`
--
ALTER TABLE `participated`
  ADD CONSTRAINT `participated_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `participated_ibfk_2` FOREIGN KEY (`car`) REFERENCES `car` (`license`),
  ADD CONSTRAINT `participated_ibfk_3` FOREIGN KEY (`report_number`) REFERENCES `accident` (`report_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
