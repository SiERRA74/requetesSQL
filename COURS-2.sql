-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 15 nov. 2022 à 16:41
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jbhghfd`
--

-- --------------------------------------------------------

--
-- Structure de la table `COURS`
--

CREATE TABLE `COURS` (
  `IDcours` int(11) NOT NULL,
  `IDclass` int(11) NOT NULL,
  `IDmatiere` int(11) NOT NULL,
  `IDprof` int(11) NOT NULL,
  `IDecole` int(11) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `COURS`
--

INSERT INTO `COURS` (`IDcours`, `IDclass`, `IDmatiere`, `IDprof`, `IDecole`, `date`) VALUES
(1, 5, 3, 2, 2, '2022-11-16'),
(2, 3, 3, 2, 1, '2022-11-17'),
(3, 4, 1, 1, 1, '2022-11-16');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `COURS`
--
ALTER TABLE `COURS`
  ADD PRIMARY KEY (`IDcours`),
  ADD KEY `IDclass` (`IDclass`),
  ADD KEY `IDecole` (`IDecole`),
  ADD KEY `IDmatiere` (`IDmatiere`),
  ADD KEY `IDprof` (`IDprof`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `COURS`
--
ALTER TABLE `COURS`
  MODIFY `IDcours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `COURS`
--
ALTER TABLE `COURS`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`IDclass`) REFERENCES `CLASSE` (`ID`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`IDecole`) REFERENCES `ECOLE` (`ID`),
  ADD CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`IDmatiere`) REFERENCES `MATIERES` (`ID`),
  ADD CONSTRAINT `cours_ibfk_4` FOREIGN KEY (`IDprof`) REFERENCES `PROFS` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
