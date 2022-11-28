-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : lun. 28 nov. 2022 à 17:11
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `Livres`
--
CREATE DATABASE IF NOT EXISTS `Livres` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `Livres`;

-- --------------------------------------------------------

--
-- Structure de la table `Auteurs`
--

CREATE TABLE `Auteurs` (
  `IdAuteur` int NOT NULL,
  `NomAuteur` text,
  `PrenomAuteur` text,
  `IdLangue` int DEFAULT NULL,
  `AnneeNaissance` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Auteurs`
--

INSERT INTO `Auteurs` (`IdAuteur`, `NomAuteur`, `PrenomAuteur`, `IdLangue`, `AnneeNaissance`) VALUES
(1, 'Orwell', 'George', 1, 1903),
(2, 'Asimov', 'Isaac', 1, 1920),
(3, 'Huxley', 'Aldous', 1, 1894),
(4, 'Bradbury', 'Ray', 1, 1920),
(5, 'Boulle', 'Pierre', 2, 1912),
(6, 'Herbert', 'Frank', 1, 1920),
(7, 'K. Dick', 'Philip', 1, 1928),
(8, 'Barjavel', 'René', 2, 1911),
(9, 'Van Vogt', 'Alfred Elton', 1, 1912),
(10, 'Vernes', 'Jules', 2, 1828);

-- --------------------------------------------------------

--
-- Structure de la table `Langues`
--

CREATE TABLE `Langues` (
  `IdLangue` int NOT NULL,
  `Langue` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Langues`
--

INSERT INTO `Langues` (`IdLangue`, `Langue`) VALUES
(1, 'Anglais'),
(2, 'Français'),
(3, 'Klingon');

-- --------------------------------------------------------

--
-- Structure de la table `Livres`
--

CREATE TABLE `Livres` (
  `IdLivre` int NOT NULL,
  `Titre` text,
  `IdAuteur` int DEFAULT NULL,
  `AnneePubli` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Livres`
--

INSERT INTO `Livres` (`IdLivre`, `Titre`, `IdAuteur`, `AnneePubli`) VALUES
(1, '1984', 1, 1949),
(2, 'Le meilleur des mondes', 3, 1931),
(3, 'Chroniques martiennes', 4, 1950),
(4, 'La planète des singes', 5, 1963),
(5, 'Dune', 6, 1920),
(6, 'Fondation', 2, 1920),
(7, 'Fahrenheit 451', 4, 1920),
(8, 'Ubik', 7, 1928),
(9, 'La nuit des temps', 8, 1911),
(10, 'Blade Runner', 7, 1928),
(11, 'Les Robots', 2, 1920),
(12, 'Ravage', 8, 1911),
(13, 'Le Maître du Haut Château', 7, 1928),
(14, 'Le Monde des A', 9, 1912),
(15, 'La fin de l\'éternité', 2, 1920),
(16, 'De la Terre à la Lune', 10, 1828);

-- --------------------------------------------------------

--
-- Structure de la table `RelationsLivreTheme`
--

CREATE TABLE `RelationsLivreTheme` (
  `IdTheme` int NOT NULL,
  `IdLivre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Themes`
--

CREATE TABLE `Themes` (
  `idTheme` int NOT NULL,
  `Intitule` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Themes`
--

INSERT INTO `Themes` (`idTheme`, `Intitule`) VALUES
(1, 'Science-fiction'),
(2, 'Totalitarisme'),
(3, 'Anticipation'),
(4, 'Dystopie'),
(5, 'Economie'),
(6, 'Tragédie'),
(7, 'Intelligence artificielle'),
(8, 'Uchronie'),
(9, 'Voyage dans le temps'),
(10, 'Aventure');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Auteurs`
--
ALTER TABLE `Auteurs`
  ADD PRIMARY KEY (`IdAuteur`),
  ADD KEY `IdLangue` (`IdLangue`);

--
-- Index pour la table `Langues`
--
ALTER TABLE `Langues`
  ADD PRIMARY KEY (`IdLangue`);

--
-- Index pour la table `Livres`
--
ALTER TABLE `Livres`
  ADD PRIMARY KEY (`IdLivre`),
  ADD KEY `IdAuteur` (`IdAuteur`);

--
-- Index pour la table `RelationsLivreTheme`
--
ALTER TABLE `RelationsLivreTheme`
  ADD KEY `IdTheme` (`IdTheme`),
  ADD KEY `IdLivre` (`IdLivre`);

--
-- Index pour la table `Themes`
--
ALTER TABLE `Themes`
  ADD PRIMARY KEY (`idTheme`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Auteurs`
--
ALTER TABLE `Auteurs`
  MODIFY `IdAuteur` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Langues`
--
ALTER TABLE `Langues`
  MODIFY `IdLangue` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Livres`
--
ALTER TABLE `Livres`
  MODIFY `IdLivre` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `Themes`
--
ALTER TABLE `Themes`
  MODIFY `idTheme` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Auteurs`
--
ALTER TABLE `Auteurs`
  ADD CONSTRAINT `auteurs_ibfk_1` FOREIGN KEY (`IdLangue`) REFERENCES `Langues` (`IdLangue`);

--
-- Contraintes pour la table `Livres`
--
ALTER TABLE `Livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`IdAuteur`) REFERENCES `Auteurs` (`IdAuteur`);

--
-- Contraintes pour la table `RelationsLivreTheme`
--
ALTER TABLE `RelationsLivreTheme`
  ADD CONSTRAINT `relationslivretheme_ibfk_1` FOREIGN KEY (`IdTheme`) REFERENCES `Themes` (`idTheme`),
  ADD CONSTRAINT `relationslivretheme_ibfk_2` FOREIGN KEY (`IdLivre`) REFERENCES `Livres` (`IdLivre`);
COMMIT;
