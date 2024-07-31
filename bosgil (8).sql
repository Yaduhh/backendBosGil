-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2024 at 05:31 PM
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
-- Database: `bosgil`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `typemenu` int(11) NOT NULL,
  `picture` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `type` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `typemenu`, `picture`, `name`, `detail`, `price`, `type`, `status`, `stock`) VALUES
(1, 1, 'paketBosgilDada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1, 0),
(2, 1, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1, 0),
(3, 1, 'ayamSeekor.jpg', 'Ayam 1 Ekor', 'Ayam 1 Ekor + Sambal', 60000, 1, 1, 0),
(7, 2, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1, 35),
(8, 2, 'ayamPaha.jpg', 'Paket Paha BOSGIL', 'Nasi + Ayam Paha + Sambal', 30000, 1, 1, 61),
(11, 2, 'paketbosgildada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1, 72),
(12, 2, 'nasiKambing.jpg', 'Paket Kambing Bosgil', 'Nasi + Kambing Bosgil + Sambal', 75000, 1, 1, 83),
(15, 3, 'loyangMiniAyam.jpg', 'Loyang Mini Ayam', 'Nasi + 3 Ayam + Sambal', 100000, 1, 1, 85),
(16, 3, 'loyangSedangAyam.jpg', 'Loyang Sedang Ayam', 'Nasi + 5 Potong Ayam + Sambal', 160000, 1, 1, 81),
(17, 3, 'loyangBesar10Ayam.jpg', 'Loyang Ayam Besar', 'Nasi + 10 Potong Ayam + Sambal', 310000, 1, 1, 78),
(18, 3, 'loyangMiniKambing.jpg', 'Loyang Mini Kambing', 'Nasi+ 3 Porong Kambing + Sambal', 210000, 1, 1, 90),
(19, 3, 'loyangSedangKambing.jpg', 'Loyang Kambing Sedang', 'Nasi + 5 Potong Kambing + Sambal', 310000, 1, 1, 89),
(20, 3, 'loyangBesarKambing.jpg', 'Loyang Besar Kambing', 'Nasi + 10 Potong Kambing + Sambal', 610000, 1, 1, 89),
(21, 3, 'loyangMiniMix.jpg', 'Loyang Mini MIX', 'Nasi + 2 Ayam + 1 Potong Kambing + Sambal', 160000, 1, 1, 89),
(22, 3, 'loyangSedangMix.jpg', 'Loyang MIX Sedang', 'Nasi + 3 Ayam + 2 Kambing + Sambal', 260000, 1, 1, 93),
(23, 3, 'loyangBesarMix.jpg', 'Loyang Besar MIX', 'Nasi + 5 Ayam + 5 Kambing + Sambal', 510000, 1, 1, 92),
(24, 4, 'esTeh.jpg', 'Teh Bos', 'Es Teh Manis', 8000, 2, 1, 0),
(25, 4, 'tehTarikDingin.jpg', 'Teh Tarik', 'Es Teh Susu', 10000, 2, 1, 0),
(26, 4, 'cocacola.jpg', 'Coca Cola', 'Coca Cola', 8000, 2, 1, 63),
(27, 4, 'airMineral.jpg', 'Air Mineral', 'Air Mineral 600 Ml', 7000, 2, 1, 57),
(28, 4, 'fanta.jpg', 'Fanta', 'Soft Drink', 8000, 2, 1, 70),
(29, 4, 'sprite.jpg', 'Sprite', 'Soft Drink', 8000, 2, 1, 71),
(30, 5, 'kambingPerpotong.jpg', 'Kambing Perpotong', 'Kambing Perpotong + Sambal', 60000, 1, 1, 79),
(31, 5, 'sambalBungkus.jpg', 'Sambol Bungkus', 'Sambal Bosgil Perporsi', 5000, 1, 1, 87),
(33, 5, 'nasi.jpg', 'Nasi Saja', 'Nasi + Sambal', 19000, 1, 1, 88),
(34, 5, 'sambalBotol.jpg', 'Sambal Botol', 'Sambal Bosgil Perbotol', 25000, 1, 1, 59),
(37, 5, 'ayamPaha.jpg', 'Ayam Paha Bosgil', 'Ayam Perpotong + Sambal', 25000, 1, 1, 89),
(38, 5, 'ayamDadaPerpotong.jpg', 'Ayam Bossgil Dada', 'Ayam Perpotong + Sambal', 25000, 1, 1, 88);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pesanan` text NOT NULL,
  `normalprice` double NOT NULL,
  `price` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `refund` double NOT NULL,
  `pay` double NOT NULL,
  `progress` tinyint(1) NOT NULL,
  `cashier` int(11) DEFAULT NULL,
  `noted` text NOT NULL,
  `image` text NOT NULL,
  `nophone` double NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `ongkir` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `pesanan`, `normalprice`, `price`, `status`, `date`, `refund`, `pay`, `progress`, `cashier`, `noted`, `image`, `nophone`, `alamat`, `ongkir`) VALUES
(223, 'Andre', '[{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7}]', 49000, 49000, 1, '2024-06-20 13:12:50', 1000, 50000, 1, 5, '', '', 0, '', 0),
(224, 'Putra Anggara', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":2},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":2},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":2}]', 6271000, 6271000, 1, '2024-07-19 13:44:34', 0, 6271000, 1, 5, 'Kambing Ga pedes, ayam pedes semua', 'Putra_Anggara_2024-07-19_13-45-47.jpg', 0, '', 0),
(225, 'Amanda Monopo', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 114000, 114000, 1, '2024-07-19 13:46:17', 1000, 115000, 1, 5, '', '', 0, '', 0),
(226, 'Angie Marcheria', '[{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 270000, 270000, 1, '2024-07-19 13:47:23', 30000, 300000, 1, 5, '', '', 0, '', 0),
(227, 'Xaviera Saputri', '[{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":4},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 335000, 335000, 1, '2024-07-19 13:47:40', 0, 335000, 1, 5, '', '', 0, '', 0),
(228, 'Deddy Corbuzier', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-19 13:52:11', 10000, 300000, 1, 5, '', '', 0, '', 0),
(229, 'Hamdan', '[{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 540000, 540000, 1, '2024-07-19 13:52:24', 60000, 600000, 1, 5, '', '', 0, '', 0),
(230, 'Mahira', '[{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":1}]', 1325000, 1325000, 1, '2024-07-19 13:52:42', 8675000, 10000000, 1, 5, '', '', 0, '', 0),
(231, 'Alfiah Nurlatifah', '[{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":1},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2}]', 2202000, 2202000, 1, '2024-07-19 13:53:15', 298000, 2500000, 1, 5, '', '', 0, '', 0),
(232, 'Joe Biden', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1}]', 67000, 67000, 1, '2024-07-19 13:53:35', 1000, 68000, 1, 5, '', '', 0, '', 0),
(233, 'Gibran Rakabuming', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2}]', 59000, 59000, 1, '2024-07-19 13:54:05', 1000, 60000, 1, 5, '', '', 0, '', 0),
(234, 'Adelia Putri', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 208000, 208000, 1, '2024-07-19 13:54:29', 2000, 210000, 1, 5, '', '', 0, '', 0),
(235, 'Rawles', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 330000, 330000, 1, '2024-07-19 13:55:01', 20000, 350000, 1, 5, '', '', 0, '', 0),
(236, 'Valen Divansyah', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 295000, 295000, 1, '2024-07-19 13:55:29', 5000, 300000, 1, 5, '', '', 0, '', 0),
(237, 'H. Thoriq', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":3},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 301000, 301000, 1, '2024-07-19 13:57:00', 0, 301000, 1, 5, '', '', 0, '', 0),
(238, 'Sumanto', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 405000, 405000, 1, '2024-07-19 13:57:44', 15000, 420000, 1, 5, '', '', 0, '', 0),
(239, 'Acep Triatna', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 350000, 350000, 1, '2024-07-19 13:58:03', 0, 350000, 1, 5, '', '', 0, '', 0),
(240, 'Ujang', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":4},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":3}]', 343000, 343000, 1, '2024-07-19 13:58:36', 0, 343000, 1, 5, '', '', 0, '', 0),
(241, 'Gamal Shine', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":3},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":3}]', 79000, 79000, 1, '2024-07-19 13:59:12', 1000, 80000, 1, 5, '', '', 0, '', 0),
(242, 'Faril Ritonga', '[{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":8},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":4},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 418000, 418000, 1, '2024-07-19 14:00:06', 2000, 420000, 1, 5, '', '', 0, '', 0),
(243, 'Dora The Explorer', '[{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":3},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 163000, 163000, 1, '2024-07-19 14:01:04', 0, 163000, 1, 5, '', '', 0, '', 0),
(244, 'Madun', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 255000, 255000, 1, '2024-07-19 14:03:02', 0, 255000, 1, 5, '', '', 0, '', 0),
(245, 'Opet', '[{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":4}]', 120000, 120000, 1, '2024-07-19 14:27:11', 30000, 150000, 1, 5, '', '', 0, '', 0),
(248, 'Dila intan Prisilia', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2}]', 75000, 75000, 1, '2024-07-19 17:16:32', 0, 75000, 1, 5, '', 'Dila_intan_Prisilia_2024-07-19_17-33-53.jpg', 0, '', 0),
(250, 'Xaviera', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 220000, 220000, 1, '2024-07-21 20:18:37', 5000, 225000, 1, 5, '', '', 0, '', 0),
(251, 'Kak Ros', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1}]', 151000, 151000, 1, '2024-07-21 20:22:57', 4000, 155000, 1, 5, 'Sambal dipisah', 'Kak_Ros_2024-07-21_20-26-36.jpg', 0, '', 0),
(252, 'Amanda Salsabila', '[{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":3},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 555000, 555000, 1, '2024-07-26 09:46:05', 0, 555000, 1, 5, 'Sambal Dipisah', 'Amanda_Salsabila_2024-07-26_10-07-03.jpg', 0, '', 0),
(253, 'Pesanan', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 110000, 1, '2024-07-26 09:46:56', 40000, 150000, 1, 5, '', '', 0, '', 0),
(254, 'Galuh', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":4}]', 100000, 100000, 1, '2024-07-26 09:47:43', 0, 100000, 1, 5, '', '', 0, '', 0),
(255, 'Barong', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":50}]', 500000, 500000, 1, '2024-07-26 09:48:28', 0, 500000, 1, 5, '', '', 0, '', 0),
(256, 'Wilie Salim', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1}]', 67000, 67000, 1, '2024-07-26 09:49:30', 3000, 70000, 1, 5, '', '', 0, '', 0),
(257, 'Venny Noer', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":3},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":4},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":5},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":4},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":3},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":4},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":4},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":4},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":4},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":25},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":30},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 9891000, 9891000, 1, '2024-07-26 09:50:40', 109000, 10000000, 1, 5, '', '', 0, '', 0),
(258, 'Jhon Lbf', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":5},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":5},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":26},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":24},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":11},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":6},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":5},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":8},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":3},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":4},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":5},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":4},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":5},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":3},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":5},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":3},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":3},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":13},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":11},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":5},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":7},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":4},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":5},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":4},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":6}]', 13014000, 13014000, 1, '2024-07-26 09:54:32', 986000, 14000000, 1, 5, '', '', 0, '', 0),
(259, 'Jonny', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":5},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":4},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":14},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":15}]', 353000, 353000, 1, '2024-07-26 09:55:16', 7000, 360000, 1, 5, '', '', 0, '', 0),
(260, 'Prabowo', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":83}]', 664000, 664000, 1, '2024-07-26 09:58:40', 1000, 665000, 1, 5, '', '', 0, '', 0),
(261, 'Milku', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":12},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2}]', 136000, 136000, 1, '2024-07-26 09:59:34', 64000, 200000, 1, 5, '', '', 0, '', 0),
(262, 'Mahalini', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-26 10:00:50', 10000, 300000, 1, 5, '', '', 0, '', 0),
(263, 'Azka', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 320000, 320000, 1, '2024-07-26 10:01:06', 0, 320000, 1, 5, '', '', 0, '', 0),
(264, 'Hamdan', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-26 10:01:21', 10000, 300000, 1, 5, '', '', 0, '', 0),
(265, 'Jojon', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":20},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":20},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":15}]', 2600000, 2600000, 1, '2024-07-26 10:02:17', 0, 2600000, 1, 5, '', '', 0, '', 0),
(266, 'Anggara', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":14},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":14},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":37}]', 3410000, 3410000, 1, '2024-07-26 10:03:01', 90000, 3500000, 1, 5, '', '', 0, '', 0),
(267, 'Kosomo', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":4},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":5}]', 895000, 895000, 1, '2024-07-26 10:03:30', 5000, 900000, 1, 5, '', '', 0, '', 0),
(268, 'Syahda', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":10},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":8},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":11},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":2},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2}]', 3960000, 3960000, 1, '2024-07-26 10:04:30', 40000, 4000000, 1, 5, '', '', 0, '', 0),
(269, 'Gendats', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 460000, 460000, 1, '2024-07-26 10:06:32', 40000, 500000, 1, 5, '', '', 0, '', 0),
(274, 'Superman', '[{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":4}]', 28000, 28000, 1, '2024-07-26 10:41:24', 2000, 30000, 1, 5, '', '', 8990656996, '', 0),
(275, 'Rachelcia', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 110000, 1, '2024-07-26 12:42:09', 0, 110000, 1, 5, '', '', 8990656996, '', 0),
(276, 'Kumala', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2}]', 1580000, 1580000, 1, '2024-07-26 13:27:47', 420000, 2000000, 1, 5, '', '', 8990656996, '', 0),
(277, 'Gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2}]', 74000, 74000, 1, '2024-07-26 19:05:00', 1000, 75000, 1, 5, '', 'Gamal_2024-07-26_19-05-56.jpg', 8990656996, '', 0),
(278, 'Gamal', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 140000, 140000, 1, '2024-07-28 17:09:47', 5000, 145000, 1, 5, '', '', 8990656996, '', 0),
(279, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 85000, 85000, 1, '2024-07-28 17:24:48', 15000, 100000, 1, 16, '', '', 8990656996, '', 0),
(280, 'gamal', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5}]', 275000, 275000, 1, '2024-07-28 18:34:38', 25000, 300000, 1, 16, '', '', 8990656996, '', 0),
(281, 'gamal', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":10}]', 600000, 600000, 1, '2024-07-28 18:35:26', 100000, 700000, 1, 16, '', '', 8990656996, '', 0),
(282, 'gamal', '[{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":10}]', 600000, 600000, 1, '2024-07-28 18:36:30', 0, 600000, 1, 5, '', '', 81808778446, '', 0),
(283, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":15}]', 450000, 450000, 1, '2024-07-28 18:55:50', 0, 450000, 1, 5, '', '', 81808778446, '', 0),
(284, 'gamal', '[{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":7},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":5}]', 2970000, 2970000, 1, '2024-07-28 18:57:54', 30000, 3000000, 1, 5, '', '', 81808778446, '', 0),
(285, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":4}]', 280000, 280000, 1, '2024-07-28 18:59:52', 20000, 300000, 1, 5, '', '', 8990656996, '', 0),
(286, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":4},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":4}]', 340000, 340000, 1, '2024-07-28 19:00:46', 5000, 345000, 1, 5, '', '', 0, '', 0),
(287, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 230000, 230000, 1, '2024-07-28 19:02:39', 0, 230000, 1, 5, '', '', 8990656996, '', 0),
(288, 'gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 200000, 200000, 1, '2024-07-28 19:03:06', 0, 200000, 1, 5, '', '', 0, '', 0),
(289, 'Vivi Putri Anggraini', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 200000, 200000, 1, '2024-07-28 19:17:42', 0, 200000, 1, 5, '', '', 8990656996, 'Jl. Kp lio garut No.52', 0),
(290, 'Mahalini', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 30000, 45000, 1, '2024-07-28 20:09:30', 0, 45000, 1, 5, '', '', 8990656996, 'Jl. Kp lio garut no.52', 0),
(291, 'Putra Anggara', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 225000, 235000, 1, '2024-07-28 20:23:22', 0, 235000, 1, 5, '', '', 8990656996, 'Jl. Kp Lio Garut', 0),
(292, 'Jokowi', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 60000, 70000, 1, '2024-07-28 20:47:27', 0, 70000, 1, 5, '', '', 8990656996, 'Jl. Jendral Soedirman', 0),
(293, 'Jokowi', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 120000, 1, '2024-07-28 20:49:59', 0, 120000, 1, 5, '', '', 8990656999, 'Jakarta', 0),
(294, 'Jokowi', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":4}]', 220000, 230000, 1, '2024-07-28 20:52:16', 0, 230000, 1, 5, '', '', 8990656996, 'Bandung', 10000),
(295, 'Ironman', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 200000, 220000, 1, '2024-07-28 23:56:13', 0, 220000, 1, NULL, '', '', 8990656996, 'Jl. Khatulistiwa Sumatera Utara Block C No.21, Kecamatan Pondok Aren. Kantor DPR', 20000),
(296, 'Husen', '[{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":1},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1}]', 785000, 805000, 1, '2024-07-29 09:22:30', 0, 805000, 1, NULL, '', '', 8990656996, 'Jl. Pamulang Neraka', 20000),
(297, 'Mahira', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":1}]', 1190000, 1215000, 1, '2024-07-29 09:38:29', 0, 1215000, 1, NULL, 'Sambal Dipisah', '', 8990656996, 'Jl. Pamulang Barat Kedaya No.62 Blok C 100 Vitamin Sea', 25000),
(298, 'Naruto', '[{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2}]', 100000, 115000, 1, '2024-07-29 10:24:35', 0, 115000, 1, NULL, '', '', 8990656996, 'Jl. Desa Konoha Barat Blok C100', 15000),
(299, 'Angie Marcheria', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":1},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 169000, 189000, 1, '2024-07-29 10:31:34', 0, 189000, 1, NULL, 'Sambal Dipisah', '', 8990656996, 'Jl. Heart No. 61002', 20000),
(300, 'Angie Marcheria', '[{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":1}]', 69000, 94000, 1, '2024-07-29 10:35:02', 0, 94000, 1, NULL, 'Seperti Biasa', '', 8990656996, 'Jl. Karawaci raya Barat No.52', 25000),
(301, 'Thoriq', '[{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":1}]', 94000, 114000, 1, '2024-07-29 10:38:07', 0, 114000, 1, NULL, '', '', 8990656996, 'Jl. Pamulang barat', 20000),
(302, 'Angie Marcheria', '[{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 44000, 56000, 1, '2024-07-29 10:39:48', 0, 56000, 1, NULL, '', '', 8990656996, 'Jl. raya khatulistiwa', 12000),
(303, 'Angie Marcheria', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1}]', 109000, 129000, 1, '2024-07-29 10:45:43', 1000, 130000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut', 20000),
(304, 'Gamal', '[{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":1}]', 69000, 89000, 1, '2024-07-29 10:47:20', 1000, 90000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut', 20000),
(305, 'Jokowi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 170000, 180000, 1, '2024-07-29 12:38:21', 0, 180000, 1, NULL, 'Biasa', '', 8990656996, 'Jl. Kp lio garut', 10000),
(306, 'Jokowi', '[{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1}]', 545000, 570000, 1, '2024-07-29 12:40:40', 0, 570000, 1, NULL, '', '', 8990656996, 'Jl. Kavling kInayungan', 25000),
(307, 'Jokowi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 85000, 110000, 1, '2024-07-29 12:47:23', 0, 110000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut', 25000),
(308, 'Angie Marcheria', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 245000, 270000, 1, '2024-07-29 12:51:37', 0, 270000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio garut', 25000),
(309, 'Gamal', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 170000, 220000, 1, '2024-07-29 13:10:59', 0, 220000, 1, NULL, '', '', 8990656996, 'Kp. Ciledug Begindang Beginding Jalan Raya Sukto Djoyo Diningrat', 50000),
(310, 'Gamal', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 145000, 165000, 1, '2024-07-29 13:13:57', 0, 165000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut No52 Jakarta Barat Bintaro Tangsel', 20000),
(311, 'Angie Marcheria', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 140000, 165000, 1, '2024-07-29 13:21:15', 0, 165000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut No.,52', 25000),
(312, 'jokowi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 115000, 130000, 1, '2024-07-29 13:33:25', 0, 130000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio garut no,52 jakarta pondok pinang karawaci', 15000),
(313, 'Angie Marcheria', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 85000, 108000, 1, '2024-07-29 13:36:43', 0, 108000, 1, NULL, '', '', 8990656996, 'Jl. kp Lio hgarut no 52 pamulang barat jhakarta barat', 23000),
(314, 'gamal', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 115000, 130000, 1, '2024-07-29 13:39:01', 0, 130000, 1, NULL, '', '', 0, 'jl.kp lio garut no232', 15000),
(315, 'Gamal', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 195000, 220000, 1, '2024-07-29 13:41:36', 0, 220000, 1, NULL, '', '', 8990656996, 'jl.kp lio garut no9421', 25000),
(316, 'Kalimasada', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 140000, 165000, 1, '2024-07-29 13:47:40', 0, 165000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio garut no52', 25000),
(317, 'Gigi', '[{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":1}]', 1090000, 1115000, 1, '2024-07-29 14:00:55', 0, 1115000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio Garut No52 Bintaro Tangerang Selatan', 25000),
(318, 'gigi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3}]', 165000, 190000, 1, '2024-07-29 14:07:00', 0, 190000, 1, NULL, '', '', 8990656996, 'jl. kp lio garut no.52 jakarta barat bintaro tangsel', 25000),
(319, 'gigi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 170000, 205000, 1, '2024-07-29 14:10:13', 0, 205000, 1, NULL, '', '', 8990656996, 'Jl. Kp lio garut ciledug pamulang barat, Banten vs jakarta Barat dan karawaci', 35000),
(320, 'Angie Mc', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":1},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":1}]', 2000000, 2025000, 1, '2024-07-29 14:28:12', 0, 2025000, 1, NULL, '', '', 8990656996, 'Jl. Kp Lio', 25000),
(321, 'jokowi', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 200000, 235000, 1, '2024-07-29 14:31:03', 0, 235000, 1, NULL, 'Seperti Biasa', 'jokowi_2024-07-29_14-39-39.jpg', 8990656996, 'Jl. Kp Lio Garut Bo.52 Tangerang Selatan , Banten ', 35000),
(322, 'angie mc', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1}]', 345000, 370000, 1, '2024-07-29 14:40:45', 0, 370000, 1, NULL, '', 'angie_mc_2024-07-29_14-55-10.jpg', 8990656996, 'Jl. Kp Lio Garut No.52 Jakarta Barat Indah Purnama Wati', 25000),
(323, 'mahalini', '[{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":1},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":1},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":1}]', 2050000, 2075000, 1, '2024-07-29 16:17:36', 0, 2075000, 1, NULL, '', 'mahalini_2024-07-30_21-45-17.jpg', 8990656996, 'Pegangsaan timur No.56 Jakarta', 25000),
(324, 'Gamrush', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 115000, 140000, 1, '2024-07-30 21:50:49', 0, 140000, 1, NULL, '', 'Gamrush_2024-07-30_21-51-14.jpg', 8990656996, 'Jl. Ciledug Pamulang Barat Daya Book C-17 No.52', 25000),
(325, 'Vegantropus', '[{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1}]', 570000, 605000, 1, '2024-07-30 21:54:06', 0, 605000, 1, NULL, '', 'Vegantropus_2024-07-30_21-54-28.jpg', 8990656996, 'Jl. Jakarta Selatan Bintaro BSD Kemayoran', 35000),
(327, 'Cahyono', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 145000, 170000, 1, '2024-07-31 21:38:39', 0, 170000, 1, 5, '', 'Cahyono_2024-07-31_21-38-59.jpg', 8990656996, 'Jl. Pamulang Barat Daya Bintaro Sektor 9', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `gender`, `birthday`, `createdAt`, `status`) VALUES
(5, 'Vega Anggara', 'vegaspro@gmail.com', 'adf8433f6a83858e2b6f6bb204845ff5', 2, 0, '2002-10-06', '2024-06-28', 0),
(16, 'Xaviera Coc', 'xaviera@gmail.com', 'adf8433f6a83858e2b6f6bb204845ff5', 1, 1, '2002-10-06', '2024-07-21', 0),
(21, 'Clara Sinta', 'clara@gmail.com', 'c65cd64c6a443c98405b8ef8016d7a4e', 3, 1, '2002-10-06', '2024-07-28', 0),
(24, 'Angie Marcheria', 'angie@gmail.com', 'c65cd64c6a443c98405b8ef8016d7a4e', 1, 1, '2002-10-06', '2024-07-28', 0),
(26, 'Caitlin', 'cairlin@gmail.com', '66ec9e6680c63a892714f4880ecc1ec5', 1, 1, '2002-10-10', '2024-07-31', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users` (`cashier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`cashier`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
