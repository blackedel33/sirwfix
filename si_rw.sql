-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2018 at 12:04 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_rw`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'seketaris', ''),
(4, 'bendahara', ''),
(5, 'rw', '');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tgl_komentar` date NOT NULL,
  `isi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `judul`, `tgl_komentar`, `isi`) VALUES
(1, 'test komen coy 1', '2018-10-04', 'ini komentar'),
(2, 'test 2', '2018-10-04', 'komentar ke pak rw');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '::1', 'salah', 1538819656),
(2, '::1', 'sa', 1538819695),
(3, '::1', 'fkk', 1538819709),
(4, '::1', 'salahkan', 1538819782),
(5, '::1', 'bendahara@bendahara', 1538819798),
(6, '::1', 'bendahara@bendahara', 1538819807);

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `tgl_posting`, `keterangan`, `foto`) VALUES
(13, 'Pengumuman bagi seluruh warga RT 12.', '2018-10-05', 'Besok diadakan kerja bakti di sekolah. Soalnya sekolah kita sudah terlalu kotor, jadi butuh yang namanya kebersihan.', '1538699793.jpg'),
(14, 'Makan Bersama', '2018-10-05', 'Besok akan diadakan makan besar pada jam 12.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1538820141, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', 'seketaris', '$2y$08$X/xBkd.LXktfIriev6p1PukaZTmtme0wFxFckIH1SAJwK.hiHCFuO', NULL, 'seketaris@seketaris.com', NULL, NULL, NULL, NULL, 1538813567, 1538819645, 1, 'seketaris', 'Seketaris', '7 Miracle', '08332348790'),
(3, '::1', 'bendahara@bendahara.com', '$2y$08$AkcZQlTDE4OLYCdwrzOlXuTtn9Q0961CqZb.lUrs5M0nTDK2L6kSy', NULL, 'bendahara@bendahara.com', NULL, NULL, NULL, NULL, 1538813766, 1538819817, 1, 'Bendahara', 'bendahara', '7 Miracle', '0834434354'),
(4, '::1', 'rw@rw.com', '$2y$08$d74W8UnHjm/ecS29gf2yi.vZFIZL1xH/ZR7NprX7yqaP133A2zh12', NULL, 'rw@rw.com', NULL, NULL, NULL, NULL, 1538813816, 1538819316, 1, 'rw', 'rw', '7 Miracle', '084934834589');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(5, 1, 1),
(6, 2, 3),
(9, 3, 4),
(11, 4, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
