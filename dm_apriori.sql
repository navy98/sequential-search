-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Feb 2022 pada 02.59
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dm_apriori`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `confidence`
--

CREATE TABLE `confidence` (
  `kombinasi1` varchar(255) DEFAULT NULL,
  `kombinasi2` varchar(255) DEFAULT NULL,
  `support_xUy` double DEFAULT NULL,
  `support_x` double DEFAULT NULL,
  `confidence` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(100) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  `jumlah_a` int(11) DEFAULT NULL,
  `jumlah_b` int(11) DEFAULT NULL,
  `jumlah_ab` int(11) DEFAULT NULL,
  `px` double DEFAULT NULL,
  `py` double DEFAULT NULL,
  `pxuy` double DEFAULT NULL,
  `from_itemset` int(11) DEFAULT NULL COMMENT 'dari itemset 2/3'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `confidence`
--

INSERT INTO `confidence` (`kombinasi1`, `kombinasi2`, `support_xUy`, `support_x`, `confidence`, `lolos`, `min_support`, `min_confidence`, `nilai_uji_lift`, `korelasi_rule`, `id_process`, `jumlah_a`, `jumlah_b`, `jumlah_ab`, `px`, `py`, `pxuy`, `from_itemset`) VALUES
('The King Pocked Matematika HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('HAFAL MATERI SEJARAH Strategi Kebut Semalam', 'The King Pocked Matematika', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 3),
('Strategi Kebut Semalam The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 3),
('The King Pocked Matematika Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 1, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 3),
('HAFAL MATERI SEJARAH The King Pocked Matematika', 'Strategi Kebut Semalam', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 3),
('Strategi Kebut Semalam HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 50, 75, 66.666666666667, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 9, 6, 6, 0.75, 0.5, 0.5, 2),
('Strategi Kebut Semalam', 'The King Pocked Matematika', 50, 50, 100, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 6, 9, 6, 0.5, 0.75, 0.5, 2),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 1, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 2),
('OSN Biologi', 'HAFAL MATERI SEJARAH', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 2),
('The King Pocked Matematika HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('HAFAL MATERI SEJARAH Strategi Kebut Semalam', 'The King Pocked Matematika', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 3),
('Strategi Kebut Semalam The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 3),
('The King Pocked Matematika Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 3),
('HAFAL MATERI SEJARAH The King Pocked Matematika', 'Strategi Kebut Semalam', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 3),
('Strategi Kebut Semalam HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 50, 75, 66.666666666667, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 6, 6, 0.75, 0.5, 0.5, 2),
('Strategi Kebut Semalam', 'The King Pocked Matematika', 50, 50, 100, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 9, 6, 0.5, 0.75, 0.5, 2),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 2),
('OSN Biologi', 'HAFAL MATERI SEJARAH', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 2),
('The King Pocked Matematika HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('HAFAL MATERI SEJARAH Strategi Kebut Semalam', 'The King Pocked Matematika', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('Strategi Kebut Semalam The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('The King Pocked Matematika Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('HAFAL MATERI SEJARAH The King Pocked Matematika', 'Strategi Kebut Semalam', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('Strategi Kebut Semalam HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('Strategi Kebut Semalam', 'The King Pocked Matematika', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 100, 100, 100, 1, 20, 40, 1, 'tidak ada korelasi', 3, 1, 1, 1, 1, 1, 1, 2),
('ESPS MATEMATIKA 1 ESPS MATEMATIKA 2', 'ESPS MATEMATIKA 3', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('MATEMATIKA SMA MATEMATIKA SMA 2', 'MATEMATIKA SMA 3', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 3),
('PPKN SMA 1 PPKN SMA 2 ', 'ESPS PPKN', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 3),
('Seni budaya SMA 1  Seni budaya SMA 2', 'Seni budaya SMA 3', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 1, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 3),
('English cours 1  English cours 2', 'English cours 3', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 3),
('IPA terpadu untuk SMA ESPS Ipa', 'ESPS Ipa 2', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('IPA terpadu untuk SMA', 'ESPS Ipa', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('ESPS PPKN', 'PPKN SMA 1', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 1, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 1, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 2),
('OSN Biologi', 'HAFAL MATERI SEJARAH', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 1, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 2),
('Berbahasa Indonesia untuk SMA 1 Berbahasa Indonesia untuk SMA 2', 'Berbahasa Indonesia untuk SMA 3', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('English cours 1 MATEMATIKA SMA 1 ', 'MATEMATIKA SMA 3', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 3),
('Berbahasa Indonesia untuk SMA 1 English cours 1', 'MATEMATIKA SMA 1', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 3),
('PPKN SMA 1 ESPS MATEMATIKA 2', 'ESPS MATEMATIKA 1', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 3),
('HAFAL MATERI SEJARAH The King Pocked Matematika', 'Strategi Kebut Semalam', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 3),
('English cours 2 MATEMATIKA SMA 1', 'The King Pocked Matematika', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 6, 4, 0.5, 0.5, 0.33333333333333, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('PPKN SMA 1', 'ESPS PPKN', 50, 75, 66.666666666667, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 9, 6, 0.75, 0.75, 0.5, 2),
('IPA terpadu untuk SMA', 'Berbahasa Indonesia untuk SMA 1', 50, 75, 66.666666666667, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 6, 6, 0.75, 0.5, 0.5, 2),
('ESPS MATEMATIKA 2', 'The King Pocked Matematika', 50, 50, 100, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 6, 9, 6, 0.5, 0.75, 0.5, 2),
('ESPS MATEMATIKA 1', 'ESPS GEOGRAFI', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('English cours 1', 'PPKN SMA 1', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 9, 6, 4, 0.75, 0.5, 0.33333333333333, 2),
('PPKN SMA 2', 'Berbahasa Indonesia untuk SMA 1', 33.333333333333, 50, 66.666666666666, 1, 30, 60, 0.88888888888889, 'korelasi negatif', 2, 6, 9, 4, 0.5, 0.75, 0.33333333333333, 2),
('Seni budaya SMA ', 'Seni budaya SMA 2', 33.333333333333, 75, 44.444444444444, 0, 30, 60, 1.3333333333333, 'korelasi positif', 2, 9, 4, 4, 0.75, 0.33333333333333, 0.33333333333333, 2),
('Seni budaya SMA 3', 'PPKN SMA 1', 33.333333333333, 33.333333333333, 99.999999999999, 1, 30, 60, 1.3333333333333, 'korelasi positif', 2, 4, 9, 4, 0.33333333333333, 0.75, 0.33333333333333, 2),
('The King Pocked Matematika , HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 23.728813559322, 35.593220338983, 66.666666666667, 1, 20, 60, 1.8730158730159, 'korelasi positif', 0, 42, 42, 28, 0.35593220338983, 0.35593220338983, 0.23728813559322, 3),
('HAFAL MATERI SEJARAH , Strategi Kebut Semalam', 'The King Pocked Matematika', 23.728813559322, 23.728813559322, 100, 1, 20, 60, 1.6388888888889, 'korelasi positif', 0, 28, 72, 28, 0.23728813559322, 0.61016949152542, 0.23728813559322, 3),
('Strategi Kebut Semalam , The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 23.728813559322, 35.593220338983, 66.666666666667, 1, 20, 60, 0.89393939393939, 'korelasi negatif', 0, 42, 88, 28, 0.35593220338983, 0.74576271186441, 0.23728813559322, 3),
('The King Pocked Matematika', 'Strategi Kebut Semalam , HAFAL MATERI SEJARAH', 23.728813559322, 61.016949152542, 38.888888888889, 0, 20, 60, 1.6388888888889, 'korelasi positif', 0, 72, 28, 28, 0.61016949152542, 0.23728813559322, 0.23728813559322, 3),
('HAFAL MATERI SEJARAH', 'The King Pocked Matematika , Strategi Kebut Semalam', 23.728813559322, 74.576271186441, 31.818181818182, 0, 20, 60, 0.89393939393939, 'korelasi negatif', 0, 88, 42, 28, 0.74576271186441, 0.35593220338983, 0.23728813559322, 3),
('Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH , The King Pocked Matematika', 23.728813559322, 35.593220338983, 66.666666666667, 1, 20, 60, 1.8730158730159, 'korelasi positif', 0, 42, 42, 28, 0.35593220338983, 0.35593220338983, 0.23728813559322, 3),
('ESPS GEOGRAFI , HAFAL MATERI SEJARAH', 'OSN Biologi', 38.983050847458, 44.915254237288, 86.79245283019, 1, 20, 60, 1.9323602705589, 'korelasi positif', 0, 53, 53, 46, 0.44915254237288, 0.44915254237288, 0.38983050847458, 3),
('HAFAL MATERI SEJARAH , OSN Biologi', 'ESPS GEOGRAFI', 38.983050847458, 44.915254237288, 86.79245283019, 1, 20, 60, 1.3475670307845, 'korelasi positif', 0, 53, 76, 46, 0.44915254237288, 0.64406779661017, 0.38983050847458, 3),
('OSN Biologi , ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 38.983050847458, 38.983050847458, 100, 1, 20, 60, 1.3409090909091, 'korelasi positif', 0, 46, 88, 46, 0.38983050847458, 0.74576271186441, 0.38983050847458, 3),
('ESPS GEOGRAFI', 'OSN Biologi , HAFAL MATERI SEJARAH', 38.983050847458, 64.406779661017, 60.526315789474, 1, 20, 60, 1.3475670307845, 'korelasi positif', 0, 76, 53, 46, 0.64406779661017, 0.44915254237288, 0.38983050847458, 3),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI , OSN Biologi', 38.983050847458, 74.576271186441, 52.272727272728, 0, 20, 60, 1.3409090909091, 'korelasi positif', 0, 88, 46, 46, 0.74576271186441, 0.38983050847458, 0.38983050847458, 3),
('OSN Biologi', 'HAFAL MATERI SEJARAH , ESPS GEOGRAFI', 38.983050847458, 44.915254237288, 86.79245283019, 1, 20, 60, 1.9323602705589, 'korelasi positif', 0, 53, 53, 46, 0.44915254237288, 0.44915254237288, 0.38983050847458, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 35.593220338983, 61.016949152542, 58.333333333333, 0, 20, 60, 0.78219696969697, 'korelasi negatif', 0, 72, 88, 42, 0.61016949152542, 0.74576271186441, 0.35593220338983, 2),
('HAFAL MATERI SEJARAH', 'The King Pocked Matematika', 35.593220338983, 74.576271186441, 47.727272727273, 0, 20, 60, 0.78219696969697, 'korelasi negatif', 0, 88, 72, 42, 0.74576271186441, 0.61016949152542, 0.35593220338983, 2),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 25.423728813559, 61.016949152542, 41.666666666666, 0, 20, 60, 0.6469298245614, 'korelasi negatif', 0, 72, 76, 30, 0.61016949152542, 0.64406779661017, 0.25423728813559, 2),
('ESPS GEOGRAFI', 'The King Pocked Matematika', 25.423728813559, 64.406779661017, 39.473684210526, 0, 20, 60, 0.6469298245614, 'korelasi negatif', 0, 76, 72, 30, 0.64406779661017, 0.61016949152542, 0.25423728813559, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 35.593220338983, 61.016949152542, 58.333333333333, 0, 20, 60, 1.6388888888889, 'korelasi positif', 0, 72, 42, 42, 0.61016949152542, 0.35593220338983, 0.35593220338983, 2),
('Strategi Kebut Semalam', 'The King Pocked Matematika', 35.593220338983, 35.593220338983, 100, 1, 20, 60, 1.6388888888889, 'korelasi positif', 0, 42, 72, 42, 0.35593220338983, 0.61016949152542, 0.35593220338983, 2),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 44.915254237288, 74.576271186441, 60.227272727273, 1, 20, 60, 0.93510765550239, 'korelasi negatif', 0, 88, 76, 53, 0.74576271186441, 0.64406779661017, 0.44915254237288, 2),
('ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 44.915254237288, 64.406779661017, 69.736842105263, 1, 20, 60, 0.93510765550239, 'korelasi negatif', 0, 76, 88, 53, 0.64406779661017, 0.74576271186441, 0.44915254237288, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 23.728813559322, 74.576271186441, 31.818181818182, 0, 20, 60, 0.89393939393939, 'korelasi negatif', 0, 88, 42, 28, 0.74576271186441, 0.35593220338983, 0.23728813559322, 2),
('Strategi Kebut Semalam', 'HAFAL MATERI SEJARAH', 23.728813559322, 35.593220338983, 66.666666666667, 1, 20, 60, 0.89393939393939, 'korelasi negatif', 0, 42, 88, 28, 0.35593220338983, 0.74576271186441, 0.23728813559322, 2),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 44.915254237288, 74.576271186441, 60.227272727273, 1, 20, 60, 1.3409090909091, 'korelasi positif', 0, 88, 53, 53, 0.74576271186441, 0.44915254237288, 0.44915254237288, 2),
('OSN Biologi', 'HAFAL MATERI SEJARAH', 44.915254237288, 44.915254237288, 100, 1, 20, 60, 1.3409090909091, 'korelasi positif', 0, 53, 88, 53, 0.44915254237288, 0.74576271186441, 0.44915254237288, 2),
('ESPS GEOGRAFI', 'OSN Biologi', 38.983050847458, 64.406779661017, 60.526315789474, 1, 20, 60, 1.3475670307845, 'korelasi positif', 0, 76, 53, 46, 0.64406779661017, 0.44915254237288, 0.38983050847458, 2),
('OSN Biologi', 'ESPS GEOGRAFI', 38.983050847458, 44.915254237288, 86.79245283019, 1, 20, 60, 1.3475670307845, 'korelasi positif', 0, 53, 76, 46, 0.44915254237288, 0.64406779661017, 0.38983050847458, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `denda`
--

CREATE TABLE `denda` (
  `id` int(11) NOT NULL,
  `tgl_pinjam` text DEFAULT NULL,
  `tgl_kembali` text DEFAULT NULL,
  `no_pinjam` text DEFAULT NULL,
  `nama` date DEFAULT NULL,
  `judul` text DEFAULT NULL,
  `denda` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `denda`
--

INSERT INTO `denda` (`id`, `tgl_pinjam`, `tgl_kembali`, `no_pinjam`, `nama`, `judul`, `denda`) VALUES
(1, 'tarzan', '123123', '15505', '2022-02-10', 'admin', '2022-02-25'),
(2, 'Mentari', '9123971', '100000', '2022-02-17', 'ADOLF FORTSMAN', '2022-02-25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset1`
--

CREATE TABLE `itemset1` (
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset1`
--

INSERT INTO `itemset1` (`atribut`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('The King Pocked Matematika', 9, 75, 1, 1),
('HAFAL MATERI SEJARAH', 9, 75, 1, 1),
('ESPS GEOGRAFI', 6, 50, 1, 1),
('Strategi Kebut Semalam', 6, 50, 1, 1),
('OSN Biologi', 4, 33.333333333333, 1, 1),
('BIG BOOK MATEMATIKA', 2, 16.666666666667, 0, 1),
('The King Pocked Matematika', 9, 75, 1, 2),
('HAFAL MATERI SEJARAH', 9, 75, 1, 2),
('ESPS GEOGRAFI', 6, 50, 1, 2),
('Strategi Kebut Semalam', 6, 50, 1, 2),
('OSN Biologi', 4, 33.333333333333, 1, 2),
('BIG BOOK MATEMATIKA', 2, 16.666666666667, 0, 2),
('The King Pocked Matematika', 1, 100, 1, 3),
('HAFAL MATERI SEJARAH', 1, 100, 1, 3),
('Strategi Kebut Semalam', 1, 100, 1, 3),
('ESPS MATEMATIKA 1', 9, 75, 1, 1),
('ESPS MATEMATIKA 2', 9, 75, 1, 1),
('ESPS MATEMATIKA 3', 6, 50, 1, 1),
('MATEMATIKA SMA 1', 6, 50, 1, 1),
('MATEMATIKA SMA 2 ', 4, 33.333333333333, 1, 1),
('MATEMATIKA SMA 3 ', 2, 16.666666666667, 0, 1),
('Berbahasa Indonesia untuk SMA 1', 1, 100, 1, 3),
('Berbahasa Indonesia untuk SMA 2', 1, 100, 1, 3),
('Berbahasa Indonesia untuk SMA 3', 1, 100, 1, 3),
('PPKN SMA 1 ', 9, 75, 1, 2),
('PPKN SMA 2', 9, 75, 1, 2),
('PPKN SMA 3 ', 6, 50, 1, 2),
('Seni budaya SMA 1', 6, 50, 1, 2),
('Seni budaya SMA 2', 4, 33.333333333333, 1, 2),
('Seni budaya SMA 3', 2, 16.666666666667, 0, 2),
('English cours 1', 1, 100, 1, 3),
('English cours 2', 1, 100, 1, 3),
('English cours 3', 1, 100, 1, 3),
('IPA terpadu untuk SMA', 1, 100, 1, 3),
('ESPS Ipa', 1, 100, 1, 3),
('ESPS Ipa 2', 1, 100, 1, 3),
('The King Pocked Matematika', 72, 61.016949152542, 1, 0),
('HAFAL MATERI SEJARAH', 88, 74.576271186441, 1, 0),
('ESPS GEOGRAFI', 76, 64.406779661017, 1, 0),
('Strategi Kebut Semalam', 42, 35.593220338983, 1, 0),
('OSN Biologi', 53, 44.915254237288, 1, 0),
('BIG BOOK MATEMATIKA', 14, 11.864406779661, 0, 0),
('BIG BAAK MATEMATIKA', 9, 7.6271186440678, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset2`
--

CREATE TABLE `itemset2` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset2`
--

INSERT INTO `itemset2` (`atribut1`, `atribut2`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('The King Pocked Matematika', 'MATEMATIKA SMA 1', 6, 50, 1, 1),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 3, 25, 0, 1),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 6, 50, 1, 1),
('The King Pocked Matematika', 'OSN Biologi', 1, 8.3333333333333, 0, 1),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 4, 33.333333333333, 1, 1),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 4, 33.333333333333, 1, 1),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 4, 33.333333333333, 1, 1),
('ESPS GEOGRAFI', 'Strategi Kebut Semalam', 1, 8.3333333333333, 0, 1),
('ESPS GEOGRAFI', 'OSN Biologi', 3, 25, 0, 1),
('Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 1),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 6, 50, 1, 2),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 3, 25, 0, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 6, 50, 1, 2),
('The King Pocked Matematika', 'OSN Biologi', 1, 8.3333333333333, 0, 2),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 4, 33.333333333333, 1, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 4, 33.333333333333, 1, 2),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 4, 33.333333333333, 1, 2),
('ESPS GEOGRAFI', 'Strategi Kebut Semalam', 1, 8.3333333333333, 0, 2),
('ESPS GEOGRAFI', 'OSN Biologi', 3, 25, 0, 2),
('Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 2),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 1, 100, 1, 3),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 1, 100, 1, 3),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 1, 100, 1, 3),
('ESPS MATEMATIKA 1', 'HAFAL MATERI SEJARAH', 6, 50, 1, 1),
('ESPS MATEMATIKA 1', 'PPKN SMA 1', 3, 25, 0, 1),
('ESPS MATEMATIKA 1', 'Seni budaya SMA 1', 6, 50, 1, 1),
('ESPS MATEMATIKA 1', 'English cours 1', 1, 8.3333333333333, 0, 1),
('MATEMATIKA SMA 2', 'ESPS MATEMATIKA 1', 4, 33.333333333333, 1, 1),
('MATEMATIKA SMA 2', 'ESPS MATEMATIKA 2', 4, 33.333333333333, 1, 1),
('MATEMATIKA SMA 2', 'ESPS MATEMATIKA 3', 4, 33.333333333333, 1, 1),
('PPKN SMA 1', 'Seni budaya SMA 2', 1, 8.3333333333333, 0, 1),
('PPKN SMA 1', 'Seni budaya SMA 3', 3, 25, 0, 1),
('ESPS MATEMATIKA 2', 'MATEMATIKA SMA 2', 0, 0, 0, 1),
('Seni budaya SMA 1', 'Seni budaya SMA 2', 6, 50, 1, 2),
('Seni budaya SMA 1', 'Seni budaya SMA 3', 3, 25, 0, 2),
('Seni budaya SMA 1', 'PPKN SMA 2', 6, 50, 1, 2),
('Seni budaya SMA 1', 'PPKN SMA 1', 1, 8.3333333333333, 0, 2),
('English cours 1', 'Seni budaya SMA 1', 4, 33.333333333333, 1, 2),
('English cours 2', 'Seni budaya SMA 2', 4, 33.333333333333, 1, 2),
('English cours 3', 'Seni budaya SMA 3', 4, 33.333333333333, 1, 2),
('ESPS GEOGRAFI', 'Strategi Kebut Semalam', 1, 8.3333333333333, 0, 2),
('ESPS GEOGRAFI', 'OSN Biologi', 3, 25, 0, 2),
('ESPS PPKN ', 'PPKN SMA 2', 0, 0, 0, 2),
('IPA terpadu untuk SMA', 'ESPS PPKN', 1, 100, 1, 3),
('ESPS Ipa', 'Berbahasa Indonesia untuk SMA 1', 1, 100, 1, 3),
('ESPS Ipa 2', 'Berbahasa Indonesia untuk SMA 2', 1, 100, 1, 3),
('Berbahasa Indonesia untuk SMA 1', 'Seni budaya SMA 1', 4, 33.333333333333, 1, 2),
('Berbahasa Indonesia untuk SMA 2', 'Seni budaya SMA 2', 4, 33.333333333333, 1, 2),
('Berbahasa Indonesia untuk SMA 3', 'Seni budaya SMA 3', 4, 33.333333333333, 1, 2),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 42, 35.593220338983, 1, 0),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 30, 25.423728813559, 1, 0),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 42, 35.593220338983, 1, 0),
('The King Pocked Matematika', 'OSN Biologi', 7, 5.9322033898305, 0, 0),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 53, 44.915254237288, 1, 0),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 28, 23.728813559322, 1, 0),
('HAFAL MATERI SEJARAH', 'OSN Biologi', 53, 44.915254237288, 1, 0),
('ESPS GEOGRAFI', 'Strategi Kebut Semalam', 7, 5.9322033898305, 0, 0),
('ESPS GEOGRAFI', 'OSN Biologi', 46, 38.983050847458, 1, 0),
('Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `itemset3`
--

CREATE TABLE `itemset3` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itemset3`
--

INSERT INTO `itemset3` (`atribut1`, `atribut2`, `atribut3`, `jumlah`, `support`, `lolos`, `id_process`) VALUES
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 4, 33.333333333333, 1, 1),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 1, 8.3333333333333, 0, 1),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'OSN Biologi', 1, 8.3333333333333, 0, 1),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 'ESPS GEOGRAFI', 1, 8.3333333333333, 0, 1),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 'ESPS GEOGRAFI', 0, 0, 0, 1),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 1),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 1),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 'OSN Biologi', 3, 25, 0, 1),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 4, 33.333333333333, 1, 2),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 1, 8.3333333333333, 0, 2),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'OSN Biologi', 1, 8.3333333333333, 0, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 'ESPS GEOGRAFI', 1, 8.3333333333333, 0, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 'ESPS GEOGRAFI', 0, 0, 0, 2),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 2),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 2),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 'OSN Biologi', 3, 25, 0, 2),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 1, 100, 1, 3),
('ESPS MATEMATIKA 1', 'MATEMATIKA 2', 'ESPS MATEMATIKA 3', 4, 33.333333333333, 1, 1),
('ESPS MATEMATIKA 2', 'MATEMATIKA 1', 'ESPS MATEMATIKA 1', 1, 8.3333333333333, 0, 1),
('ESPS MATEMATIKA 3', 'MATEMATIKA 3', 'ESPS MATEMATIKA 2i', 1, 8.3333333333333, 0, 1),
('MATEMATIKA 1', 'PPKN SMA 1 ', 'MATEMATIKA 2', 1, 8.3333333333333, 0, 1),
('ESPS PPKN ', 'MATEMATIKA 2', 'EMATEMATIKA 3', 0, 0, 0, 1),
('PPKN KELAS 2', 'ESPS MATEMATIKA 2', 'ESPS PPKN ', 0, 0, 0, 1),
('Seni budaya SMA 1 ', 'PPKN KELAS 2', 'Seni budaya SMA 3', 0, 0, 0, 1),
('Seni budaya SMA 2', 'PPKN SMA 1', 'ESPS PPKN', 3, 25, 0, 1),
('Seni budaya SMA 3', 'ESPS PPKN', 'Seni budaya SMA 2', 4, 33.333333333333, 1, 2),
('IPA terpadu untuk SMA ', 'ESPS PPKN', 'PPKN SMA 1', 1, 8.3333333333333, 0, 2),
('IPA terpadu untuk SMA ', 'ESPS Ipa 2', 'ESPS Ipa ', 1, 8.3333333333333, 0, 2),
('ESPS Ipa ', 'IPA terpadu untuk SMA', 'ESPS Ipa 2', 1, 8.3333333333333, 0, 2),
('Berbahasa Indonesia untuk SMA 1 ', 'ESPS Ipa 2', 'Berbahasa Indonesia untuk SMA 3', 0, 0, 0, 2),
('Berbahasa Indonesia untuk SMA 2', 'IPA terpadu untuk SMA', 'ESPS Ipa ', 0, 0, 0, 2),
('Berbahasa Indonesia untuk SMA 3', 'Berbahasa Indonesia untuk SMA 1', 'ESPS Ipa 2', 0, 0, 0, 2),
('English cours 1', 'Berbahasa Indonesia untuk SMA 1', 'English cours 3', 3, 25, 0, 2),
('English cours 2', 'Berbahasa Indonesia untuk SMA 3', 'English cours 1', 1, 100, 1, 3),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 7, 5.9322033898305, 0, 0),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 28, 23.728813559322, 1, 0),
('The King Pocked Matematika', 'HAFAL MATERI SEJARAH', 'OSN Biologi', 7, 5.9322033898305, 0, 0),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 'OSN Biologi', 0, 0, 0, 0),
('ESPS GEOGRAFI', 'HAFAL MATERI SEJARAH', 'OSN Biologi', 46, 38.983050847458, 1, 0),
('The King Pocked Matematika', 'ESPS GEOGRAFI', 'Strategi Kebut Semalam', 7, 5.9322033898305, 0, 0),
('HAFAL MATERI SEJARAH', 'ESPS GEOGRAFI', 'Strategi Kebut Semalam', 0, 0, 0, 0),
('The King Pocked Matematika', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 0),
('HAFAL MATERI SEJARAH', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 0),
('ESPS GEOGRAFI', 'Strategi Kebut Semalam', 'OSN Biologi', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `process_log`
--

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `process_log`
--

INSERT INTO `process_log` (`id`, `start_date`, `end_date`, `min_support`, `min_confidence`) VALUES
(1, '2021-01-01', '2021-12-01', 30, 60),
(2, '2021-01-01', '2021-12-01', 30, 60),
(3, '2021-05-01', '2021-05-01', 20, 40),
(0, '2022-02-22', '2022-02-22', 30, 60),
(0, '2021-01-01', '2022-01-01', 30, 60),
(0, '2021-01-01', '2021-12-31', 30, 60),
(0, '2021-01-01', '2022-04-24', 20, 50),
(0, '2021-01-01', '2022-04-24', 20, 50),
(0, '2021-01-01', '2022-02-22', 20, 60),
(0, '2021-01-01', '2022-02-22', 20, 60),
(0, '2021-01-01', '2022-02-22', 20, 60),
(0, '2021-01-01', '2022-02-22', 20, 60),
(0, '2021-01-01', '2022-02-22', 30, 60),
(0, '2022-01-01', '2022-02-22', 30, 60),
(0, '2022-01-01', '2022-02-22', 20, 60),
(0, '2021-01-01', '2022-02-24', 20, 60);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `produk` text DEFAULT NULL,
  `kategori` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `transaction_date`, `produk`, `kategori`) VALUES
(1, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(2, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(3, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(4, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(5, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(6, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(7, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(8, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(9, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(10, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(11, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(12, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(13, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(14, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(15, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(16, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(17, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(18, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(19, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(20, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(21, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(22, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(23, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(24, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(25, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(26, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(27, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(28, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(29, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(30, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(31, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(32, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(33, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(34, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(35, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(36, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(37, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(38, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(39, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(40, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(41, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(42, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(43, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(44, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(45, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(46, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(47, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(48, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(49, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(50, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(51, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(52, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(53, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(54, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(55, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(56, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(57, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(58, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(59, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(60, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(61, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(62, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(63, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(64, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(65, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(66, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(67, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(68, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(69, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(70, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(71, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(72, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(73, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(74, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(75, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(76, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(77, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(78, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(79, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(80, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(81, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(82, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(83, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(84, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(85, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(86, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(87, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(88, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(89, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(90, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(91, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(92, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(93, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(94, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(95, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(96, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(97, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(98, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(99, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(100, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(101, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk'),
(102, '2021-01-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,ESPS GEOGRAFI', 'mtk'),
(103, '2021-02-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(104, '2021-03-01', 'The King Pocked Matematika,Strategi Kebut Semalam,ESPS GEOGRAFI', 'ips'),
(105, '2021-04-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(106, '2021-05-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(107, '2021-06-01', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BOOK MATEMATIKA', 'mtk'),
(108, '2021-07-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(109, '2021-08-01', 'The King Pocked Matematika,Strategi Kebut Semalam,BIG BOOK MATEMATIKA', 'mtk'),
(110, '2021-09-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,Strategi Kebut Semalam', 'mtk'),
(111, '2021-10-01', 'The King Pocked Matematika,HAFAL MATERI SEJARAH,OSN Biologi', 'mtk'),
(112, '2021-11-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(113, '2021-12-01', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(114, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(115, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ipa'),
(116, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(117, '2022-02-09', 'HAFAL MATERI SEJARAH,ESPS GEOGRAFI,OSN Biologi', 'ips'),
(118, '2022-02-09', 'The King Pocked Matematika,ESPS GEOGRAFI,BIG BAAK MATEMATIKA', 'mtk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `level`, `last_login`, `inactive`) VALUES
(1, 'admin', 'Administrator', '21232f297a57a5a743894a0e4a801fc3', 1, '2017-02-22 01:49:04', 0),
(2, 'user', 'User Direktur', 'ee11cbb19052e40b07aac0ca060c23ee', 2, '2016-05-22 09:19:02', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
