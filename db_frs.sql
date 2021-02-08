-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2021 at 05:45 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_frs`
--

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_mhs`
--

CREATE TABLE `kontrak_mhs` (
  `kd_kontrak` int(11) NOT NULL,
  `kd_jadwal` varchar(24) NOT NULL,
  `nim` varchar(25) NOT NULL,
  `approve` int(11) DEFAULT 0,
  `nilai` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kontrak_mhs`
--

INSERT INTO `kontrak_mhs` (`kd_kontrak`, `kd_jadwal`, `nim`, `approve`, `nilai`) VALUES
(1, 'TINFCW1', '20180810078', 1, 'AB'),
(2, 'TINFCW2', '20180810078', 1, ''),
(3, 'TINFCW2', '20180810000', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(15) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `email`, `password`) VALUES
('a11', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_dosen`
--

CREATE TABLE `tb_dosen` (
  `nip` varchar(25) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `no_telp` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_dosen`
--

INSERT INTO `tb_dosen` (`nip`, `nama`, `no_telp`, `email`, `password`, `status`) VALUES
('026877965', 'Abc', '080808', 'dosen1@uniku.ac.id', 'dosen1', 'Pengajar'),
('026877969', 'abcdefg', '0888888', 'dosen2@gmail.com', 'dosen2', 'Pembimbing');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `kd_jadwal` varchar(24) NOT NULL,
  `hari` varchar(24) NOT NULL,
  `jam` varchar(24) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `kelas` varchar(24) NOT NULL,
  `kd_matkul` int(11) NOT NULL,
  `nip` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`kd_jadwal`, `hari`, `jam`, `sks`, `semester`, `kelas`, `kd_matkul`, `nip`) VALUES
('TINFCW1', 'Senin', '09:40-12:10', 3, 1, 'TI-2018-C', 110, '026877965'),
('TINFCW2', 'Rabu', '03:46-04:47', 3, 3, 'TI-2018-B', 112, '026877965'),
('TINFCW3', 'Senin', '05:14-06:14', 3, 2, 'TI-2019-A', 110, '026877969');

-- --------------------------------------------------------

--
-- Table structure for table `tb_matkul`
--

CREATE TABLE `tb_matkul` (
  `kd_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(32) NOT NULL,
  `syarat_matkul` varchar(32) NOT NULL,
  `jenis` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_matkul`
--

INSERT INTO `tb_matkul` (`kd_matkul`, `nama_matkul`, `syarat_matkul`, `jenis`) VALUES
(110, 'Algoritma dan Pemrograman', '-', 'Wajib'),
(111, 'Bahasa Pemrograman 1', 'Algoritma dan Pemrograman', 'Wajib'),
(112, 'Statistika', '-', 'Pilihan');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mhs`
--

CREATE TABLE `tb_mhs` (
  `nim` varchar(25) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `kelas` varchar(15) NOT NULL,
  `no_telp` varchar(24) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mhs`
--

INSERT INTO `tb_mhs` (`nim`, `nama`, `kelas`, `no_telp`, `email`, `password`) VALUES
('20180810000', 'ABCD', 'TI-2018-A', '0989898', '20180810000@uniku.ac.id', 'mhs2'),
('20180810078', 'Raynold', 'TI-2018-C', '088888888', '20180810078@uniku.ac.id', 'mhs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kontrak_mhs`
--
ALTER TABLE `kontrak_mhs`
  ADD PRIMARY KEY (`kd_kontrak`),
  ADD KEY `nim` (`nim`),
  ADD KEY `kd_jadwal` (`kd_jadwal`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_dosen`
--
ALTER TABLE `tb_dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`kd_jadwal`),
  ADD KEY `kd_matkul` (`kd_matkul`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `tb_matkul`
--
ALTER TABLE `tb_matkul`
  ADD PRIMARY KEY (`kd_matkul`);

--
-- Indexes for table `tb_mhs`
--
ALTER TABLE `tb_mhs`
  ADD PRIMARY KEY (`nim`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kontrak_mhs`
--
ALTER TABLE `kontrak_mhs`
  ADD CONSTRAINT `kontrak_mhs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_mhs` (`nim`),
  ADD CONSTRAINT `kontrak_mhs_ibfk_2` FOREIGN KEY (`kd_jadwal`) REFERENCES `tb_jadwal` (`kd_jadwal`);

--
-- Constraints for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `tb_matkul` (`kd_matkul`),
  ADD CONSTRAINT `tb_jadwal_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `tb_dosen` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
