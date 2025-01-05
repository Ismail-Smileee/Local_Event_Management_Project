-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 06:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(10) NOT NULL,
  `Name` varchar(14) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Name`, `Email`, `Password`) VALUES
(1, 'ismail', 'ismail@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` int(100) NOT NULL,
  `User_ID` int(100) NOT NULL,
  `Resource_ID` int(100) NOT NULL,
  `Event_ID` int(100) NOT NULL,
  `BookingDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ID`, `User_ID`, `Resource_ID`, `Event_ID`, `BookingDate`) VALUES
(1, 1, 1, 1, '2024-09-26');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `Event_ID` int(100) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Descriptions` varchar(200) NOT NULL,
  `Date` date NOT NULL,
  `Admin_ID` int(10) NOT NULL,
  `Time` varchar(8) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Organizer_ID` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`Event_ID`, `Title`, `Descriptions`, `Date`, `Admin_ID`, `Time`, `Location`, `Organizer_ID`) VALUES
(1, 'Sports event', 'iug 7ugiu ', '2024-09-26', 1, '11 am', 'Uits arena', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `Organizer_ID` int(50) NOT NULL,
  `Name` varchar(14) NOT NULL,
  `Contactinfo` varchar(100) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`Organizer_ID`, `Name`, `Contactinfo`, `Email`) VALUES
(1, 'ismail', 'iu uit7u8 76y', 'ismail@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(100) NOT NULL,
  `Name` varchar(14) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Availibility` varchar(20) NOT NULL,
  `Admin_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`Resource_ID`, `Name`, `Type`, `Availibility`, `Admin_ID`) VALUES
(1, 'ismail', 'Ball,Bat', '3,2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(100) NOT NULL,
  `Name` varchar(14) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `Name`, `Email`, `Phone`) VALUES
(1, 'Hossain', 'hossain@gmail.com', 1234567891);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Event_ID` (`Event_ID`),
  ADD KEY `Resource_ID` (`Resource_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`Event_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `Organizer_ID` (`Organizer_ID`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`Organizer_ID`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `event` (`Event_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Resource_ID`) REFERENCES `resource` (`Resource_ID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`Organizer_ID`) REFERENCES `organizer` (`Organizer_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
