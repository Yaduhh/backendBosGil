-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Jul 2024 pada 01.53
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

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
-- Struktur dari tabel `menu`
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
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `typemenu`, `picture`, `name`, `detail`, `price`, `type`, `status`) VALUES
(1, 1, 'paketBosgilDada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1),
(2, 1, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1),
(3, 1, 'ayamSeekor.jpg', 'Ayam 1 Ekor', 'Ayam 1 Ekor + Sambal', 60000, 1, 1),
(7, 2, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1),
(8, 2, 'ayamPaha.jpg', 'Paket Paha BOSGIL', 'Nasi + Ayam Paha + Sambal', 30000, 1, 1),
(11, 2, 'paketbosgildada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1),
(12, 2, 'nasiKambing.jpg', 'Paket Kambing Bosgil', 'Nasi + Kambing Bosgil + Sambal', 75000, 1, 1),
(15, 3, 'loyangMiniAyam.jpg', 'Loyang Mini Ayam', 'Nasi + 3 Ayam + Sambal', 100000, 1, 1),
(16, 3, 'loyangSedangAyam.jpg', 'Loyang Sedang Ayam', 'Nasi + 5 Potong Ayam + Sambal', 160000, 1, 1),
(17, 3, 'loyangBesar10Ayam.jpg', 'Loyang Ayam Besar', 'Nasi + 10 Potong Ayam + Sambal', 310000, 1, 1),
(18, 3, 'loyangMiniKambing.jpg', 'Loyang Mini Kambing', 'Nasi+ 3 Porong Kambing + Sambal', 210000, 1, 1),
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
-- Struktur dari tabel `orders`
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
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `name`, `pesanan`, `normalprice`, `price`, `status`, `date`, `refund`, `pay`, `progress`, `cashier`, `noted`, `image`) VALUES
(28, 'Gamal Mushtofa', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":5}]', 292200, 321420, 1, '2024-06-06 10:00:47', 3580, 325000, 1, 5, '', ''),
(29, 'Faril Ritonga', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":1}]', 172500, 189750, 1, '2024-07-06 10:40:55', 10250, 200000, 1, 2, '', ''),
(30, 'Clara', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":4},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":5},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":3}]', 457600, 503360, 1, '2024-07-06 11:11:50', 1640, 505000, 1, 5, '', ''),
(31, 'Mutiara', '[{\"menu\":\"Special Kambing Mantan\",\"hargasatuan\":41900,\"jumlah\":2},{\"menu\":\"Mie Kambing Sapi\",\"hargasatuan\":45900,\"jumlah\":3},{\"menu\":\"Hati Sapi bukan Hatimu\",\"hargasatuan\":45900,\"jumlah\":5},{\"menu\":\"Spageti Kambing Jantan\",\"hargasatuan\":44200,\"jumlah\":2},{\"menu\":\"Paket Nasi Sapi Jerapa Paha\",\"hargasatuan\":25900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":25900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":3},{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":1}]', 815500, 897050, 1, '2024-07-06 12:03:07', 2950, 900000, 1, 5, '', ''),
(50, 'VegasPro', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 274000, 301400, 1, '2024-07-07 17:16:29', 3600, 305000, 1, 2, '', ''),
(68, 'Vegaspro', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3}]', 225000, 247500, 1, '2024-07-08 09:37:38', 2500, 250000, 1, 5, '', ''),
(76, 'Rifqah Jihan Daffa', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 60000, 66000, 1, '2024-07-10 16:12:05', 4000, 70000, 1, 5, '', ''),
(77, 'Ade Setiawan', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 170000, 187000, 1, '2024-07-10 17:02:49', 13000, 200000, 1, 5, '', ''),
(78, 'Mas Dean', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":4}]', 120000, 132000, 1, '2024-07-10 17:05:33', 18000, 150000, 1, 5, '', ''),
(79, 'Salsabila', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":4},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 230000, 253000, 1, '2024-07-10 17:06:17', 2000, 255000, 1, 5, '', ''),
(80, 'Mahira', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 60000, 66000, 1, '2024-07-10 17:09:51', 4000, 70000, 1, 5, '', ''),
(81, 'Yaduhh', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 30000, 33000, 1, '2024-07-10 17:13:41', 17000, 50000, 1, 5, '', ''),
(82, 'Veganthropus', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2}]', 150000, 165000, 1, '2024-07-10 17:16:04', 35000, 200000, 1, 5, '', ''),
(83, 'Venny Noeraeni', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 60000, 66000, 1, '2024-07-10 18:23:59', 4000, 70000, 1, 5, '', ''),
(84, 'Xaviera Anggara', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2}]', 465000, 511500, 1, '2024-07-10 18:34:04', 8500, 520000, 1, 5, '', ''),
(85, 'Angie Marcheria', '[{\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":3}]', 75000, 82500, 1, '2024-07-10 18:36:16', 17500, 100000, 1, 5, '', ''),
(86, 'Xaviera RG', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 315000, 346500, 1, '2024-07-10 18:45:23', 3500, 350000, 1, 5, '', ''),
(87, 'Xaviera', '[{\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":1},{\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":1}]', 520000, 572000, 1, '2024-07-10 21:02:46', 3000, 575000, 1, 5, '', ''),
(89, 'Xaviera II', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":7},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":5}]', 675000, 742500, 1, '2024-07-10 21:39:35', 7500, 750000, 1, 5, '', ''),
(97, 'Xaviera Anggara', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":1}]', 564000, 620400, 1, '2024-07-10 22:32:13', 4600, 625000, 1, 5, '', ''),
(101, 'Xaviera Saputra', '[{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3}]', 184000, 202400, 1, '2024-07-11 13:45:39', 1600, 204000, 1, 5, '', ''),
(102, 'Gamal Shine', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1}]', 280000, 308000, 1, '2024-07-11 16:55:38', 2000, 310000, 1, 5, '', ''),
(103, 'Dila Intan Prisilia', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1}]', 133000, 146300, 1, '2024-07-11 18:09:42', 3700, 150000, 1, 5, '', ''),
(104, 'Vegaspro', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1}]', 45000, 49500, 1, '2024-07-11 18:10:13', 0, 49500, 1, 5, '', ''),
(105, 'Deddy Corbuzer', '[{\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":1},{\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":1},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2}]', 847000, 931700, 1, '2024-07-11 18:23:22', 18300, 950000, 1, 2, '', ''),
(107, 'Fachril Ritonga', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1}]', 193000, 212300, 1, '2024-07-11 19:40:40', 2700, 215000, 1, 5, '', ''),
(108, 'Raditya', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":4},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 280000, 308000, 1, '2024-07-11 20:07:04', 2000, 310000, 1, 2, '', ''),
(109, 'Peyi Onic', '[{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":4}]', 695000, 764500, 1, '2024-07-12 13:51:24', 500, 765000, 1, 5, '', ''),
(110, 'Bos BosGil', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1}]', 401000, 441100, 1, '2024-07-12 16:18:37', 0, 0, 1, 5, '', ''),
(111, 'Surya Insomnia', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 195000, 214500, 1, '2024-07-12 18:04:54', 0, 0, 1, 5, '', ''),
(112, 'Hamdan', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2}]', 170000, 187000, 1, '2024-07-12 18:09:13', 0, 0, 1, 5, '', ''),
(113, 'Booby Saputra', '[{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2}]', 60000, 66000, 1, '2024-07-12 18:10:23', 4000, 70000, 1, 5, '', ''),
(114, 'Xaviera Anggara', '[{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2}]', 137000, 150700, 1, '2024-07-12 18:43:41', 4300, 155000, 1, 5, '', ''),
(115, 'Justin Bieber', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1}]', 31000, 34100, 1, '2024-07-12 18:44:29', 15900, 50000, 1, 5, '', ''),
(116, 'Rara', '[{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 170000, 187000, 1, '2024-07-12 19:04:09', 13000, 200000, 1, 5, '', ''),
(117, 'Veganthropus', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":1},{\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":1},{\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":2},{\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":3},{\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":3},{\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":4},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":4},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":4},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":5},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":4},{\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":1},{\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 7243000, 7967300, 1, '2024-07-12 19:09:14', 32700, 8000000, 1, 2, '', ''),
(118, 'Mahalini', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 285000, 313500, 1, '2024-07-12 19:24:41', 1500, 315000, 1, 2, '', ''),
(119, 'Anjay Mabar', '[{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 315000, 346500, 1, '2024-07-12 19:30:46', 3500, 350000, 1, 2, '', ''),
(120, 'Maudy Ayunda', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2}]', 150000, 165000, 1, '2024-07-12 19:40:07', 35000, 200000, 1, 2, '', ''),
(121, 'Lyodra', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2}]', 425000, 467500, 1, '2024-07-12 19:48:23', 32500, 500000, 1, 2, '', ''),
(122, 'Rizky Febian', '[{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2}]', 42000, 46200, 1, '2024-07-12 19:50:05', 3800, 50000, 1, 2, '', ''),
(123, 'Syifa Hadju', '[{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":4}]', 44000, 48400, 1, '2024-07-12 20:02:02', 1600, 50000, 1, 2, '', ''),
(124, 'Samsung', '[{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2}]', 38000, 41800, 1, '2024-07-12 20:07:30', 3200, 45000, 1, 2, '', ''),
(125, 'Ujang', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":3},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1}]', 38000, 41800, 1, '2024-07-12 20:07:47', 8200, 50000, 1, 2, '', ''),
(126, 'Dadang', '[{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":3},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":3}]', 48000, 52800, 1, '2024-07-12 20:08:33', 2200, 55000, 1, 2, '', ''),
(127, 'Xiaomi', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":4},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3}]', 64000, 70400, 1, '2024-07-12 20:08:57', 29600, 100000, 1, 2, '', ''),
(128, 'Zevrischa', '[{\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2},{\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1}]', 49000, 53900, 1, '2024-07-12 20:11:25', 1100, 55000, 1, 2, '', ''),
(129, 'angga yunanda', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 285000, 313500, 1, '2024-07-12 20:49:23', 1500, 315000, 1, 5, 'jangan pedas', ''),
(130, 'Sze', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 315000, 346500, 1, '2024-07-12 21:31:02', 3500, 350000, 1, 2, 'Banyakin Sambelnya', ''),
(131, 'Anggie', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 140000, 154000, 1, '2024-07-12 21:31:58', 1000, 155000, 1, 2, 'Banyakin Sambelnya', ''),
(132, 'Rifani', '[{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 120000, 132000, 1, '2024-07-12 22:29:14', 18000, 150000, 1, 2, '', ''),
(133, 'Alysa Ananta', '[{\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 255000, 280500, 1, '2024-07-13 10:57:50', 19500, 300000, 1, 2, 'Jangan Pedes', ''),
(134, 'Acep Cep', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2}]', 221000, 243100, 1, '2024-07-13 13:46:40', 6900, 250000, 1, 5, '', ''),
(135, 'Laurencius', '[{\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1}]', 139000, 152900, 1, '2024-07-13 14:15:29', 2100, 155000, 1, 5, '', ''),
(136, 'Anisa Azizah', '[{\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 174000, 191400, 1, '2024-07-13 14:18:40', 8600, 200000, 1, 5, '', ''),
(143, 'Komandan', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 230000, 253000, 1, '2024-07-13 16:40:23', 2000, 255000, 1, 5, '', ''),
(145, 'Kangkung', '[{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 230000, 253000, 1, '2024-07-13 16:52:13', 2000, 255000, 1, 5, '', ''),
(157, 'Jono Bakrie', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 115000, 126500, 1, '2024-07-13 17:35:51', 3500, 130000, 1, 5, '', ''),
(158, 'Jojon', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 115000, 126500, 1, '2024-07-13 17:36:20', 3500, 130000, 1, 5, '', ''),
(159, 'Ayu ting ting', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 85000, 93500, 1, '2024-07-13 17:36:57', 6500, 100000, 1, 5, '', ''),
(160, 'Cipung', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 85000, 93500, 1, '2024-07-13 17:37:16', 6500, 100000, 1, 5, '', ''),
(161, 'Upin Ipin', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 115000, 126500, 1, '2024-07-13 17:39:44', 23500, 150000, 1, 5, '', ''),
(199, 'Cikgu Jasmine', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 200000, 220000, 1, '2024-07-14 10:05:41', 0, 220000, 1, 5, '', 'Cikgu_Jasmine_2024-07-14_10-08-10.jpg'),
(200, 'Spongebob', '[{\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1}]', 145000, 159500, 1, '2024-07-14 10:06:21', 500, 160000, 1, 5, '', ''),
(201, 'GamalShine', '[{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1}]', 85000, 93500, 1, '2024-07-14 10:51:53', 6500, 100000, 1, 5, 'Pedes', 'GamalShine_2024-07-14_10-52-37.jpg'),
(204, 'Windah', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1}]', 145000, 145000, 1, '2024-07-16 21:52:46', 5000, 150000, 1, 2, '', ''),
(205, 'Erick Thohir', '[{\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5}]', 275000, 275000, 1, '2024-07-16 22:24:15', 25000, 300000, 1, 5, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`) VALUES
(2, 'Gamal Musthofa', 'gamalshine', '9c7183d0848dab5480bfb6cd8157ca1a'),
(5, 'Vega Anggara', 'vegaspro@gmail.com', 'adf8433f6a83858e2b6f6bb204845ff5');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orders_users` (`cashier`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`cashier`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
