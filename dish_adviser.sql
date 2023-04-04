-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2023 at 10:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dish_adviser`
--

-- --------------------------------------------------------

--
-- Table structure for table `bigdata`
--

CREATE TABLE `bigdata` (
  `dish_name` varchar(30) NOT NULL,
  `ing1` varchar(30) NOT NULL,
  `ing2` varchar(30) NOT NULL,
  `ing3` varchar(30) NOT NULL,
  `ing4` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bigdata`
--

INSERT INTO `bigdata` (`dish_name`, `ing1`, `ing2`, `ing3`, `ing4`) VALUES
('dosa', 'potatoes', 'flour', 'oil', 'spices'),
('biryani', 'rice', 'spices', 'vegetables', 'chicken'),
('chilaquiles', 'oil', 'red sauce', 'tortillas', 'cheese'),
('pasta', 'red sauce', 'butter', 'cream', 'oil'),
('pizza', 'cheese', 'red sauce', 'flour', 'oregano'),
('risotto', 'cheese', 'garlic', 'butter', 'parmesan'),
('samosa', 'potatoes', 'oil', 'peas', 'flour'),
('taco', 'tomatoes', 'beef', 'chicken', 'cheese');

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `origin_name` varchar(30) NOT NULL,
  `dish_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`origin_name`, `dish_name`) VALUES
('indian', 'biryani'),
('mexican', 'chilaquiles'),
('indian', 'dosa'),
('italian', 'pasta'),
('italian', 'pizza'),
('italian', 'risotto'),
('indian', 'samosa'),
('mexican', 'taco');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bigdata`
--
ALTER TABLE `bigdata`
  ADD KEY `dish_name` (`dish_name`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`dish_name`,`origin_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bigdata`
--
ALTER TABLE `bigdata`
  ADD CONSTRAINT `bigdata_ibfk_1` FOREIGN KEY (`dish_name`) REFERENCES `origin` (`dish_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
