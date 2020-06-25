-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2020 at 12:55 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `company`
--
CREATE DATABASE IF NOT EXISTS `company` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `company`;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DNAME` varchar(20) NOT NULL,
  `DNUMBER` int(2) NOT NULL,
  `MGRSSN` varchar(15) NOT NULL,
  `MGRSTARTDATE` date DEFAULT NULL,
  PRIMARY KEY (`DNUMBER`),
  KEY `MGRSSN` (`MGRSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DNAME`, `DNUMBER`, `MGRSSN`, `MGRSTARTDATE`) VALUES
('HEADQUARTERS', 1, '888665555', '1981-06-19'),
('ADMINISTRATION', 4, '987654321', '1995-01-01'),
('RESEARCH', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `dependent`
--

CREATE TABLE IF NOT EXISTS `dependent` (
  `ESSN` varchar(20) NOT NULL,
  `DEPENDENT_NAME` varchar(20) NOT NULL,
  `SEX` varchar(2) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `RELATIONSHIP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`DEPENDENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependent`
--

INSERT INTO `dependent` (`ESSN`, `DEPENDENT_NAME`, `SEX`, `BDATE`, `RELATIONSHIP`) VALUES
('123456789', 'ALICE', 'F', '1988-12-30', 'DAUGHTER'),
('123456789', 'ELIZABETH', 'F', '1967-05-05', 'SPOUSE'),
('123456789', 'MICHAEL', 'M', '1988-01-04', 'SON'),
('333445555', 'ALICE', 'F', '1986-04-05', 'DAUGHTER'),
('333445555', 'JOY', 'F', '1958-05-03', 'SPOUSE'),
('333445555', 'THEODORE', 'M', '1983-10-25', 'SON'),
('987654321', 'ABNER', 'M', '1942-02-28', 'SPOUSE');

-- --------------------------------------------------------

--
-- Table structure for table `dept_locations`
--

CREATE TABLE IF NOT EXISTS `dept_locations` (
  `DNUMBER` int(2) NOT NULL,
  `DLOCATION` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`DNUMBER`,`DLOCATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_locations`
--

INSERT INTO `dept_locations` (`DNUMBER`, `DLOCATION`) VALUES
(1, 'HOUSTON'),
(4, 'STAFFORD'),
(5, 'BELLAIRE'),
(5, 'HOUSTON'),
(5, 'SSUGARLAND');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `FNAME` varchar(20) NOT NULL,
  `MINIT` varchar(3) DEFAULT NULL,
  `LNAME` varchar(20) NOT NULL,
  `SSN` varchar(15) NOT NULL,
  `BDATE` date DEFAULT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `SEX` varchar(1) NOT NULL,
  `SALARY` int(10) DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` int(2) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `SUPERSSN` (`SUPERSSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`FNAME`, `MINIT`, `LNAME`, `SSN`, `BDATE`, `ADDRESS`, `SEX`, `SALARY`, `SUPERSSN`, `DNO`) VALUES
('JOHN', 'B', 'SMITH', '123456789', '1965-01-09', '731 FONDREN HOUSTON TX', 'M', 30000, '333445555', 5),
('FRANKLIN', 'T', 'WONG', '333445555', '1955-12-08', '638 VOSS HOUSTON TX', 'M', 40000, '888665555', 5),
('JOYCE', 'A', 'ENGLISH', '453453453', '1972-07-31', '5631 RICE HOUSTON TX', 'F', 25000, '333445555', 5),
('RAMESH', 'K', 'NARAYAN', '666884444', '1962-09-15', '975 FIRE OAK HUMBLE TX', 'M', 38000, '333445555', 5),
('JAMES', 'E', 'BORG', '888665555', '1937-11-10', '450 STONE HOUSTON TX', 'M', 55000, NULL, 1),
('JENNIFER', 'S', 'WALLACE', '987654321', '1941-06-20', '291 BERRY BELLAIRE TX', 'F', 43000, '888665555', 4),
('AHMAD', 'V', 'JABBAR', '987987987', '1969-03-29', '980 DALLAS HOUSTON TX', 'M', 25000, '987654321', 4),
('ALICIA', 'J', 'ZELAYA', '999887777', '1968-07-19', '3321 CASTLE SPRING TX', 'F', 25000, '987654321', 4);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `PNAME` varchar(30) NOT NULL,
  `PNUMBER` int(5) NOT NULL,
  `PLOCATION` varchar(20) DEFAULT NULL,
  `DNUM` int(2) DEFAULT NULL,
  PRIMARY KEY (`PNUMBER`),
  KEY `DNUM` (`DNUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PNAME`, `PNUMBER`, `PLOCATION`, `DNUM`) VALUES
('PRODUCTX', 1, 'BELLAIRE', 5),
('PRODUCTY', 2, 'SUGARLAND', 5),
('PRODUCTZ', 3, 'HOUSTON', 5),
('COMPUTERIZATION', 10, 'STAFFORD', 4),
('REORGANIZATION', 20, 'HOUSTON', 1),
('NEWBWNWFITS', 30, 'STAFFORD', 4);

-- --------------------------------------------------------

--
-- Table structure for table `works_on`
--

CREATE TABLE IF NOT EXISTS `works_on` (
  `ESSN` varchar(20) NOT NULL,
  `PNO` int(5) NOT NULL,
  `HOURS` varchar(5) DEFAULT NULL,
  KEY `ESSN` (`ESSN`),
  KEY `PNO` (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `works_on`
--

INSERT INTO `works_on` (`ESSN`, `PNO`, `HOURS`) VALUES
('123456789', 1, '32.5'),
('123456789', 2, '7.5'),
('666884444', 3, '40.0'),
('453453453', 1, '20.0'),
('453453453', 2, '20.0'),
('333445555', 2, '10.0'),
('333445555', 3, '10.0'),
('333445555', 10, '10.0'),
('333445555', 20, '10.0'),
('999887777', 30, '30.0'),
('999887777', 10, '10.0'),
('987987987', 10, '35.0'),
('987987987', 30, '5.0'),
('987654321', 30, '20.0'),
('987654321', 20, '15.0'),
('888665555', 20, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MGRSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dependent`
--
ALTER TABLE `dependent`
  ADD CONSTRAINT `dependent_ibfk_2` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`),
  ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `dept_locations`
--
ALTER TABLE `dept_locations`
  ADD CONSTRAINT `dept_locations_ibfk_2` FOREIGN KEY (`DNUMBER`) REFERENCES `department` (`DNUMBER`),
  ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`DNUMBER`) REFERENCES `department` (`DNUMBER`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SUPERSSN`) REFERENCES `employee` (`SSN`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DNUM`) REFERENCES `department` (`DNUMBER`);

--
-- Constraints for table `works_on`
--
ALTER TABLE `works_on`
  ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`PNO`) REFERENCES `project` (`PNUMBER`),
  ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`ESSN`) REFERENCES `employee` (`SSN`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
