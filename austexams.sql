-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2018 at 02:01 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `austexams`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `ansId` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `marks` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ansId`, `questionId`, `studentId`, `answer`, `marks`) VALUES
(17, 1, 7, 'hha', 2),
(18, 2, 7, 'pointing to nothing', 5),
(19, 3, 7, 'dont know', 2),
(20, 4, 7, 'dsvbfhksbfkjbsdkjb', 4),
(21, 5, 7, 'skjbkjsdbkjsbdjuk', 3),
(22, 1, 3, 'bababa', 2),
(23, 2, 3, 'aklfnlskanlkanflna', 2),
(24, 3, 3, 'dont know', 2),
(25, 4, 3, 'setkojad', 2),
(26, 5, 3, 'knklnklnalnbsdalb', 3),
(27, 8, 3, 'dont know', 3),
(28, 9, 3, 'dont really know', 5);

-- --------------------------------------------------------

--
-- Table structure for table `examgivenlist`
--

CREATE TABLE `examgivenlist` (
  `studentId` int(11) NOT NULL,
  `examId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examgivenlist`
--

INSERT INTO `examgivenlist` (`studentId`, `examId`) VALUES
(7, 4),
(7, 5),
(3, 4),
(3, 5),
(3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `examId` int(11) NOT NULL,
  `examName` varchar(255) NOT NULL,
  `examTime` varchar(255) NOT NULL,
  `totalQuestion` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`examId`, `examName`, `examTime`, `totalQuestion`, `teacherId`) VALUES
(4, 'C Basics', '00:01', 2, 4),
(5, 'Java Basic', '00:15', 3, 4),
(6, 'Java Advanced', '00:10', 2, 4),
(7, 'Life', '00:10', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `questionId` int(11) NOT NULL,
  `examId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `marks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionId`, `examId`, `teacherId`, `question`, `marks`) VALUES
(1, 4, 4, 'What is the difference between declaration and definition of a variable/function?', 5),
(2, 4, 4, 'What is NULL pointer?', 5),
(3, 5, 4, 'When is the super keyword used?\r\n', 2),
(4, 5, 4, 'Difference in Set and List interface?\r\n', 5),
(5, 5, 4, 'Explain Final keyword in java?', 5),
(6, 6, 4, 'What is the difference between â??throwâ?? and â??throwsâ?? in Java Exception Handling?\r\n', 5),
(7, 6, 4, 'Can a top level class be private or protected?', 5),
(8, 7, 8, 'what is the meaning of life?', 10),
(9, 7, 8, 'why do we die?', 10);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `pass`, `type`) VALUES
(1, 'azad', '1234', 'teacher'),
(3, 'nafis', '1234', 'student'),
(4, 'sujan', '1234', 'teacher'),
(5, 'swapnil', '1234', 'student'),
(6, 'lisa', '1234', 'teacher'),
(7, 'shibali', '1234', 'student'),
(8, 'sir', '1234', 'teacher'),
(11, 'teacher', '1234', 'teacher'),
(12, 'sajidm', '1234', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ansId`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`examId`),
  ADD KEY `fk_teacherId` (`teacherId`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`questionId`),
  ADD KEY `fk_examId` (`examId`),
  ADD KEY `teacherId` (`teacherId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `ansId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `examId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `questionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `fk_teacherId` FOREIGN KEY (`teacherId`) REFERENCES `user` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_examId` FOREIGN KEY (`examId`) REFERENCES `exams` (`examId`),
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
