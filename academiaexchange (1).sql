-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2025 at 01:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academiaexchange`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `BuyerID` varchar(30) NOT NULL,
  `UserID` varchar(30) NOT NULL,
  `Department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`BuyerID`, `UserID`, `Department`) VALUES
('B001', 'BUY001', 'CSE'),
('B002', 'BUY002', 'CSE'),
('B003', 'BUY003', 'BBA'),
('B004', 'BUY004', 'BBA'),
('B005', 'BUY005', 'CSE'),
('B006', 'BUY006', 'BBA'),
('B007', 'BUY007', 'CSE'),
('B008', 'BUY008', 'BBA'),
('B009', 'BUY009', 'CSE'),
('B010', 'BUY010', 'BBA'),
('B011', 'BUY011', 'CSE'),
('B012', 'BUY012', 'BBA'),
('B013', 'BUY013', 'CSE'),
('B014', 'BUY014', 'BBA'),
('B015', 'BUY015', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `classnotes`
--

CREATE TABLE `classnotes` (
  `NotesID` varchar(50) NOT NULL,
  `UniqueIdentifier` varchar(100) NOT NULL,
  `Availability` tinyint(1) DEFAULT 1,
  `MaterialID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classnotes`
--

INSERT INTO `classnotes` (`NotesID`, `UniqueIdentifier`, `Availability`, `MaterialID`) VALUES
('201', 'CN-DS-2023-CSE225', 1, '6'),
('202', 'CN-MICROECON-2023-BBA201', 1, '7'),
('203', 'CN-OOP-2023-CSE215', 1, '8'),
('204', 'CN-ALGODESIGN-2023-CSE316', 1, '16'),
('205', 'CN-ML-2023-CSE427', 1, '17'),
('206', 'CN-DBSYSTEMS-2023-CSE325', 1, '18'),
('207', 'CN-FINMGMT-2023-BBA301', 1, '25'),
('208', 'CN-MARKSTRAT-2023-BBA310', 1, '26'),
('209', 'CN-HRM-2023-BBA405', 1, '27');

-- --------------------------------------------------------

--
-- Table structure for table `hardware`
--

CREATE TABLE `hardware` (
  `HardwareID` varchar(50) NOT NULL,
  `UniqueIdentifier` varchar(100) NOT NULL,
  `Availability` tinyint(1) DEFAULT 1,
  `MaterialID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hardware`
--

INSERT INTO `hardware` (`HardwareID`, `UniqueIdentifier`, `Availability`, `MaterialID`) VALUES
('301', 'HW-ARDUINO-STARTER-KIT-001', 1, '9'),
('302', 'HW-CISCO-ROUTER-1841', 1, '10'),
('303', 'HW-FIN-CALCULATOR-100', 1, '11'),
('304', 'HW-RASPBERRY-PI-400-01', 1, '19'),
('305', 'HW-LOGIC-ANALYZER-1010', 1, '20'),
('306', 'HW-BUS-SIM-SOFTWARE-01', 1, '28'),
('307', 'HW-PRES-CLICKER-1', 1, '29');

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `MaterialID` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Availability` tinyint(1) DEFAULT 1,
  `SellerID` varchar(30) NOT NULL
) ;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`MaterialID`, `Type`, `Description`, `Price`, `Availability`, `SellerID`) VALUES
('1', 'Textbook', 'Introduction to Algorithms', 1200.00, 1, 'S101'),
('10', 'Hardware', 'Networking Lab Router', 5000.00, 1, 'S111'),
('11', 'Hardware', 'Financial Calculator', 1500.00, 1, 'S110'),
('12', 'Textbook', 'Operating System Concepts', 1250.00, 1, 'S113'),
('13', 'Textbook', 'Artificial Intelligence: A Modern Approach', 1350.00, 1, 'S101'),
('14', 'Textbook', 'Computer Networks', 1100.00, 1, 'S103'),
('15', 'Textbook', 'Discrete Mathematics', 950.00, 1, 'S105'),
('16', 'ClassNotes', 'Algorithm Design Notes', 400.00, 1, 'S107'),
('17', 'ClassNotes', 'Machine Learning Slides', 450.00, 1, 'S109'),
('18', 'ClassNotes', 'Database Systems Lab Manual', 350.00, 1, 'S111'),
('19', 'Hardware', 'Raspberry Pi Kit', 3200.00, 1, 'S113'),
('2', 'Textbook', 'Database System Concepts', 950.00, 1, 'S103'),
('20', 'Hardware', 'Logic Analyzer', 4200.00, 1, 'S101'),
('21', 'Textbook', 'Business Communication', 800.00, 1, 'S102'),
('22', 'Textbook', 'Organizational Behavior', 850.00, 1, 'S104'),
('23', 'Textbook', 'Managerial Economics', 900.00, 1, 'S106'),
('24', 'Textbook', 'Business Statistics', 950.00, 1, 'S108'),
('25', 'ClassNotes', 'Financial Management Case Studies', 300.00, 1, 'S110'),
('26', 'ClassNotes', 'Marketing Strategies Summary', 350.00, 1, 'S112'),
('27', 'ClassNotes', 'Human Resource Management Slides', 400.00, 1, 'S114'),
('28', 'Hardware', 'Business Simulation Software License', 2500.00, 1, 'S102'),
('29', 'Hardware', 'Presentation Clicker', 1200.00, 1, 'S104'),
('3', 'Textbook', 'Principles of Marketing', 850.00, 1, 'S102'),
('4', 'Textbook', 'Financial Accounting', 900.00, 1, 'S104'),
('5', 'Textbook', 'Computer Organization and Design', 1100.00, 1, 'S101'),
('6', 'ClassNotes', 'Data Structures Lecture Notes', 300.00, 1, 'S105'),
('7', 'ClassNotes', 'Microeconomics Summary', 250.00, 1, 'S106'),
('8', 'ClassNotes', 'Object-Oriented Programming Slides', 350.00, 1, 'S107'),
('9', 'Hardware', 'Arduino Starter Kit', 2500.00, 1, 'S109');

-- --------------------------------------------------------

--
-- Table structure for table `platformuser`
--

CREATE TABLE `platformuser` (
  `UserID` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` varchar(10) NOT NULL
) ;

--
-- Dumping data for table `platformuser`
--

INSERT INTO `platformuser` (`UserID`, `Name`, `Email`, `Password`, `Role`) VALUES
('BUY001', 'Ahmed Rahman', 'ahmed.r@example.com', 'secure001', 'Student'),
('BUY002', 'Fatima Khan', 'fatima.k@example.com', 'secure002', 'Student'),
('BUY003', 'Rahim Islam', 'rahim.i@example.com', 'secure003', 'Student'),
('BUY004', 'Ayesha Akter', 'ayesha.a@example.com', 'secure004', 'Student'),
('BUY005', 'Imran Hossain', 'imran.h@example.com', 'secure005', 'Student'),
('BUY006', 'Tasnim Ahmed', 'tasnim.a@example.com', 'secure006', 'Student'),
('BUY007', 'Kamal Uddin', 'kamal.u@example.com', 'secure007', 'Student'),
('BUY008', 'Nusrat Jahan', 'nusrat.j@example.com', 'secure008', 'Student'),
('BUY009', 'Arif Chowdhury', 'arif.c@example.com', 'secure009', 'Student'),
('BUY010', 'Sadia Rahman', 'sadia.r@example.com', 'secure010', 'Student'),
('BUY011', 'Faisal Mahmud', 'faisal.m@example.com', 'secure011', 'Student'),
('BUY012', 'Lubna Khan', 'lubna.k@example.com', 'secure012', 'Student'),
('BUY013', 'Rifat Ahmed', 'rifat.a@example.com', 'secure013', 'Student'),
('BUY014', 'Sabrina Islam', 'sabrina.i@example.com', 'secure014', 'Student'),
('BUY015', 'Tahsin Rahman', 'tahsin.r@example.com', 'secure015', 'Student'),
('SEL001', 'Karim Abdullah', 'karim.a@example.com', 'sell001', 'Student'),
('SEL002', 'Nasrin Akter', 'nasrin.a@example.com', 'sell002', 'Student'),
('SEL003', 'Jamal Khan', 'jamal.k@example.com', 'sell003', 'Student'),
('SEL004', 'Farhana Begum', 'farhana.b@example.com', 'sell004', 'Student'),
('SEL005', 'Rafiq Islam', 'rafiq.i@example.com', 'sell005', 'Student'),
('SEL006', 'Mehnaz Chowdhury', 'mehnaz.c@example.com', 'sell006', 'Student'),
('SEL007', 'Asif Iqbal', 'asif.i@example.com', 'sell007', 'Student'),
('SEL008', 'Tania Haque', 'tania.h@example.com', 'sell008', 'Student'),
('SEL009', 'Fahim Rahman', 'fahim.r@example.com', 'sell009', 'Student'),
('SEL010', 'Sonia Akter', 'sonia.a@example.com', 'sell010', 'Student'),
('SEL011', 'Kamrul Hasan', 'kamrul.h@example.com', 'sell011', 'Student'),
('SEL012', 'Nazia Khan', 'nazia.k@example.com', 'sell012', 'Student'),
('SEL013', 'Rakib Ahmed', 'rakib.a@example.com', 'sell013', 'Student'),
('SEL014', 'Sharmin Islam', 'sharmin.i@example.com', 'sell014', 'Student'),
('SEL015', 'Bashar Uddin', 'bashar.u@example.com', 'sell015', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `SellerID` varchar(30) NOT NULL,
  `UserID` varchar(30) NOT NULL,
  `Department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`SellerID`, `UserID`, `Department`) VALUES
('S101', 'SEL001', 'CSE'),
('S102', 'SEL002', 'BBA'),
('S103', 'SEL003', 'CSE'),
('S104', 'SEL004', 'BBA'),
('S105', 'SEL005', 'CSE'),
('S106', 'SEL006', 'BBA'),
('S107', 'SEL007', 'CSE'),
('S108', 'SEL008', 'BBA'),
('S109', 'SEL009', 'CSE'),
('S110', 'SEL010', 'BBA'),
('S111', 'SEL011', 'CSE'),
('S112', 'SEL012', 'BBA'),
('S113', 'SEL013', 'CSE'),
('S114', 'SEL014', 'BBA'),
('S115', 'SEL015', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `textbooks`
--

CREATE TABLE `textbooks` (
  `BookID` varchar(50) NOT NULL,
  `UniqueIdentifier` varchar(100) NOT NULL,
  `Availability` tinyint(1) DEFAULT 1,
  `MaterialID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `textbooks`
--

INSERT INTO `textbooks` (`BookID`, `UniqueIdentifier`, `Availability`, `MaterialID`) VALUES
('101', 'TBK-ALGO-9780262033848', 1, '1'),
('102', 'TBK-DB-9780078022159', 1, '2'),
('103', 'TBK-MARKETING-9780133795028', 1, '3'),
('104', 'TBK-FINACC-9780136123345', 1, '4'),
('105', 'TBK-COMPORG-9780128122754', 1, '5'),
('106', 'TBK-OS-9781118063330', 1, '12'),
('107', 'TBK-AI-9780134610993', 1, '13'),
('108', 'TBK-NETWORKS-9780132126953', 1, '14'),
('109', 'TBK-DISCMATH-9780131374570', 1, '15'),
('110', 'TBK-BUSCOMM-9780073403252', 1, '21'),
('111', 'TBK-ORGBEH-9780134729329', 1, '22'),
('112', 'TBK-MANECO-9789332555267', 1, '23'),
('113', 'TBK-BUSSTAT-9780273767063', 1, '24');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` varchar(50) NOT NULL,
  `BuyerID` varchar(30) NOT NULL,
  `SellerID` varchar(30) NOT NULL,
  `MaterialID` varchar(50) NOT NULL,
  `TransactionDate` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Status` varchar(20) DEFAULT 'Pending'
) ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionID`, `BuyerID`, `SellerID`, `MaterialID`, `TransactionDate`, `Amount`, `Status`) VALUES
('TXN-BBA-001', 'B003', 'S102', '3', '2023-09-15', 850.00, 'Completed'),
('TXN-BBA-002', 'B004', 'S104', '4', '2023-09-16', 900.00, 'Completed'),
('TXN-BBA-003', 'B006', 'S106', '7', '2023-09-17', 250.00, 'Completed'),
('TXN-BBA-004', 'B008', 'S108', '21', '2023-09-18', 800.00, 'Completed'),
('TXN-BBA-005', 'B010', 'S110', '22', '2023-09-19', 850.00, 'Completed'),
('TXN-BBA-006', 'B012', 'S112', '23', '2023-09-20', 900.00, 'Completed'),
('TXN-BBA-007', 'B014', 'S114', '24', '2023-09-21', 950.00, 'Completed'),
('TXN-BBA-008', 'B003', 'S102', '25', '2023-09-22', 300.00, 'Completed'),
('TXN-BBA-009', 'B004', 'S104', '26', '2023-09-23', 350.00, 'Completed'),
('TXN-BBA-010', 'B006', 'S106', '27', '2023-09-24', 400.00, 'Completed'),
('TXN-BBA-011', 'B008', 'S108', '11', '2023-09-25', 1500.00, 'Completed'),
('TXN-BBA-012', 'B010', 'S110', '28', '2023-09-26', 2500.00, 'Completed'),
('TXN-BBA-013', 'B012', 'S112', '29', '2023-09-27', 1200.00, 'Completed'),
('TXN-BBA-014', 'B014', 'S114', '10', '2023-10-04', 0.00, 'Pending'),
('TXN-BBA-015', 'B015', 'S102', '3', '2023-10-05', 0.00, 'Pending'),
('TXN-CSE-001', 'B001', 'S101', '1', '2023-09-15', 1200.00, 'Completed'),
('TXN-CSE-002', 'B002', 'S103', '2', '2023-09-16', 950.00, 'Completed'),
('TXN-CSE-003', 'B005', 'S101', '5', '2023-09-17', 1100.00, 'Completed'),
('TXN-CSE-004', 'B007', 'S113', '12', '2023-09-18', 1250.00, 'Completed'),
('TXN-CSE-005', 'B009', 'S101', '13', '2023-09-19', 1350.00, 'Completed'),
('TXN-CSE-006', 'B011', 'S103', '14', '2023-09-20', 1100.00, 'Completed'),
('TXN-CSE-007', 'B013', 'S105', '15', '2023-09-21', 950.00, 'Completed'),
('TXN-CSE-008', 'B015', 'S107', '16', '2023-09-22', 400.00, 'Completed'),
('TXN-CSE-009', 'B001', 'S109', '17', '2023-09-23', 450.00, 'Completed'),
('TXN-CSE-010', 'B002', 'S111', '18', '2023-09-24', 350.00, 'Completed'),
('TXN-CSE-011', 'B005', 'S113', '19', '2023-09-25', 3200.00, 'Completed'),
('TXN-CSE-012', 'B007', 'S101', '20', '2023-09-26', 4200.00, 'Completed'),
('TXN-CSE-013', 'B009', 'S105', '6', '2023-10-01', 0.00, 'Pending'),
('TXN-CSE-014', 'B011', 'S107', '8', '2023-10-02', 0.00, 'Pending'),
('TXN-CSE-015', 'B013', 'S109', '9', '2023-10-03', 0.00, 'Pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`BuyerID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `classnotes`
--
ALTER TABLE `classnotes`
  ADD PRIMARY KEY (`NotesID`),
  ADD UNIQUE KEY `UniqueIdentifier` (`UniqueIdentifier`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indexes for table `hardware`
--
ALTER TABLE `hardware`
  ADD PRIMARY KEY (`HardwareID`),
  ADD UNIQUE KEY `UniqueIdentifier` (`UniqueIdentifier`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`MaterialID`),
  ADD KEY `SellerID` (`SellerID`);

--
-- Indexes for table `platformuser`
--
ALTER TABLE `platformuser`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`SellerID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `textbooks`
--
ALTER TABLE `textbooks`
  ADD PRIMARY KEY (`BookID`),
  ADD UNIQUE KEY `UniqueIdentifier` (`UniqueIdentifier`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `BuyerID` (`BuyerID`),
  ADD KEY `SellerID` (`SellerID`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `platformuser` (`UserID`);

--
-- Constraints for table `classnotes`
--
ALTER TABLE `classnotes`
  ADD CONSTRAINT `classnotes_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`);

--
-- Constraints for table `hardware`
--
ALTER TABLE `hardware`
  ADD CONSTRAINT `hardware_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`);

--
-- Constraints for table `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `material_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `platformuser` (`UserID`);

--
-- Constraints for table `textbooks`
--
ALTER TABLE `textbooks`
  ADD CONSTRAINT `textbooks_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`BuyerID`) REFERENCES `buyer` (`BuyerID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`SellerID`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
