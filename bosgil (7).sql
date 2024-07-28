-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jul 2024 pada 05.10
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
  `status` tinyint(1) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `typemenu`, `picture`, `name`, `detail`, `price`, `type`, `status`, `stock`) VALUES
(1, 1, 'paketBosgilDada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1, 32),
(2, 1, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1, 22),
(3, 1, 'ayamSeekor.jpg', 'Ayam 1 Ekor', 'Ayam 1 Ekor + Sambal', 60000, 1, 1, 13),
(7, 2, 'paketDuaLebihMurah.jpg', 'Paket 2 Lebih Murah', '2 Nasi + 2 Ayam + 2 Sambal', 55000, 1, 1, 83),
(8, 2, 'ayamPaha.jpg', 'Paket Paha BOSGIL', 'Nasi + Ayam Paha + Sambal', 30000, 1, 1, 83),
(11, 2, 'paketbosgildada.jpg', 'Paket Bosgil Dada', 'Nasi + Ayam Dada + Sambal', 30000, 1, 1, 89),
(12, 2, 'nasiKambing.jpg', 'Paket Kambing Bosgil', 'Nasi + Kambing Bosgil + Sambal', 75000, 1, 1, 88),
(15, 3, 'loyangMiniAyam.jpg', 'Loyang Mini Ayam', 'Nasi + 3 Ayam + Sambal', 100000, 1, 1, 90),
(16, 3, 'loyangSedangAyam.jpg', 'Loyang Sedang Ayam', 'Nasi + 5 Potong Ayam + Sambal', 160000, 1, 1, 90),
(17, 3, 'loyangBesar10Ayam.jpg', 'Loyang Ayam Besar', 'Nasi + 10 Potong Ayam + Sambal', 310000, 1, 1, 91),
(18, 3, 'loyangMiniKambing.jpg', 'Loyang Mini Kambing', 'Nasi+ 3 Porong Kambing + Sambal', 210000, 1, 1, 92),
(19, 3, 'loyangSedangKambing.jpg', 'Loyang Kambing Sedang', 'Nasi + 5 Potong Kambing + Sambal', 310000, 1, 1, 91),
(20, 3, 'loyangBesarKambing.jpg', 'Loyang Besar Kambing', 'Nasi + 10 Potong Kambing + Sambal', 610000, 1, 1, 91),
(21, 3, 'loyangMiniMix.jpg', 'Loyang Mini MIX', 'Nasi + 2 Ayam + 1 Potong Kambing + Sambal', 160000, 1, 1, 90),
(22, 3, 'loyangSedangMix.jpg', 'Loyang MIX Sedang', 'Nasi + 3 Ayam + 2 Kambing + Sambal', 260000, 1, 1, 95),
(23, 3, 'loyangBesarMix.jpg', 'Loyang Besar MIX', 'Nasi + 5 Ayam + 5 Kambing + Sambal', 510000, 1, 1, 95),
(24, 4, 'esTeh.jpg', 'Teh Bos', 'Es Teh Manis', 8000, 2, 1, 0),
(25, 4, 'tehTarikDingin.jpg', 'Teh Tarik', 'Es Teh Susu', 10000, 2, 1, 0),
(26, 4, 'cocacola.jpg', 'Coca Cola', 'Coca Cola', 8000, 2, 1, 64),
(27, 4, 'airMineral.jpg', 'Air Mineral', 'Air Mineral 600 Ml', 7000, 2, 1, 58),
(28, 4, 'fanta.jpg', 'Fanta', 'Soft Drink', 8000, 2, 1, 70),
(29, 4, 'sprite.jpg', 'Sprite', 'Soft Drink', 8000, 2, 1, 71),
(30, 5, 'kambingPerpotong.jpg', 'Kambing Perpotong', 'Kambing Perpotong + Sambal', 60000, 1, 1, 92),
(31, 5, 'sambalBungkus.jpg', 'Sambol Bungkus', 'Sambal Bosgil Perporsi', 5000, 1, 1, 89),
(33, 5, 'nasi.jpg', 'Nasi Saja', 'Nasi + Sambal', 19000, 1, 1, 94),
(34, 5, 'sambalBotol.jpg', 'Sambal Botol', 'Sambal Bosgil Perbotol', 25000, 1, 1, 65),
(37, 5, 'ayamPaha.jpg', 'Ayam Paha Bosgil', 'Ayam Perpotong + Sambal', 25000, 1, 1, 94),
(38, 5, 'ayamDadaPerpotong.jpg', 'Ayam Bossgil Dada', 'Ayam Perpotong + Sambal', 25000, 1, 1, 91);

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
  `image` text NOT NULL,
  `nophone` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `name`, `pesanan`, `normalprice`, `price`, `status`, `date`, `refund`, `pay`, `progress`, `cashier`, `noted`, `image`, `nophone`) VALUES
(223, 'Andre', '[{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7}]', 49000, 49000, 1, '2024-07-19 13:12:50', 1000, 50000, 1, 5, '', '', 0),
(224, 'Putra Anggara', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":2},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":2},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":2}]', 6271000, 6271000, 1, '2024-07-19 13:44:34', 0, 6271000, 1, 5, 'Kambing Ga pedes, ayam pedes semua', 'Putra_Anggara_2024-07-19_13-45-47.jpg', 0),
(225, 'Amanda Monopo', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":1},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 114000, 114000, 1, '2024-07-19 13:46:17', 1000, 115000, 1, 5, '', '', 0),
(226, 'Angie Marcheria', '[{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 270000, 270000, 1, '2024-07-19 13:47:23', 30000, 300000, 1, 5, '', '', 0),
(227, 'Xaviera Saputri', '[{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":4},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 335000, 335000, 1, '2024-07-19 13:47:40', 0, 335000, 1, 5, '', '', 0),
(228, 'Deddy Corbuzier', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-19 13:52:11', 10000, 300000, 1, 5, '', '', 0),
(229, 'Hamdan', '[{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 540000, 540000, 1, '2024-07-19 13:52:24', 60000, 600000, 1, 5, '', '', 0),
(230, 'Mahira', '[{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":1}]', 1325000, 1325000, 1, '2024-07-19 13:52:42', 8675000, 10000000, 1, 5, '', '', 0),
(231, 'Alfiah Nurlatifah', '[{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":1},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":1},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2}]', 2202000, 2202000, 1, '2024-07-19 13:53:15', 298000, 2500000, 1, 5, '', '', 0),
(232, 'Joe Biden', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1}]', 67000, 67000, 1, '2024-07-19 13:53:35', 1000, 68000, 1, 5, '', '', 0),
(233, 'Gibran Rakabuming', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2}]', 59000, 59000, 1, '2024-07-19 13:54:05', 1000, 60000, 1, 5, '', '', 0),
(234, 'Adelia Putri', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 208000, 208000, 1, '2024-07-19 13:54:29', 2000, 210000, 1, 5, '', '', 0),
(235, 'Rawles', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 330000, 330000, 1, '2024-07-19 13:55:01', 20000, 350000, 1, 5, '', '', 0),
(236, 'Valen Divansyah', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2}]', 295000, 295000, 1, '2024-07-19 13:55:29', 5000, 300000, 1, 5, '', '', 0),
(237, 'H. Thoriq', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":3},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1}]', 301000, 301000, 1, '2024-07-19 13:57:00', 0, 301000, 1, 5, '', '', 0),
(238, 'Sumanto', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 405000, 405000, 1, '2024-07-19 13:57:44', 15000, 420000, 1, 5, '', '', 0),
(239, 'Acep Triatna', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 350000, 350000, 1, '2024-07-19 13:58:03', 0, 350000, 1, 5, '', '', 0),
(240, 'Ujang', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":2},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":4},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":3}]', 343000, 343000, 1, '2024-07-19 13:58:36', 0, 343000, 1, 5, '', '', 0),
(241, 'Gamal Shine', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":3},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":3},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":3}]', 79000, 79000, 1, '2024-07-19 13:59:12', 1000, 80000, 1, 5, '', '', 0),
(242, 'Faril Ritonga', '[{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":8},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":4},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 418000, 418000, 1, '2024-07-19 14:00:06', 2000, 420000, 1, 5, '', '', 0),
(243, 'Dora The Explorer', '[{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":3},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":1},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":1}]', 163000, 163000, 1, '2024-07-19 14:01:04', 0, 163000, 1, 5, '', '', 0),
(244, 'Madun', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 255000, 255000, 1, '2024-07-19 14:03:02', 0, 255000, 1, 5, '', '', 0),
(245, 'Opet', '[{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":4}]', 120000, 120000, 1, '2024-07-19 14:27:11', 30000, 150000, 1, 5, '', '', 0),
(248, 'Dila intan Prisilia', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2}]', 75000, 75000, 1, '2024-07-19 17:16:32', 0, 75000, 1, 5, '', 'Dila_intan_Prisilia_2024-07-19_17-33-53.jpg', 0),
(250, 'Xaviera', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":1}]', 220000, 220000, 1, '2024-07-21 20:18:37', 5000, 225000, 1, 5, '', '', 0),
(251, 'Kak Ros', '[{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1}]', 151000, 151000, 1, '2024-07-21 20:22:57', 4000, 155000, 1, 5, 'Sambal dipisah', 'Kak_Ros_2024-07-21_20-26-36.jpg', 0),
(252, 'Amanda Salsabila', '[{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":3},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 555000, 555000, 1, '2024-07-26 09:46:05', 0, 555000, 1, 5, 'Sambal Dipisah', 'Amanda_Salsabila_2024-07-26_10-07-03.jpg', 0),
(253, 'Pesanan', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 110000, 1, '2024-07-26 09:46:56', 40000, 150000, 1, 5, '', '', 0),
(254, 'Galuh', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":4}]', 100000, 100000, 1, '2024-07-26 09:47:43', 0, 100000, 1, 5, '', '', 0),
(255, 'Barong', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":50}]', 500000, 500000, 1, '2024-07-26 09:48:28', 0, 500000, 1, 5, '', '', 0),
(256, 'Wilie Salim', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":2},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":1},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":1},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":1}]', 67000, 67000, 1, '2024-07-26 09:49:30', 3000, 70000, 1, 5, '', '', 0),
(257, 'Venny Noer', '[{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":3},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":4},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":5},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":4},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":3},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":4},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":4},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":4},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":4},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":2},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":2},{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":25},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":2},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":30},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":2}]', 9891000, 9891000, 1, '2024-07-26 09:50:40', 109000, 10000000, 1, 5, '', '', 0),
(258, 'Jhon Lbf', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":5},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":5},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":26},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":24},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":11},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":6},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":5},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":8},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":3},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":3},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":4},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":5},{\"id\":18,\"menu\":\"Loyang Mini Kambing\",\"hargasatuan\":210000,\"jumlah\":4},{\"id\":19,\"menu\":\"Loyang Kambing Sedang\",\"hargasatuan\":310000,\"jumlah\":5},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":3},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":5},{\"id\":22,\"menu\":\"Loyang MIX Sedang\",\"hargasatuan\":260000,\"jumlah\":3},{\"id\":23,\"menu\":\"Loyang Besar MIX\",\"hargasatuan\":510000,\"jumlah\":3},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":13},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":11},{\"id\":30,\"menu\":\"Kambing Perpotong\",\"hargasatuan\":60000,\"jumlah\":5},{\"id\":31,\"menu\":\"Sambol Bungkus\",\"hargasatuan\":5000,\"jumlah\":7},{\"id\":33,\"menu\":\"Nasi Saja\",\"hargasatuan\":19000,\"jumlah\":4},{\"id\":34,\"menu\":\"Sambal Botol\",\"hargasatuan\":25000,\"jumlah\":5},{\"id\":37,\"menu\":\"Ayam Paha Bosgil\",\"hargasatuan\":25000,\"jumlah\":4},{\"id\":38,\"menu\":\"Ayam Bossgil Dada\",\"hargasatuan\":25000,\"jumlah\":6}]', 13014000, 13014000, 1, '2024-07-26 09:54:32', 986000, 14000000, 1, 5, '', '', 0),
(259, 'Jonny', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":5},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":4},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":7},{\"id\":28,\"menu\":\"Fanta\",\"hargasatuan\":8000,\"jumlah\":14},{\"id\":29,\"menu\":\"Sprite\",\"hargasatuan\":8000,\"jumlah\":15}]', 353000, 353000, 1, '2024-07-26 09:55:16', 7000, 360000, 1, 5, '', '', 0),
(260, 'Prabowo', '[{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":83}]', 664000, 664000, 1, '2024-07-26 09:58:40', 1000, 665000, 1, 5, '', '', 0),
(261, 'Milku', '[{\"id\":25,\"menu\":\"Teh Tarik\",\"hargasatuan\":10000,\"jumlah\":12},{\"id\":24,\"menu\":\"Teh Bos\",\"hargasatuan\":8000,\"jumlah\":2}]', 136000, 136000, 1, '2024-07-26 09:59:34', 64000, 200000, 1, 5, '', '', 0),
(262, 'Mahalini', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-26 10:00:50', 10000, 300000, 1, 5, '', '', 0),
(263, 'Azka', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3}]', 320000, 320000, 1, '2024-07-26 10:01:06', 0, 320000, 1, 5, '', '', 0),
(264, 'Hamdan', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":2}]', 290000, 290000, 1, '2024-07-26 10:01:21', 10000, 300000, 1, 5, '', '', 0),
(265, 'Jojon', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":20},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":20},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":15}]', 2600000, 2600000, 1, '2024-07-26 10:02:17', 0, 2600000, 1, 5, '', '', 0),
(266, 'Anggara', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":14},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":14},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":37}]', 3410000, 3410000, 1, '2024-07-26 10:03:01', 90000, 3500000, 1, 5, '', '', 0),
(267, 'Kosomo', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":4},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":5},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":5}]', 895000, 895000, 1, '2024-07-26 10:03:30', 5000, 900000, 1, 5, '', '', 0),
(268, 'Syahda', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":10},{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":8},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":11},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":1},{\"id\":20,\"menu\":\"Loyang Besar Kambing\",\"hargasatuan\":610000,\"jumlah\":2},{\"id\":21,\"menu\":\"Loyang Mini MIX\",\"hargasatuan\":160000,\"jumlah\":1},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2},{\"id\":26,\"menu\":\"Coca Cola\",\"hargasatuan\":8000,\"jumlah\":2}]', 3960000, 3960000, 1, '2024-07-26 10:04:30', 40000, 4000000, 1, 5, '', '', 0),
(269, 'Gendats', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":3},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 460000, 460000, 1, '2024-07-26 10:06:32', 40000, 500000, 1, 5, '', '', 0),
(274, 'Superman', '[{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":4}]', 28000, 28000, 1, '2024-07-26 10:41:24', 2000, 30000, 1, 5, '', '', 8990656996),
(275, 'Rachelcia', '[{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":2}]', 110000, 110000, 1, '2024-07-26 12:42:09', 0, 110000, 1, 5, '', '', 8990656996),
(276, 'Kumala', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":2,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":3,\"menu\":\"Ayam 1 Ekor\",\"hargasatuan\":60000,\"jumlah\":1},{\"id\":7,\"menu\":\"Paket 2 Lebih Murah\",\"hargasatuan\":55000,\"jumlah\":1},{\"id\":8,\"menu\":\"Paket Paha BOSGIL\",\"hargasatuan\":30000,\"jumlah\":1},{\"id\":11,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":12,\"menu\":\"Paket Kambing Bosgil\",\"hargasatuan\":75000,\"jumlah\":2},{\"id\":15,\"menu\":\"Loyang Mini Ayam\",\"hargasatuan\":100000,\"jumlah\":2},{\"id\":16,\"menu\":\"Loyang Sedang Ayam\",\"hargasatuan\":160000,\"jumlah\":2},{\"id\":17,\"menu\":\"Loyang Ayam Besar\",\"hargasatuan\":310000,\"jumlah\":2}]', 1580000, 1580000, 1, '2024-07-26 13:27:47', 420000, 2000000, 1, 5, '', '', 8990656996),
(277, 'Gamal', '[{\"id\":1,\"menu\":\"Paket Bosgil Dada\",\"hargasatuan\":30000,\"jumlah\":2},{\"id\":27,\"menu\":\"Air Mineral\",\"hargasatuan\":7000,\"jumlah\":2}]', 74000, 74000, 1, '2024-07-26 19:05:00', 1000, 75000, 1, 5, '', 'Gamal_2024-07-26_19-05-56.jpg', 8990656996);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `role`, `gender`) VALUES
(2, 'Vegantropus', 'vegantropus@gmail.com', '9c7183d0848dab5480bfb6cd8157ca1a', 1, 0),
(5, 'Vega Anggara', 'vegaspro@gmail.com', 'adf8433f6a83858e2b6f6bb204845ff5', 2, 0),
(6, 'Xaviera', 'xaviera@gmail.com', 'adf8433f6a83858e2b6f6bb204845ff5', 3, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
