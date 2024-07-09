-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2024 at 12:37 PM
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
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `typemenu`, `picture`, `name`, `detail`, `price`, `type`, `status`) VALUES
(1, 1, 'paketBosgilDada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1),
(2, 1, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1),
(3, 1, 'ayamSeekor.jpg', 'Ayam 1 Ekor', 'Ayam 1 Ekor + Sambal', 60000, 1, 1),
(7, 2, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1),
(8, 2, 'ayamPaha.jpg', 'Paket Paha BOSGIL', 'Nasi + Ayam Paha + Sambal', 30000, 1, 0),
(11, 2, 'paketbosgildada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1),
(12, 2, 'nasiKambing.jpg', 'Paket Kambing Bosgil', 'Nasi + Kambing Bosgil + Sambal', 75000, 1, 1),
(15, 3, 'loyangMiniAyam.jpg', 'Loyang Mini Ayam', 'Nasi + 3 Ayam + Sambal', 100000, 1, 1),
(16, 3, 'loyangSedangAyam.jpg', 'Loyang Sedang Ayam', 'Nasi + 5 Potong Ayam + Sambal', 160000, 1, 1),
(17, 3, 'loyangBesar10Ayam.jpg', 'Loyang Ayam Besar', 'Nasi + 10 Potong Ayam + Sambal', 310000, 1, 1),
(18, 3, 'loyangMiniKambing.jpg', 'Loyang Mini Kambing', 'Nasi+ 3 Porong Kambing + Sambal', 210000, 1, 0),
(19, 3, 'loyangSedangKambing.jpg', 'Loyang Kambing Sedang', 'Nasi + 5 Potong Kambing + Sambal', 310000, 1, 1),
(20, 3, 'loyangBesarKambing.jpg', 'Loyang Besar Kambing', 'Nasi + 10 Potong Kambing + Sambal', 610000, 1, 1),
(21, 3, 'loyangMiniMix.jpg', 'Loyang Mini MIX', 'Nasi + 2 Ayam + 1 Potong Kambing + Sambal', 160000, 1, 1),
(22, 3, 'loyangSedangMix.jpg', 'Loyang MIX Sedang', 'Nasi + 3 Ayam + 2 Kambing + Sambal', 260000, 1, 1),
(23, 3, 'loyangBesarMix.jpg', 'Loyang Besar MIX', 'Nasi + 5 Ayam + 5 Kambing + Sambal', 510000, 1, 1),
(24, 4, 'esTeh.jpg', 'Teh Bos', 'Es Teh Manis', 8000, 2, 1),
(25, 4, 'tehTarikDingin.jpg', 'Teh Tarik', 'Es Teh Susu', 10000, 2, 1),
(26, 4, 'cocacola.jpg', 'Coca Cola', 'Coca Cola', 8000, 2, 1),
(27, 4, 'airMineral.jpg', 'Air Mineral', 'Air Mineral 600 Ml', 7000, 2, 1),
(28, 4, 'fanta.jpg', 'Fanta', 'Soft Drink', 8000, 2, 1),
(29, 4, 'sprite.jpg', 'Sprite', 'Soft Drink', 8000, 2, 1),
(30, 5, 'kambingPerpotong.jpg', 'Kambing Perpotong', 'Kambing Perpotong + Sambal', 60000, 1, 1),
(31, 5, 'sambalBungkus.jpg', 'Sambol Bungkus', 'Sambal Bosgil Perporsi', 5000, 1, 1),
(33, 5, 'nasi.jpg', 'Nasi Saja', 'Nasi + Sambal', 19000, 1, 1),
(34, 5, 'sambalBotol.jpg', 'Sambal Botol', 'Sambal Bosgil Perbotol', 25000, 1, 1),
(37, 5, 'ayamPaha.jpg', 'Ayam Paha Bosgil', 'Ayam Perpotong + Sambal', 25000, 1, 1),
(38, 5, 'ayamDadaPerpotong.jpg', 'Ayam Bossgil Dada', 'Ayam Perpotong + Sambal', 25000, 1, 1);

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
  `progress` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `pesanan`, `normalprice`, `price`, `status`, `date`, `refund`, `pay`, `progress`) VALUES
(25, 'Dila Intan Prisilia', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":1}]', 108700, 119570, 1, '2024-07-06 00:29:18', 430, 120000, 1),
(26, 'Vega Anggara Saputra', '[{\"menu\":\"Special Kambing Mantan\",\"hargasatuan\":41900,\"jumlah\":2},{\"menu\":\"Mie Kambing Sapi\",\"hargasatuan\":45900,\"jumlah\":1}]', 129700, 142670, 1, '2024-07-06 00:39:20', 7330, 150000, 1),
(27, 'Mega Trimulya', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":4}]', 255300, 280830, 1, '2024-07-06 00:48:42', 9170, 290000, 1),
(28, 'Gamal Mushtofa', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":5}]', 292200, 321420, 1, '2024-07-06 10:00:47', 3580, 325000, 1),
(29, 'Faril Ritonga', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":1}]', 172500, 189750, 1, '2024-07-06 10:40:55', 10250, 200000, 1),
(30, 'Clara', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":4},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":5},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":3}]', 457600, 503360, 1, '2024-07-06 11:11:50', 1640, 505000, 1),
(31, 'Mutiara', '[{\"menu\":\"Special Kambing Mantan\",\"hargasatuan\":41900,\"jumlah\":2},{\"menu\":\"Mie Kambing Sapi\",\"hargasatuan\":45900,\"jumlah\":3},{\"menu\":\"Hati Sapi bukan Hatimu\",\"hargasatuan\":45900,\"jumlah\":5},{\"menu\":\"Spageti Kambing Jantan\",\"hargasatuan\":44200,\"jumlah\":2},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3},{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1}]', 815500, 897050, 1, '2024-07-06 12:03:07', 2950, 900000, 1),
(32, 'Gibran Rakabumingraka', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3}]', 182500, 200750, 1, '2024-07-06 12:27:33', 4250, 205000, 1),
(33, 'Jokowidodo', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":1},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":2}]', 150500, 165550, 1, '2024-07-06 12:51:40', 834450, 1000000, 1),
(34, 'Anies Basweddan', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":3},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":5}]', 425600, 468160, 1, '2024-07-06 13:00:58', 31840, 500000, 1),
(35, 'Kaesang Pangarep', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":5},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":4},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":3},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":6}]', 560200, 616220, 1, '2024-07-06 13:13:18', 3780, 620000, 1),
(36, 'Angie Marcheria', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":4},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":2}]', 358900, 394790, 1, '2024-07-06 13:39:48', 5210, 400000, 1),
(37, 'Mahira', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":2},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":3}]', 275100, 302610, 1, '2024-07-06 21:04:17', 2390, 305000, 1),
(38, 'Vonzy', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":2},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":1}]', 135600, 149160, 1, '2024-07-06 21:09:32', 840, 150000, 1),
(39, 'Gamal Shine', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":2}]', 109700, 120670, 1, '2024-07-06 21:22:35', 29330, 150000, 1),
(40, 'Amelia Luthfiyah M', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 146000, 160600, 1, '2024-07-07 14:03:04', 39400, 200000, 1),
(41, 'Valen Divansyah', '[{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":6}]', 72000, 79200, 1, '2024-07-07 14:04:38', 800, 80000, 1),
(42, 'Vivi Putri', '[{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1}]', 510000, 561000, 1, '2024-07-07 14:29:39', 39000, 600000, 1),
(43, 'Mahalini Raharja', '[{\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":1},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":5}]', 650000, 715000, 1, '2024-07-07 14:31:20', 5000, 720000, 1),
(44, 'Elon Musk', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3}]', 164000, 180400, 1, '2024-07-07 15:20:45', 19600, 200000, 1),
(45, 'Joe Biden', '[{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3}]', 212000, 233200, 1, '2024-07-07 16:44:00', 16800, 250000, 1),
(46, 'Acep', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 120000, 132000, 1, '2024-07-07 17:03:28', 18000, 150000, 1),
(47, 'Allysa Ananta', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 140000, 154000, 1, '2024-07-07 17:05:46', 6000, 160000, 1),
(48, 'Diva Arya', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3}]', 200000, 220000, 1, '2024-07-07 17:07:15', 0, 220000, 1),
(49, 'Vega Anggara', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":7},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":8}]', 336000, 369600, 1, '2024-07-07 17:14:13', 30400, 400000, 1),
(50, 'VegasPro', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 274000, 301400, 1, '2024-07-07 17:16:29', 3600, 305000, 1),
(51, 'Fadilla Ayu Wulandari', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1}]', 390000, 429000, 1, '2024-07-07 17:18:00', 1000, 430000, 1),
(52, 'Ayu Ting Ting', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 121000, 1, '2024-07-07 17:22:06', 4000, 125000, 1),
(53, 'Xiaomi', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2}]', 46000, 50600, 1, '2024-07-07 19:22:26', 49400, 100000, 1),
(54, 'Apple Vision', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2}]', 46000, 50600, 1, '2024-07-07 19:24:12', 4400, 55000, 1),
(55, 'Fantech', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 170000, 187000, 1, '2024-07-07 19:31:21', 13000, 200000, 1),
(56, 'Lenovo', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 200000, 220000, 1, '2024-07-07 19:32:52', 30000, 250000, 1),
(57, 'BosGil', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3}]', 54000, 59400, 1, '2024-07-07 20:01:18', 600, 60000, 1),
(58, 'Samsung', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2}]', 28000, 30800, 1, '2024-07-07 20:12:16', 1200, 32000, 1),
(59, 'First Media', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1}]', 28000, 30800, 1, '2024-07-07 20:13:56', 4200, 35000, 1),
(60, 'Mutiara Asu', '[{\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1}]', 420000, 462000, 1, '2024-07-07 20:17:39', 38000, 500000, 1),
(61, 'Karyawan', '[{\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":4},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2}]', 476000, 523600, 1, '2024-07-07 20:26:39', 76400, 600000, 1),
(62, 'Dila Intan P Balap', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":15},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":19},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":16},{\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":23}]', 12223000, 13445300, 1, '2024-07-07 20:33:17', 554700, 14000000, 1),
(63, 'Vegas Saputra', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":15},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":19},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":16},{\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":103},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":13}]', 54323000, 59755300, 1, '2024-07-07 20:47:45', 244700, 60000000, 1),
(64, 'Akram Imam', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 30000, 33000, 1, '2024-07-07 20:51:34', 2000, 35000, 1),
(65, 'Nengah', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2}]', 32000, 35200, 1, '2024-07-07 21:13:36', 4800, 40000, 1),
(66, 'Vega Anggara', '[{\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":140},{\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":133}]', 105980000, 116578000, 1, '2024-07-07 22:26:38', 0, 116578000, 1),
(67, 'Hindia', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1}]', 17000, 18700, 1, '2024-07-07 23:20:21', 1300, 20000, 1),
(68, 'Vegaspro', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3}]', 225000, 247500, 1, '2024-07-08 09:37:38', 2500, 250000, 1),
(69, 'Ahmad Almayda', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 205000, 225500, 1, '2024-07-08 11:16:48', 500, 226000, 1),
(70, 'Sayangku Cintaku', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 235000, 258500, 1, '2024-07-08 16:14:35', 1500, 260000, 1),
(71, 'Mahalini', '[{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 290000, 319000, 1, '2024-07-08 16:15:01', 1000, 320000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'vegaspro', 'wakwaw123');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
