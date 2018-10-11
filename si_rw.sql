-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2018 at 04:27 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `si_rw`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'sekretaris', ''),
(4, 'bendahara', ''),
(5, 'rw', '');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `tgl_komentar` date NOT NULL,
  `isi` varchar(255) NOT NULL,
  `id_warga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `judul`, `tgl_komentar`, `isi`, `id_warga`) VALUES
(2, 'test 2', '2018-10-04', 'komentar ke pak rw', 2),
(4, 'Wingi Prei', '2018-10-07', 'Aku pingin Prei', 3),
(5, 'judul', '2018-10-08', 'ini komentar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(23, '::1', 'paimanuri@gmail.com', 1539255880),
(24, '::1', 'paimanuri@gmail.com', 1539256063);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE IF NOT EXISTS `pengumuman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `tgl_posting`, `keterangan`, `foto`) VALUES
(13, 'Pengumuman bagi seluruh warga RT 900', '2018-10-05', 'Besok diadakan kerja bakti di sekolah. Soalnya sekolah kita sudah terlalu kotor, jadi butuh yang namanya kebersihan.', '1538903250.png'),
(14, 'Makan Bersama', '2018-10-05', 'Besok akan diadakan makan besar pada jam 12.00', ''),
(16, 'Makan Besar', '2018-10-07', 'Besok diadakan makan makan', '1538903347.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_pembayaran`
--

CREATE TABLE IF NOT EXISTS `tabel_pembayaran` (
  `id_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_bayar` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto_bukti` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tabel_pembayaran`
--

INSERT INTO `tabel_pembayaran` (`id_bayar`, `tgl_bayar`, `keterangan`, `foto_bukti`) VALUES
(1, '2018-10-11', 'test', '1539257821.jpg'),
(2, '2018-10-11', 'momon', '1539258217.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1539255135, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', 'sekretaris', '$2y$08$X/xBkd.LXktfIriev6p1PukaZTmtme0wFxFckIH1SAJwK.hiHCFuO', NULL, 'seketaris@seketaris.com', NULL, NULL, NULL, NULL, 1538813567, 1538899764, 1, 'seketaris', 'Seketaris', 'ADMIN', '08332348790'),
(3, '::1', 'bendahara', '$2y$08$AkcZQlTDE4OLYCdwrzOlXuTtn9Q0961CqZb.lUrs5M0nTDK2L6kSy', NULL, 'bendahara@bendahara.com', NULL, NULL, NULL, NULL, 1538813766, 1538976686, 1, 'Bendahara', 'bendahara', 'ADMIN', '0834434354'),
(4, '::1', 'rw', '$2y$08$d74W8UnHjm/ecS29gf2yi.vZFIZL1xH/ZR7NprX7yqaP133A2zh12', NULL, 'rw@rw.com', NULL, NULL, NULL, NULL, 1538813816, 1539256550, 1, 'rw', 'rw', 'ADMIN', '084934834589');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(5, 1, 1),
(6, 2, 3),
(9, 3, 4),
(11, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `warga`
--

CREATE TABLE IF NOT EXISTS `warga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `warga`
--

INSERT INTO `warga` (`id`, `nik`, `nama`, `jenis_kelamin`, `alamat`, `email`, `password`) VALUES
(1, '356676756788', 'PAIMANURI', 'L', 'Jl. Melati No. 15 RT. 99', 'paimanuri@gmail.com', '4ab7d9d3a2a915753862aa89e6ff319c'),
(3, '377483745876987', 'SUPERMAN', 'L', 'Jl. Melati No. 1 RT. 99', 'superman@gmail.com', '4ab7d9d3a2a915753862aa89e6ff319c');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
