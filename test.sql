-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2022 at 11:31 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `migration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `created_at`) VALUES
(1, 'm0001_initial.php', '2022-10-29 15:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `description` varchar(512) NOT NULL,
  `type` varchar(50) NOT NULL,
  `weight` decimal(10,3) NOT NULL DEFAULT 0.000,
  `width` decimal(10,3) NOT NULL DEFAULT 0.000,
  `height` decimal(10,3) NOT NULL DEFAULT 0.000,
  `length` decimal(10,3) NOT NULL DEFAULT 0.000,
  `size` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `price`, `description`, `type`, `weight`, `width`, `height`, `length`, `size`, `created_at`) VALUES
(32, 'productsku2', 'product2', '123.00', 'desc2', 'Book', '3.000', '0.000', '0.000', '0.000', 0, '2022-11-13 03:08:03'),
(34, 'productsku4', 'product4', '123.00', 'desc4', 'Book', '5.000', '0.000', '0.000', '0.000', 0, '2022-11-13 03:09:22'),
(36, 'productsku6', 'product6', '112.00', 'desc6', 'Book', '33.000', '0.000', '0.000', '0.000', 0, '2022-11-13 05:26:50'),
(37, 'productsku1', 'product1', '123.00', 'desc', 'Book', '3.000', '0.000', '0.000', '0.000', 0, '2022-11-13 05:55:34'),
(38, 'productsku3', 'product3', '123.00', 'desc', 'Book', '30.000', '0.000', '0.000', '0.000', 0, '2022-11-13 07:12:18'),
(39, 'productsku5', 'product5', '123.00', 'desc', 'Book', '33.000', '0.000', '0.000', '0.000', 0, '2022-11-13 07:15:36'),
(40, 'productsku7', 'product7', '123.00', 'desc', 'Book', '123.000', '0.000', '0.000', '0.000', 0, '2022-11-13 07:17:57'),
(41, 'productsku8', 'product8', '111.00', 'desc', 'Furniture', '0.000', '12.000', '13.000', '11.000', 0, '2022-11-13 07:21:27'),
(42, 'productsku9', 'productsku9', '122.00', 'desc9', 'dvd', '0.000', '0.000', '0.000', '0.000', 11, '2022-11-13 07:49:25'),
(45, 'productsku10', 'product10', '123.00', 'desc', 'dvd', '0.000', '0.000', '0.000', '0.000', 123, '2022-11-13 09:57:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
