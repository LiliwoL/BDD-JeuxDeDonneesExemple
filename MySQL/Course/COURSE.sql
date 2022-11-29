-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 29 nov. 2022 à 21:43
-- Version du serveur :  10.5.15-MariaDB-0+deb11u1-log
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `COURSE`
--

-- --------------------------------------------------------

--
-- Structure de la table `ATHLETE`
--

CREATE TABLE `ATHLETE` (
  `numAthlete` int(11) NOT NULL,
  `numEquipe` int(11) NOT NULL,
  `nomAthlete` varchar(120) DEFAULT NULL,
  `ageAthlete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `COURSE`
--

CREATE TABLE `COURSE` (
  `numCourse` int(11) NOT NULL,
  `numLieu` int(11) NOT NULL,
  `nomCourse` varchar(120) DEFAULT NULL,
  `dateCourse` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `EQUIPE`
--

CREATE TABLE `EQUIPE` (
  `numEquipe` int(11) NOT NULL,
  `nomEquipe` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `LIEU`
--

CREATE TABLE `LIEU` (
  `numLieu` int(11) NOT NULL,
  `nomLieu` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PARTICIPE`
--

CREATE TABLE `PARTICIPE` (
  `numCourse` int(11) NOT NULL,
  `numAthlete` int(11) NOT NULL,
  `rang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ATHLETE`
--
ALTER TABLE `ATHLETE`
  ADD PRIMARY KEY (`numAthlete`),
  ADD KEY `FK_ATHLETE_EQUIPE` (`numEquipe`);

--
-- Index pour la table `COURSE`
--
ALTER TABLE `COURSE`
  ADD PRIMARY KEY (`numCourse`),
  ADD KEY `FK_COURSE_LIEU` (`numLieu`);

--
-- Index pour la table `EQUIPE`
--
ALTER TABLE `EQUIPE`
  ADD PRIMARY KEY (`numEquipe`);

--
-- Index pour la table `LIEU`
--
ALTER TABLE `LIEU`
  ADD PRIMARY KEY (`numLieu`);

--
-- Index pour la table `PARTICIPE`
--
ALTER TABLE `PARTICIPE`
  ADD PRIMARY KEY (`numCourse`,`numAthlete`),
  ADD KEY `FK_PARTICIPE_ATHLETE` (`numAthlete`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ATHLETE`
--
ALTER TABLE `ATHLETE`
  ADD CONSTRAINT `FK_ATHLETE_EQUIPE` FOREIGN KEY (`numEquipe`) REFERENCES `EQUIPE` (`numEquipe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `COURSE`
--
ALTER TABLE `COURSE`
  ADD CONSTRAINT `FK_COURSE_LIEU` FOREIGN KEY (`numLieu`) REFERENCES `LIEU` (`numLieu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `PARTICIPE`
--
ALTER TABLE `PARTICIPE`
  ADD CONSTRAINT `FK_PARTICIPE_ATHLETE` FOREIGN KEY (`numAthlete`) REFERENCES `ATHLETE` (`numAthlete`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PARTICIPE_COURSE` FOREIGN KEY (`numCourse`) REFERENCES `EQUIPE` (`numEquipe`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
