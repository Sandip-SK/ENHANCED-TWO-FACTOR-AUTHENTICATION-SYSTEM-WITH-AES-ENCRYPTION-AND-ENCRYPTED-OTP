-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2021 at 05:41 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nis`
--

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `email` varchar(30) NOT NULL,
  `kys` varbinary(500) NOT NULL,
  `iv` varbinary(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`email`, `kys`, `iv`) VALUES
('akarshbhadani@gmail.com', 0x159c5f78036307732210deaaa6b21f5bb59cb0251bd5c583438adeff13b3c4b8, 0x1570e6712aa61678829387d867b14b4e),
('sandipkundu06031999@gmail.com', 0xc43236d6c84180853c52155609c74d163816360c38c365f10a73c5f71110bda6, 0xf7bc053bd3fe03523558c8bd12c8f508),
('xyz@gmail.com', 0x049a3d0aa001030c6e29029df4b53c23284cb3d5df639c62eee25adabf474899, 0x24f654b880ddd6a19ede74ced31ab473);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `username` varchar(50) NOT NULL,
  `code` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varbinary(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`email`, `username`, `password`) VALUES
('akarshbhadani@gmail.com', 'Akarsh', 0x5656696f6f436e5469724961354e5252494937706d773d3d),
('sandip@gmail.com', 'sandip', 0x7150307146445561394e4169623257756565795753673d3d),
('sandipkundu06031999@gmail.com', 'Sandip', 0x34424e586133714f516a77304a50765a334a687165513d3d),
('xyz@gmail.com', 'x', 0x57744e4d3872704e454235784f384f763074636164413d3d);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
