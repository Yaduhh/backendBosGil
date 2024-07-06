-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jul 2024 pada 03.53
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
  `progress` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `name`, `pesanan`, `normalprice`, `price`, `status`, `date`, `refund`, `pay`, `progress`) VALUES
(25, 'Dila Intan Prisilia', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":2},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":1}]', 108700, 119570, 1, '2024-07-06 00:29:18', 430, 120000, 0),
(26, 'Vega Anggara Saputra', '[{\"menu\":\"Special Kambing Mantan\",\"hargasatuan\":41900,\"jumlah\":2},{\"menu\":\"Mie Kambing Sapi\",\"hargasatuan\":45900,\"jumlah\":1}]', 129700, 142670, 1, '2024-07-06 00:39:20', 7330, 150000, 0),
(27, 'Mega Trimulya', '[{\"menu\":\"Paket Nasi Ayam Paha\",\"hargasatuan\":35900,\"jumlah\":3},{\"menu\":\"Nasi Goreng Kambing\",\"hargasatuan\":36900,\"jumlah\":4}]', 255300, 280830, 0, '2024-07-06 00:48:42', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
