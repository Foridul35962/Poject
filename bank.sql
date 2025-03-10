-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2025 at 11:30 PM
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
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_number` varchar(100) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `balance` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `branch_name`, `balance`) VALUES
('S001', 'Main', 5000),
('S002', 'East', 7000),
('S003', 'West', 9000),
('S004', 'Main', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `customer_name` varchar(200) NOT NULL,
  `loan_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`customer_name`, `loan_number`) VALUES
('Alice', 'L001'),
('Bob', 'L002'),
('Charlie', 'L003'),
('David', 'L001');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_name` varchar(200) NOT NULL,
  `branch_city` varchar(100) DEFAULT NULL,
  `assests` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_name`, `branch_city`, `assests`) VALUES
('East', 'Boston', 3000000),
('Main', 'New York', 5000000),
('West', 'Los Angeles', 4000000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_name` varchar(200) NOT NULL,
  `customer_street` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_name`, `customer_street`, `customer_city`) VALUES
('Alice', '123 Main St', 'New York'),
('Bob', '456 Elm St', 'Boston'),
('Charlie', '789 Maple St', 'Los Angeles'),
('David', '321 Oak St', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `customer_name` varchar(200) NOT NULL,
  `account_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`customer_name`, `account_number`) VALUES
('Alice', 'S001'),
('Alice', 'S004'),
('Bob', 'S002'),
('Charlie', 'S003'),
('David', 'S004');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_number` varchar(100) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `amount` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_number`, `branch_name`, `amount`) VALUES
('L001', 'Main', 10000),
('L002', 'East', 15000),
('L003', 'West', 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_number`),
  ADD KEY `branch_name` (`branch_name`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`customer_name`,`loan_number`),
  ADD KEY `loan_number` (`loan_number`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_name`);

--
-- Indexes for table `depositor`
--
ALTER TABLE `depositor`
  ADD PRIMARY KEY (`customer_name`,`account_number`),
  ADD KEY `account_number` (`account_number`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_number`),
  ADD KEY `branch_name` (`branch_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`);

--
-- Constraints for table `borrower`
--
ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),
  ADD CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`);

--
-- Constraints for table `depositor`
--
ALTER TABLE `depositor`
  ADD CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`customer_name`) REFERENCES `customer` (`customer_name`),
  ADD CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `account` (`account_number`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`branch_name`) REFERENCES `branch` (`branch_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
