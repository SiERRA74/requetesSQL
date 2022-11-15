-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mar. 15 nov. 2022 à 16:47
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
-- Structure de la table `CLASSE`
--

CREATE TABLE `CLASSE` (
  `ID` int(11) NOT NULL,
  `IDecole` int(11) NOT NULL,
  `nbEleves` int(11) NOT NULL,
  `nomClasse` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `CLASSE`
--

INSERT INTO `CLASSE` (`ID`, `IDecole`, `nbEleves`, `nomClasse`) VALUES
(3, 1, 25, 'TG1'),
(4, 1, 27, 'TG2'),
(5, 2, 17, '1ERE2');

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

-- --------------------------------------------------------

--
-- Structure de la table `ECOLE`
--

CREATE TABLE `ECOLE` (
  `ID` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ECOLE`
--

INSERT INTO `ECOLE` (`ID`, `nom`) VALUES
(1, 'Louis Jouvet'),
(2, 'Lycee Marie Curie');

-- --------------------------------------------------------

--
-- Structure de la table `MAT-PROF`
--

CREATE TABLE `MAT-PROF` (
  `IDprof` int(11) NOT NULL,
  `IDmat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `MAT-PROF`
--

INSERT INTO `MAT-PROF` (`IDprof`, `IDmat`) VALUES
(1, 3),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `MATIERES`
--

CREATE TABLE `MATIERES` (
  `ID` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `MATIERES`
--

INSERT INTO `MATIERES` (`ID`, `libelle`) VALUES
(1, 'maths'),
(2, 'français'),
(3, 'anglais');

-- --------------------------------------------------------

--
-- Structure de la table `PROFS`
--

CREATE TABLE `PROFS` (
  `ID` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `PROFS`
--

INSERT INTO `PROFS` (`ID`, `nom`) VALUES
(1, 'Jean'),
(2, 'Monsieur');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `CLASSE`
--
ALTER TABLE `CLASSE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `nomClasse` (`nomClasse`),
  ADD KEY `IDecole` (`IDecole`);

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
-- Index pour la table `ECOLE`
--
ALTER TABLE `ECOLE`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `MAT-PROF`
--
ALTER TABLE `MAT-PROF`
  ADD KEY `IDmat` (`IDmat`),
  ADD KEY `fff` (`IDprof`);

--
-- Index pour la table `MATIERES`
--
ALTER TABLE `MATIERES`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `PROFS`
--
ALTER TABLE `PROFS`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `CLASSE`
--
ALTER TABLE `CLASSE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `COURS`
--
ALTER TABLE `COURS`
  MODIFY `IDcours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ECOLE`
--
ALTER TABLE `ECOLE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `MATIERES`
--
ALTER TABLE `MATIERES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `PROFS`
--
ALTER TABLE `PROFS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `CLASSE`
--
ALTER TABLE `CLASSE`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`IDecole`) REFERENCES `ECOLE` (`ID`);

--
-- Contraintes pour la table `COURS`
--
ALTER TABLE `COURS`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`IDclass`) REFERENCES `CLASSE` (`ID`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`IDecole`) REFERENCES `ECOLE` (`ID`),
  ADD CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`IDmatiere`) REFERENCES `MATIERES` (`ID`),
  ADD CONSTRAINT `cours_ibfk_4` FOREIGN KEY (`IDprof`) REFERENCES `PROFS` (`ID`);

--
-- Contraintes pour la table `MAT-PROF`
--
ALTER TABLE `MAT-PROF`
  ADD CONSTRAINT `fff` FOREIGN KEY (`IDprof`) REFERENCES `PROFS` (`ID`),
  ADD CONSTRAINT `mat-prof_ibfk_1` FOREIGN KEY (`IDmat`) REFERENCES `MATIERES` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
