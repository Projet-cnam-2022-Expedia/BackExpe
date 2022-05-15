-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 15 mai 2022 à 21:29
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expedia`
--

-- --------------------------------------------------------

--
-- Structure de la table `activités`
--

DROP TABLE IF EXISTS `activités`;
CREATE TABLE IF NOT EXISTS `activités` (
  `id_activite` int(200) NOT NULL,
  `id_service` int(200) NOT NULL,
  `nom_activite` int(11) NOT NULL,
  `adresse_activite` varchar(200) NOT NULL,
  `ville_activite` varchar(40) NOT NULL,
  `genre_activite` varchar(30) NOT NULL,
  PRIMARY KEY (`id_activite`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `compagnies aériennes`
--

DROP TABLE IF EXISTS `compagnies aériennes`;
CREATE TABLE IF NOT EXISTS `compagnies aériennes` (
  `id_compagnie` int(10) NOT NULL,
  `id_service` int(10) NOT NULL,
  `nom_compagnie` varchar(80) NOT NULL,
  PRIMARY KEY (`id_compagnie`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compagnies aériennes`
--

INSERT INTO `compagnies aériennes` (`id_compagnie`, `id_service`, `nom_compagnie`) VALUES
(1, 1, 'CNAM AirLine');

-- --------------------------------------------------------

--
-- Structure de la table `escales`
--

DROP TABLE IF EXISTS `escales`;
CREATE TABLE IF NOT EXISTS `escales` (
  `id_vol` int(30) NOT NULL,
  `id_escale` int(30) NOT NULL,
  `nb_escale` int(30) NOT NULL,
  `ville_escale` varchar(30) NOT NULL,
  `temps_attente` time NOT NULL,
  PRIMARY KEY (`id_escale`),
  KEY `id_vol` (`id_vol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `escales`
--

INSERT INTO `escales` (`id_vol`, `id_escale`, `nb_escale`, `ville_escale`, `temps_attente`) VALUES
(1, 1, 3, 'Toulouse', '00:00:23'),
(1, 2, 4, 'Marseille', '00:00:02');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id_service` int(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `note` int(100) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table contenant les différents services';

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id_service`, `nom`, `description`, `note`) VALUES
(1, 'Compagnie ', 'compracompa', 5);

-- --------------------------------------------------------

--
-- Structure de la table `transports`
--

DROP TABLE IF EXISTS `transports`;
CREATE TABLE IF NOT EXISTS `transports` (
  `id_transport` int(30) NOT NULL,
  `id_service` int(30) NOT NULL,
  `nom_transport` varchar(100) NOT NULL,
  PRIMARY KEY (`id_transport`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

DROP TABLE IF EXISTS `vols`;
CREATE TABLE IF NOT EXISTS `vols` (
  `id_compagnie` int(30) NOT NULL,
  `id_vol` int(30) NOT NULL,
  `ville_depart` varchar(80) NOT NULL,
  `ville_arrivee` varchar(80) NOT NULL,
  PRIMARY KEY (`id_vol`),
  KEY `id_compagnie` (`id_compagnie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vols`
--

INSERT INTO `vols` (`id_compagnie`, `id_vol`, `ville_depart`, `ville_arrivee`) VALUES
(1, 1, 'Bordeaux', 'Paris'),
(1, 2, 'Marseille', 'Toulouse');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activités`
--
ALTER TABLE `activités`
  ADD CONSTRAINT `activités_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Contraintes pour la table `compagnies aériennes`
--
ALTER TABLE `compagnies aériennes`
  ADD CONSTRAINT `compagnies aériennes_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `compagnies aériennes` (`id_compagnie`);

--
-- Contraintes pour la table `escales`
--
ALTER TABLE `escales`
  ADD CONSTRAINT `escales_ibfk_1` FOREIGN KEY (`id_vol`) REFERENCES `vols` (`id_vol`);

--
-- Contraintes pour la table `transports`
--
ALTER TABLE `transports`
  ADD CONSTRAINT `transports_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Contraintes pour la table `vols`
--
ALTER TABLE `vols`
  ADD CONSTRAINT `vols_ibfk_1` FOREIGN KEY (`id_compagnie`) REFERENCES `compagnies aériennes` (`id_compagnie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
