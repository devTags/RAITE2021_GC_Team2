-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2021 at 09:40 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinicord_pdo_db`
--
CREATE DATABASE IF NOT EXISTS `clinicord_pdo_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clinicord_pdo_db`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_tbl`
--

CREATE TABLE `accounts_tbl` (
  `id` int(11) NOT NULL,
  `User_username` varchar(50) NOT NULL,
  `User_email` varchar(50) NOT NULL,
  `User_password` varchar(100) NOT NULL,
  `User_token` varchar(100) NOT NULL,
  `User_image` varchar(255) NOT NULL,
  `User_role` varchar(10) NOT NULL,
  `User_Verified` varchar(5) NOT NULL,
  `User_passwordchanged` tinyint(11) DEFAULT NULL,
  `isdeleted` tinyint(11) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_tbl`
--

INSERT INTO `accounts_tbl` (`id`, `User_username`, `User_email`, `User_password`, `User_token`, `User_image`, `User_role`, `User_Verified`, `User_passwordchanged`, `isdeleted`, `CreatedOn`, `UpdatedOn`) VALUES
(1, 'admin123', 'clinicordadmin@gmail.com', '$2y$10$NmI1MzFkNjc5MGRmNzRiMOLDxxVbR2ivyzYjo0Rf46LIvh3lQ2ELi', 'YjY1MjY1ZjMxMjFjOWVmYzI5MmNhNjZkY2IxODU0OTRlNzI0YjkzMTkzMjkzZTg5MDFlYzcxZmRlNTRhNWE1MA', '', 'admin', 'T', 0, 0, '2021-08-31 17:33:06', '2021-09-01 13:18:48'),
(2, 'tags123', '201810282@gordoncollege.edu.ph', '$2y$10$NmI1MzFkNjc5MGRmNzRiMOLDxxVbR2ivyzYjo0Rf46LIvh3lQ2ELi', 'MmUwYTc5ZGMzYTU2YTM4NzNhMjg3Mjk2NDU3MjI0NWVkNTliMzQwOWI4YjA4ODI5MjQzOWMyNWU1NzY4ZWFiMw', '20210518T164155+0800.png', '0', 'T', 1, 0, '2021-08-31 17:50:45', '2021-09-01 12:18:02'),
(4, 'prince09', 'princekyledelacruz@gmail.com', '$2y$10$YTU2YjM5MjYxOTk1OWQxOOywnicyiQtPDvb.sIrXQQsVD2bvDsjJO', 'NGU2NGE5MGM5ZTM1MWRlMjM2NzU3ODM0ZDQ1NWNiYmQ2MjUzN2U4NDU5NzcxMDA1MjVhOTNjNzE2MTczMmEwOQ', '20210525T193019+0800.png', '1', 'T', 0, 0, '2021-08-25 22:36:56', '2021-08-31 17:51:05'),
(5, 'benedict123', 'ronpanes66@gmail.com', '$2y$10$N2M1YmViNTBiN2U1YjUzYeadSyBJSMOa8yo1M.p0nhNfNt6dRgOw2', 'ZGE3ZDBkNDY5YWM1YzlhYWZhMTYzOTY1ZjRkOWE4OTY3OThkMTY0ZWEwMjZkNWU4YWIyZDUzMGIzNGYzMjdjMQ', '20210526T183248+0800.png', '0', 'T', 0, 0, '2021-08-31 17:50:06', '2021-08-31 17:50:06'),
(6, 'Vv09123', 'geraldtagle09@gmail.com', '$2y$10$NGVmMjI1ODFhZWUxMGM5ZOjBrrx4xsA2N9zGVVye4.GxR4mn/Lu2C', 'Yjg4ZGYxYTQ3NDFiZTJiZmNlYjM5ZTUyOTI2NDFlMDRlNmRjMGJmOWNjMzhhMTUyYjFkZDg0YjQyZDEzNWRjZA', '20210527T165220+0800.png', '1', 'T', 0, 0, '2021-08-23 19:40:14', '2021-08-23 19:40:14'),
(12, 'conrad123', 'geraldtagle@ymail.com', '$2y$10$YTlkMjg3NzFlMTM0MmQzZeh2VaIzIO15e9bM/vLWMpBhbK/y7wU0e', 'YmE2ODM3ZTk3Y2FlMjRkY2NhMGM5NjUxZDA1YWYzYTNkMTNiMDAzMWJkMmY5ZWMxMTAwNDZiMTU3OWZlZDE4Yg', '20210530T153154+0800.png', '1', 'T', 0, 0, '2021-08-23 19:39:54', '2021-08-23 19:39:54'),
(13, 'ron123', 'roninpeyns@gmail.com', '$2y$10$Y2M2Y2I4NWIyYWVmYjEwZ.aDJAngPCEsch1gSQssiGhwy07zk3u3K', 'Mzc5MTNiNDhhNzU1YmYzODVmZjliZDkwNGIwYjRjZGMyNTEwNWRhYjM2YTQyZDM0ODVlMzBiM2VmNjg5MDUwMA', '20210603T162933+0800.png', '1', 'T', 0, 0, '2021-08-23 21:49:02', '2021-08-23 21:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `checkup_tbl`
--

CREATE TABLE `checkup_tbl` (
  `ap_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Doctor_id` int(11) NOT NULL,
  `ap_type` varchar(255) NOT NULL,
  `ap_date` date NOT NULL,
  `ap_time` varchar(10) NOT NULL,
  `ap_status` varchar(100) NOT NULL,
  `ap_description` varchar(100) NOT NULL,
  `ap_specialize` varchar(30) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsDeleted` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkup_tbl`
--

INSERT INTO `checkup_tbl` (`ap_id`, `U_id`, `Doctor_id`, `ap_type`, `ap_date`, `ap_time`, `ap_status`, `ap_description`, `ap_specialize`, `createdOn`, `UpdatedOn`, `IsDeleted`) VALUES
(264, 2, 4, '', '2021-08-17', '01:00 PM', 'Approved', 'Regular Cleaning', 'Dental Specialist', '2021-08-16 12:58:42', '0000-00-00 00:00:00', 'F'),
(265, 2, 12, '', '2021-08-17', '11:00 AM', 'Approved', 'Tooth Braces', 'Dental Specialist', '2021-08-16 13:01:00', '2021-08-25 12:27:20', 'F'),
(266, 2, 13, '', '2021-08-20', '08:00 AM', 'Approved', 'Random Checkup', 'Dental Specialist', '2021-08-19 09:08:16', '2021-08-25 12:27:17', 'F'),
(267, 2, 6, '', '2021-08-23', '04:00 PM', 'Pending', 'random checkup', 'Dental Specialist', '2021-08-19 13:38:49', '2021-08-24 11:54:43', 'F'),
(268, 2, 4, '', '2021-08-22', '04:00 PM', 'Pending', 'test', 'Dental Specialist', '2021-08-21 12:39:12', '2021-08-25 12:59:16', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `client_tbl`
--

CREATE TABLE `client_tbl` (
  `Client_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Client_name` varchar(40) NOT NULL,
  `Client_gender` varchar(10) NOT NULL,
  `Client_age` varchar(5) NOT NULL,
  `Client_birthdate` date NOT NULL,
  `Client_address` varchar(100) NOT NULL,
  `Client_phone` varchar(12) NOT NULL,
  `Client_weight` decimal(5,2) NOT NULL,
  `Client_height` decimal(3,2) NOT NULL,
  `Client_bloodtype` varchar(5) NOT NULL,
  `Client_healthcondition` text NOT NULL,
  `Client_healthsymptoms` text NOT NULL,
  `Client_healthmedication` text NOT NULL,
  `Client_healtallergies` text NOT NULL,
  `Client_healthtobacco` text NOT NULL,
  `Client_drughistory` text NOT NULL,
  `Client_alcoholhistory` text NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` datetime NOT NULL,
  `IsDeleted` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_tbl`
--

INSERT INTO `client_tbl` (`Client_id`, `U_id`, `Client_name`, `Client_gender`, `Client_age`, `Client_birthdate`, `Client_address`, `Client_phone`, `Client_weight`, `Client_height`, `Client_bloodtype`, `Client_healthcondition`, `Client_healthsymptoms`, `Client_healthmedication`, `Client_healtallergies`, `Client_healthtobacco`, `Client_drughistory`, `Client_alcoholhistory`, `createdOn`, `UpdatedOn`, `IsDeleted`) VALUES
(1, 2, 'Gerald Tagle', 'Male', '22', '1999-09-09', 'Olongapo City', '09301189136', '55.00', '1.71', 'O+', 'Good', 'Cold', 'No', 'No', 'No', 'No', 'Occasionally', '2021-05-18 16:41:56', '2021-05-31 18:01:30', 'F'),
(2, 5, 'Ron Panes', 'Male', '23', '2011-05-26', 'West Bajac Bajac, Olongapo City', '09123456789', '66.00', '1.71', 'O+', 'None', 'None', 'Yes', 'No', 'No', 'No', 'Occasionally', '2021-05-26 18:32:49', '2021-05-31 18:01:25', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `docratings_tbl`
--

CREATE TABLE `docratings_tbl` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_tbl`
--

CREATE TABLE `doctor_tbl` (
  `Doctor_id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Doctor_name` varchar(30) NOT NULL,
  `Doctor_specialty` varchar(30) NOT NULL,
  `Doctor_gender` varchar(10) NOT NULL,
  `Doctor_age` varchar(11) NOT NULL,
  `Doctor_birthdate` date NOT NULL,
  `Doctor_address` varchar(50) NOT NULL,
  `Doctor_phone` varchar(12) NOT NULL,
  `Doctor_license` varchar(255) NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdatedOn` datetime NOT NULL,
  `IsDeleted` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_tbl`
--

INSERT INTO `doctor_tbl` (`Doctor_id`, `U_id`, `Doctor_name`, `Doctor_specialty`, `Doctor_gender`, `Doctor_age`, `Doctor_birthdate`, `Doctor_address`, `Doctor_phone`, `Doctor_license`, `createdOn`, `UpdatedOn`, `IsDeleted`) VALUES
(2, 4, 'Prince Dela Cruz', 'Dental Specialist', 'Male', '26', '2012-05-25', 'J.I.O Hernandez Dental Clinic', '09456789123', '20210530T153154+0800.png', '2021-06-02 19:45:44', '2021-05-31 18:43:11', 'F'),
(3, 6, 'Gerald  Bales', 'Dental Specialist', 'Male', '55', '2021-05-27', 'J.I.O Hernandez Dental Clinic', '09312645978', '20210530T153154+0800.png', '2021-06-02 19:45:48', '2021-05-31 18:43:04', 'F'),
(4, 12, 'Conrad Yap', 'Dental Specialist', 'Male', '55', '2014-05-30', 'J.I.O Hernandez Dental Clinic', '09987654321', '20210530T153154+0800.png', '2021-06-02 19:45:52', '2021-05-31 18:42:56', 'F'),
(5, 13, 'Ron Panes', 'Dental Specialist', 'Male', '22', '2021-06-03', 'J.I.O Hernandez Dental Clinic', '9123456789', '20210603T162933+0800.png', '2021-08-20 13:19:06', '0000-00-00 00:00:00', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `report_tbl`
--

CREATE TABLE `report_tbl` (
  `id` int(11) NOT NULL,
  `U_id` int(11) NOT NULL,
  `Doctor_id` int(11) NOT NULL,
  `client_report` varchar(100) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UpdatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkup_tbl`
--
ALTER TABLE `checkup_tbl`
  ADD PRIMARY KEY (`ap_id`),
  ADD KEY `U_id` (`U_id`),
  ADD KEY `Doctor_id` (`Doctor_id`);

--
-- Indexes for table `client_tbl`
--
ALTER TABLE `client_tbl`
  ADD PRIMARY KEY (`Client_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `docratings_tbl`
--
ALTER TABLE `docratings_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_tbl`
--
ALTER TABLE `doctor_tbl`
  ADD PRIMARY KEY (`Doctor_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `report_tbl`
--
ALTER TABLE `report_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `checkup_tbl`
--
ALTER TABLE `checkup_tbl`
  MODIFY `ap_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `client_tbl`
--
ALTER TABLE `client_tbl`
  MODIFY `Client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `docratings_tbl`
--
ALTER TABLE `docratings_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_tbl`
--
ALTER TABLE `doctor_tbl`
  MODIFY `Doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `report_tbl`
--
ALTER TABLE `report_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkup_tbl`
--
ALTER TABLE `checkup_tbl`
  ADD CONSTRAINT `checkup_tbl_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `accounts_tbl` (`id`),
  ADD CONSTRAINT `checkup_tbl_ibfk_2` FOREIGN KEY (`Doctor_id`) REFERENCES `accounts_tbl` (`id`);

--
-- Constraints for table `client_tbl`
--
ALTER TABLE `client_tbl`
  ADD CONSTRAINT `client_tbl_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `accounts_tbl` (`id`);

--
-- Constraints for table `doctor_tbl`
--
ALTER TABLE `doctor_tbl`
  ADD CONSTRAINT `doctor_tbl_ibfk_1` FOREIGN KEY (`U_id`) REFERENCES `accounts_tbl` (`id`);
--
-- Database: `gc_team2`
--
CREATE DATABASE IF NOT EXISTS `gc_team2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gc_team2`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_tbl`
--

CREATE TABLE `accounts_tbl` (
  `id` int(11) NOT NULL,
  `username_fld` varchar(50) NOT NULL,
  `emailadd_fld` varchar(50) NOT NULL,
  `token_fld` varchar(100) NOT NULL,
  `password_fld` varchar(100) NOT NULL,
  `role_fld` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_tbl`
--

INSERT INTO `accounts_tbl` (`id`, `username_fld`, `emailadd_fld`, `token_fld`, `password_fld`, `role_fld`, `createdAt`) VALUES
(1, 'admin123', 'adminSeafarer@gmail.com', '', '123', '1', '2021-10-23 12:56:39'),
(2, 'admin1234', 'admin1234@gmail.com', 'OGE3YTk1NTQwODA3OWMxNTZhZTFmODllOTJiNWNlNGM2YWVjMWZkMjU5MWQ5ZDY5MjZmNzc2YjE4M2Q2ZmEyMw', '$2y$10$ZmI0M2I4Njg0NTdiOWFjMueSmacyTr.uK.QdYuRC/qZuFpQGTdUsW', '1', '2021-10-23 14:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `crews_tbl`
--

CREATE TABLE `crews_tbl` (
  `id` int(11) NOT NULL,
  `fname_fld` text NOT NULL,
  `mname_fld` text NOT NULL,
  `lname_fld` text NOT NULL,
  `rank_fld` varchar(20) NOT NULL,
  `filename_fld` varchar(50) NOT NULL,
  `isdeleted_fld` int(2) NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crews_tbl`
--

INSERT INTO `crews_tbl` (`id`, `fname_fld`, `mname_fld`, `lname_fld`, `rank_fld`, `filename_fld`, `isdeleted_fld`, `updatedOn`, `createdOn`) VALUES
(1, 'jose', 'b.', 'dela cruz', 'Third Mate', 'josebdelacruz', 0, '2021-10-23 14:43:27', '2021-10-23 14:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `routes_fld`
--

CREATE TABLE `routes_fld` (
  `id` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  `sfrom_fld` varchar(100) NOT NULL,
  `sto_fld` varchar(100) NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ships_tbl`
--

CREATE TABLE `ships_tbl` (
  `id` int(11) NOT NULL,
  `sno_fld` int(20) NOT NULL,
  `sname_fld` varchar(50) NOT NULL,
  `scompany_fld` varchar(100) NOT NULL,
  `sclass_fld` varchar(20) NOT NULL,
  `sknot_fld` int(11) NOT NULL,
  `isdeleted_fld` int(2) NOT NULL,
  `updatedOn` datetime NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ships_tbl`
--

INSERT INTO `ships_tbl` (`id`, `sno_fld`, `sname_fld`, `scompany_fld`, `sclass_fld`, `sknot_fld`, `isdeleted_fld`, `updatedOn`, `createdOn`) VALUES
(1, 123, 'MV Olongapo City', 'Gordon College', 'Normal', 23, 0, '0000-00-00 00:00:00', '2021-10-23 14:38:57'),
(2, 1234, 'MV Olongapo City', 'Gordon College', 'Normal', 23, 0, '0000-00-00 00:00:00', '2021-10-23 14:41:40'),
(3, 12324, 'MV Zambales', 'Gordon College', 'Normal', 23, 0, '2021-10-23 15:38:38', '2021-10-23 15:38:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crews_tbl`
--
ALTER TABLE `crews_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes_fld`
--
ALTER TABLE `routes_fld`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ships_tbl`
--
ALTER TABLE `ships_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crews_tbl`
--
ALTER TABLE `crews_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `routes_fld`
--
ALTER TABLE `routes_fld`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ships_tbl`
--
ALTER TABLE `ships_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `nodejs_db`
--
CREATE DATABASE IF NOT EXISTS `nodejs_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `nodejs_db`;

-- --------------------------------------------------------

--
-- Table structure for table `students_tbl`
--

CREATE TABLE `students_tbl` (
  `recno_fld` int(11) NOT NULL,
  `studno_fld` int(10) NOT NULL,
  `fname_fld` text NOT NULL,
  `mname_fld` text NOT NULL,
  `lname_fld` text NOT NULL,
  `program_fld` varchar(10) NOT NULL,
  `dept_fld` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students_tbl`
--

INSERT INTO `students_tbl` (`recno_fld`, `studno_fld`, `fname_fld`, `mname_fld`, `lname_fld`, `program_fld`, `dept_fld`) VALUES
(1, 201810282, 'Gerald', 'B', 'Tagle', 'BSCS', 'CCS');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `id` int(11) NOT NULL,
  `employeeno_fld` int(11) NOT NULL,
  `emailadd_fld` varchar(50) NOT NULL,
  `fname_fld` text NOT NULL,
  `mname_fld` text NOT NULL,
  `lname_fld` text NOT NULL,
  `dept_fld` varchar(20) NOT NULL,
  `token_fld` varchar(100) NOT NULL,
  `password_fld` varchar(200) NOT NULL,
  `status_fld` text NOT NULL,
  `createdon` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_tbl`
--

INSERT INTO `users_tbl` (`id`, `employeeno_fld`, `emailadd_fld`, `fname_fld`, `mname_fld`, `lname_fld`, `dept_fld`, `token_fld`, `password_fld`, `status_fld`, `createdon`) VALUES
(60, 2018102843, '2018102843@gordoncollege.edu.ph', 'Ricky', '', 'Morales', 'CCS', 'RlGnGna6EqloTbjNeRGCxxb-APfwbRSDmPd_RorVEQk', '$2b$12$bYuINdKs1fSzJTXA26cWBu4lSybwDoUaBh/dBnWVWcZNROQv2Pa9K', '1', '2021-10-22 21:39:28'),
(61, 2018102841, '2018102841@gordoncollege.edu.ph', 'Ricky', '', 'Morales', 'CCS', 'dn6QAsy21wo4gvU7U-pVdmy4_o2rzSr9M7JxQ25ig_Y', '$2b$12$gvXrGBndlw.rAlXlUBzzt..A1yRg6r1OgrmO1YPLw6TwKJrT1sWHy', '0', '2021-10-22 21:15:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students_tbl`
--
ALTER TABLE `students_tbl`
  ADD PRIMARY KEY (`recno_fld`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students_tbl`
--
ALTER TABLE `students_tbl`
  MODIFY `recno_fld` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- Dumping data for table `pma__column_info`
--

INSERT INTO `pma__column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`, `input_transformation`, `input_transformation_options`) VALUES
(1, 'gc_team2', 'crews_tbl', 'isdeleted_fld', '', '', '', '', '', 'UpdatedOn'),
(2, 'gc_team2', 'ships_tbl', 'knot_fld', '', '', '', '', '', 'UpdatedOn'),
(3, 'gc_team2', 'ships_tbl', 'updatedOn', '', '', '', '', '', 'createdOn'),
(4, 'gc_team2', 'ships_tbl', 'sknot_fld', '', '', '', '', '', 'UpdatedOn');

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"gc_team2\",\"table\":\"ships_tbl\"},{\"db\":\"gc_team2\",\"table\":\"crews_tbl\"},{\"db\":\"gc_team2\",\"table\":\"accounts_tbl\"},{\"db\":\"gc_team2\",\"table\":\"routes_fld\"},{\"db\":\"nodejs_db\",\"table\":\"users_tbl\"},{\"db\":\"clinicord_pdo_db\",\"table\":\"accounts_tbl\"},{\"db\":\"nodejs_db\",\"table\":\"students_tbl\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-10-23 07:40:10', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
