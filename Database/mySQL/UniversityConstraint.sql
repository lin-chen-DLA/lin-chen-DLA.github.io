-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2018 at 07:30 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `University`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE IF NOT EXISTS `Department` (
  `Dname` varchar(15) COLLATE utf8_bin NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) COLLATE utf8_bin NOT NULL,
  `Mgr_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Department table';

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Dname`, `Dnumber`, `Mgr_ssn`, `Mgr_start_date`) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `Dependent`
--

CREATE TABLE IF NOT EXISTS `Dependent` (
  `Essn` char(9) COLLATE utf8_bin NOT NULL,
  `Name` varchar(15) COLLATE utf8_bin NOT NULL,
  `Sex` char(1) COLLATE utf8_bin DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Works_on table';

--
-- Dumping data for table `Dependent`
--

INSERT INTO `Dependent` (`Essn`, `Name`, `Sex`, `Bdate`, `Relationship`) VALUES
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table `Dept_locations`
--

CREATE TABLE IF NOT EXISTS `Dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Department locations';

--
-- Dumping data for table `Dept_locations`
--

INSERT INTO `Dept_locations` (`Dnumber`, `Dlocation`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `Fname` varchar(15) COLLATE utf8_bin NOT NULL,
  `Minit` char(1) COLLATE utf8_bin DEFAULT NULL,
  `Lname` varchar(15) COLLATE utf8_bin NOT NULL,
  `Ssn` char(9) COLLATE utf8_bin NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `Sex` char(1) COLLATE utf8_bin DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) COLLATE utf8_bin DEFAULT NULL,
  `Dno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Employee table';

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`Fname`, `Minit`, `Lname`, `Ssn`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5),
('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5),
('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5),
('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, NULL, 1),
('Jennifer', 'S', 'Wallace', '987654321', '0000-00-00', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4),
('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE IF NOT EXISTS `Project` (
  `Pname` varchar(15) COLLATE utf8_bin NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `Dnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Project table';

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`Pname`, `Pnumber`, `Plocation`, `Dnum`) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Sugarland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Works_on`
--

CREATE TABLE IF NOT EXISTS `Works_on` (
  `Essn` char(9) COLLATE utf8_bin NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Works_on table';

--
-- Dumping data for table `Works_on`
--

INSERT INTO `Works_on` (`Essn`, `Pno`, `Hours`) VALUES
('123456789', 1, 32.5),
('123456789', 2, 7.5),
('333445555', 2, 10.0),
('333445555', 3, 10.0),
('333445555', 10, 10.0),
('333445555', 20, 10.0),
('453453453', 1, 20.0),
('453453453', 2, 20.0),
('666884444', 3, 40.0),
('888665555', 20, 0.0),
('987654321', 20, 15.0),
('987654321', 30, 20.0),
('987987987', 10, 35.0),
('987987987', 30, 5.0),
('999887777', 10, 10.0),
('999887777', 30, 30.0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`Dnumber`),
  ADD UNIQUE KEY `Dname` (`Dname`),
  ADD KEY `Mgr_ssn` (`Mgr_ssn`);

--
-- Indexes for table `Dependent`
--
ALTER TABLE `Dependent`
  ADD PRIMARY KEY (`Essn`,`Name`);

--
-- Indexes for table `Dept_locations`
--
ALTER TABLE `Dept_locations`
  ADD PRIMARY KEY (`Dnumber`,`Dlocation`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`Ssn`),
  ADD KEY `employee_ibfk_2` (`Dno`),
  ADD KEY `employee_ibfk_1` (`Super_ssn`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`Pnumber`),
  ADD UNIQUE KEY `Pname` (`Pname`),
  ADD KEY `ProjDept` (`Dnum`);

--
-- Indexes for table `Works_on`
--
ALTER TABLE `Works_on`
  ADD PRIMARY KEY (`Essn`,`Pno`),
  ADD KEY `WorkProj` (`Pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `department_MgrEmp` FOREIGN KEY (`Mgr_ssn`) REFERENCES `Employee` (`Ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `Dependent`
--
ALTER TABLE `Dependent`
  ADD CONSTRAINT `EmpDep` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`Ssn`) ON UPDATE CASCADE;

--
-- Constraints for table `Dept_locations`
--
ALTER TABLE `Dept_locations`
  ADD CONSTRAINT `DepLoc` FOREIGN KEY (`Dnumber`) REFERENCES `Department` (`Dnumber`) ON UPDATE CASCADE;

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Super_ssn`) REFERENCES `Employee` (`Ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dnumber`) ON UPDATE CASCADE;

--
-- Constraints for table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `ProjDept` FOREIGN KEY (`Dnum`) REFERENCES `Department` (`Dnumber`) ON UPDATE CASCADE;

--
-- Constraints for table `Works_on`
--
ALTER TABLE `Works_on`
  ADD CONSTRAINT `EmpWorks` FOREIGN KEY (`Essn`) REFERENCES `Employee` (`Ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `WorkProj` FOREIGN KEY (`Pno`) REFERENCES `Project` (`Pnumber`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
