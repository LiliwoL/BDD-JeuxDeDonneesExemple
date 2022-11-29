-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 29 nov. 2022 à 20:44
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
-- Base de données : `VOYELLECHIFFRE`
--

-- --------------------------------------------------------

--
-- Structure de la table `Chiffre`
--

CREATE TABLE `Chiffre` (
  `id` int(11) NOT NULL,
  `text` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Chiffre`
--

INSERT INTO `Chiffre` (`id`, `text`) VALUES
(0, 'zero'),
(1, 'un'),
(2, 'deux'),
(3, 'trois'),
(4, 'quatre'),
(5, 'cinq'),
(6, 'six'),
(7, 'sept'),
(8, 'huit'),
(9, 'neuf');

-- --------------------------------------------------------

--
-- Structure de la table `Relation`
--

CREATE TABLE `Relation` (
  `id_chiffre` int(11) NOT NULL,
  `id_voyelle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Relation`
--

INSERT INTO `Relation` (`id_chiffre`, `id_voyelle`) VALUES
(0, 1),
(0, 3),
(1, 4),
(2, 1),
(2, 4),
(3, 2),
(3, 3),
(4, 0),
(4, 1),
(4, 4),
(5, 2),
(6, 2),
(7, 1),
(8, 2),
(8, 4),
(9, 1),
(9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Voyelle`
--

CREATE TABLE `Voyelle` (
  `id` int(11) NOT NULL,
  `lettre` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Voyelle`
--

INSERT INTO `Voyelle` (`id`, `lettre`) VALUES
(0, 'a'),
(1, 'e'),
(2, 'i'),
(3, 'o'),
(4, 'u'),
(5, 'y');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Chiffre`
--
ALTER TABLE `Chiffre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Relation`
--
ALTER TABLE `Relation`
  ADD PRIMARY KEY (`id_chiffre`,`id_voyelle`),
  ADD KEY `id_voyelle` (`id_voyelle`);

--
-- Index pour la table `Voyelle`
--
ALTER TABLE `Voyelle`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Relation`
--
ALTER TABLE `Relation`
  ADD CONSTRAINT `Relation_ibfk_1` FOREIGN KEY (`id_chiffre`) REFERENCES `Chiffre` (`id`),
  ADD CONSTRAINT `Relation_ibfk_2` FOREIGN KEY (`id_voyelle`) REFERENCES `Voyelle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
