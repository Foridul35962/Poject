-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2025 at 01:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forid_bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `AccountNumber` int(11) NOT NULL,
  `BranchName` varchar(50) DEFAULT NULL,
  `Balance` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`AccountNumber`, `BranchName`, `Balance`) VALUES
(101, 'Main', 2000.00),
(102, 'Central', 3000.00),
(103, 'Main', 1500.00),
(104, 'Downtown', 5000.00),
(105, 'Central', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `borrower`
--

CREATE TABLE `borrower` (
  `CustomerID` int(11) NOT NULL,
  `LoanNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `borrower`
--

INSERT INTO `borrower` (`CustomerID`, `LoanNumber`) VALUES
(2, 201),
(3, 203),
(4, 202),
(5, 204);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchName` varchar(50) NOT NULL,
  `BranchCity` varchar(50) DEFAULT NULL,
  `Assets` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchName`, `BranchCity`, `Assets`) VALUES
('Central', 'Chicago', 3000000.00),
('Downtown', 'Los Angeles', 4000000.00),
('Main', 'New York', 5000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `CustomerStreet` varchar(50) DEFAULT NULL,
  `CustomerCity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerStreet`, `CustomerCity`) VALUES
(1, 'Alice', '123 Street', 'New York'),
(2, 'Bob', '456 Avenue', 'Chicago'),
(3, 'Alex', '789 Road', 'Los Angeles'),
(4, 'Charlie', '321 Blvd', 'Chicago'),
(5, 'Annie', '654 Lane', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `depositor`
--

CREATE TABLE `depositor` (
  `CustomerID` int(11) NOT NULL,
  `AccountNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `depositor`
--

INSERT INTO `depositor` (`CustomerID`, `AccountNumber`) VALUES
(1, 101),
(1, 103),
(2, 102),
(3, 104);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `LoanNumber` int(11) NOT NULL,
  `BranchName` varchar(50) DEFAULT NULL,
  `Amount` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`LoanNumber`, `BranchName`, `Amount`) VALUES
(201, 'Main', 10000.00),
(202, 'Central', 15000.00),
(203, 'Downtown', 20000.00),
(204, 'Main', 5000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountNumber`),
  ADD KEY `BranchName` (`BranchName`);

--
-- Indexes for table `borrower`
--
ALTER TABLE `borrower`
  ADD PRIMARY KEY (`CustomerID`,`LoanNumber`),
  ADD KEY `LoanNumber` (`LoanNumber`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchName`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `depositor`
--
ALTER TABLE `depositor`
  ADD PRIMARY KEY (`CustomerID`,`AccountNumber`),
  ADD KEY `AccountNumber` (`AccountNumber`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`LoanNumber`),
  ADD KEY `BranchName` (`BranchName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`BranchName`) REFERENCES `branch` (`BranchName`);

--
-- Constraints for table `borrower`
--
ALTER TABLE `borrower`
  ADD CONSTRAINT `borrower_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `borrower_ibfk_2` FOREIGN KEY (`LoanNumber`) REFERENCES `loan` (`LoanNumber`);

--
-- Constraints for table `depositor`
--
ALTER TABLE `depositor`
  ADD CONSTRAINT `depositor_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `depositor_ibfk_2` FOREIGN KEY (`AccountNumber`) REFERENCES `account` (`AccountNumber`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`BranchName`) REFERENCES `branch` (`BranchName`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
