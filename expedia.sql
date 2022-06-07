-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 07 juin 2022 à 12:08
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
-- Structure de la table `activites`
--

DROP TABLE IF EXISTS `activites`;
CREATE TABLE IF NOT EXISTS `activites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_service` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `lieu` varchar(256) NOT NULL,
  `prix` float NOT NULL,
  `horaire` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`id`, `id_service`, `nom`, `description`, `lieu`, `prix`, `horaire`) VALUES
(3, 3, 'Accrobranche', 'Vous pourrez vous sentir comme un singe dans la jungle ! Profitez du plus grand parcours d\'europe', '123 rue du danger 75002 Paris', 32, '10:43:50'),
(4, 3, 'Karting', 'Pas de panique vous pourrez enfin faire une course Mariokart en IRL', '1 place de la meilleure ville de France 33500 Bordeaux', 20, '08:43:50');

-- --------------------------------------------------------

--
-- Structure de la table `chambres`
--

DROP TABLE IF EXISTS `chambres`;
CREATE TABLE IF NOT EXISTS `chambres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nb_places` int(2) NOT NULL,
  `details_lits` varchar(128) NOT NULL,
  `salledebain_private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chambres`
--

INSERT INTO `chambres` (`id`, `nb_places`, `details_lits`, `salledebain_private`) VALUES
(1, 5, '2 Lits doubles et un lit simple', 1),
(2, 1, 'Un lit simple', 0),
(3, 2, 'Un lit double', 1),
(4, 7, '7 lits doubles', 1),
(5, 3, 'Trois lits simple', 1);

-- --------------------------------------------------------

--
-- Structure de la table `chambres_hotels`
--

DROP TABLE IF EXISTS `chambres_hotels`;
CREATE TABLE IF NOT EXISTS `chambres_hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chambre_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chambre_id` (`chambre_id`),
  KEY `hotel_id` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chambres_hotels`
--

INSERT INTO `chambres_hotels` (`id`, `chambre_id`, `hotel_id`) VALUES
(1, 1, 1),
(2, 4, 3),
(3, 3, 1),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `compagnies aeriennes`
--

DROP TABLE IF EXISTS `compagnies aeriennes`;
CREATE TABLE IF NOT EXISTS `compagnies aeriennes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idservices` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compagnies aeriennes`
--

INSERT INTO `compagnies aeriennes` (`id`, `service_id`, `nom`) VALUES
(1, 1, 'Air France'),
(2, 1, 'Air Corsica');

-- --------------------------------------------------------

--
-- Structure de la table `extras`
--

DROP TABLE IF EXISTS `extras`;
CREATE TABLE IF NOT EXISTS `extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GPS` tinyint(1) NOT NULL,
  `prix_GPS` float NOT NULL,
  `conducteur2` tinyint(1) NOT NULL,
  `prix_conducteur2` float NOT NULL,
  `siege_enfant` tinyint(1) NOT NULL,
  `prix_siege` float NOT NULL,
  `garantie` tinyint(1) NOT NULL,
  `prix_garantie` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `extras`
--

INSERT INTO `extras` (`id`, `GPS`, `prix_GPS`, `conducteur2`, `prix_conducteur2`, `siege_enfant`, `prix_siege`, `garantie`, `prix_garantie`) VALUES
(1, 1, 100, 1, 400, 0, 0, 1, 200),
(2, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 100, 1, 200, 1, 300, 1, 400);

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `adresse` text NOT NULL,
  `gym` tinyint(1) NOT NULL,
  `piscine` tinyint(1) NOT NULL,
  `spa` tinyint(1) NOT NULL,
  `bar` tinyint(1) NOT NULL,
  `repas` varchar(128) NOT NULL,
  `internet` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hotels`
--

INSERT INTO `hotels` (`id`, `service_id`, `Nom`, `adresse`, `gym`, `piscine`, `spa`, `bar`, `repas`, `internet`) VALUES
(1, 2, 'Camping Paradis', '17 avenue du soleil, Arcachon ', 0, 1, 0, 1, 'Moules frites ', 0),
(2, 2, 'Ibis Hotel', '1 rue de l\'hotel', 1, 0, 0, 1, 'Salade ', 1),
(3, 2, 'Le royale', '109 rue de la richesse', 1, 1, 1, 1, 'Huitres', 1);

-- --------------------------------------------------------

--
-- Structure de la table `passagers`
--

DROP TABLE IF EXISTS `passagers`;
CREATE TABLE IF NOT EXISTS `passagers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `pays` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `tele` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `num_passport` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reservation de hotel`
--

DROP TABLE IF EXISTS `reservation de hotel`;
CREATE TABLE IF NOT EXISTS `reservation de hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chambre_hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_reservation` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chambre_hotel_id` (`chambre_hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reservations de vehicules`
--

DROP TABLE IF EXISTS `reservations de vehicules`;
CREATE TABLE IF NOT EXISTS `reservations de vehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicule_complet_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_reservation` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5` (`vehicule_complet_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `reservations de vols`
--

DROP TABLE IF EXISTS `reservations de vols`;
CREATE TABLE IF NOT EXISTS `reservations de vols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compagnie_id` int(10) DEFAULT NULL,
  `vol_id` int(11) DEFAULT NULL,
  `passager_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `date_reservation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1` (`compagnie_id`),
  KEY `FK_3` (`passager_id`),
  KEY `FK_4` (`vol_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Déclencheurs `reservations de vols`
--
DROP TRIGGER IF EXISTS `decrementer`;
DELIMITER $$
CREATE TRIGGER `decrementer` AFTER INSERT ON `reservations de vols` FOR EACH ROW BEGIN
 DECLARE SELECTED INT;
   set SELECTED=NEW.vol_id;
    UPDATE vols
        SET num_place=num_place - 1
        WHERE id = SELECTED;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `salles de bain`
--

DROP TABLE IF EXISTS `salles de bain`;
CREATE TABLE IF NOT EXISTS `salles de bain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baignoire` tinyint(1) NOT NULL,
  `douche` tinyint(1) NOT NULL,
  `seche_cheveux` tinyint(1) NOT NULL,
  `shampoing` tinyint(1) NOT NULL,
  `savon` tinyint(1) NOT NULL,
  `serviettes` tinyint(1) NOT NULL,
  `papier_toilette` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salles de bain`
--

INSERT INTO `salles de bain` (`id`, `baignoire`, `douche`, `seche_cheveux`, `shampoing`, `savon`, `serviettes`, `papier_toilette`) VALUES
(1, 1, 0, 1, 1, 1, 1, 1),
(2, 0, 1, 1, 1, 1, 1, 1),
(3, 0, 0, 0, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sdb_chambre`
--

DROP TABLE IF EXISTS `sdb_chambre`;
CREATE TABLE IF NOT EXISTS `sdb_chambre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sdb_id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sdb_id` (`sdb_id`),
  KEY `chambre_id` (`chambre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sdb_chambre`
--

INSERT INTO `sdb_chambre` (`id`, `sdb_id`, `chambre_id`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 1, 2),
(4, 2, 4),
(5, 3, 4);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `description` text,
  `note` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `nom`, `description`, `note`) VALUES
(1, 'Vol', NULL, 5),
(2, 'Hotels', NULL, NULL),
(3, 'Activités', 'Des animations de fouuuuuuu', 9),
(4, 'Location de voiture', 'Des locations à prix très coool', 7);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_service` int(11) NOT NULL,
  `marque` varchar(30) DEFAULT NULL,
  `modele` varchar(30) DEFAULT NULL,
  `killometrage illimite` tinyint(1) DEFAULT NULL,
  `boite automatique` tinyint(1) DEFAULT NULL,
  `nombre de places` int(2) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id`, `id_service`, `marque`, `modele`, `killometrage illimite`, `boite automatique`, `nombre de places`, `prix`, `ville`) VALUES
(1, 4, 'ford', 'mustang', 1, 0, 4, 300, 'paris'),
(2, 4, 'renault', 'clio4', 1, 1, 5, 90, 'chessy'),
(3, 4, 'renault', 'clio2', 0, 1, 3, 50, 'bordeaux'),
(4, 4, 'audo', 'a3', 1, 1, 3, 140, 'paris');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules_extras`
--

DROP TABLE IF EXISTS `vehicules_extras`;
CREATE TABLE IF NOT EXISTS `vehicules_extras` (
  `vehicule_complet_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicule_id` int(11) NOT NULL,
  `extras_id` int(11) NOT NULL,
  `prix_final` float NOT NULL,
  PRIMARY KEY (`vehicule_complet_id`),
  KEY `extras_id` (`extras_id`),
  KEY `vehicule_id` (`vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `vehicules_extras`
--

INSERT INTO `vehicules_extras` (`vehicule_complet_id`, `vehicule_id`, `extras_id`, `prix_final`) VALUES
(1, 1, 1, 800),
(2, 4, 1, 1000),
(3, 3, 2, 300),
(4, 3, 3, 200);

-- --------------------------------------------------------

--
-- Structure de la table `vols`
--

DROP TABLE IF EXISTS `vols`;
CREATE TABLE IF NOT EXISTS `vols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_compagnie` int(255) NOT NULL,
  `depart` varchar(254) DEFAULT NULL,
  `destination` varchar(254) DEFAULT NULL,
  `date_depart` timestamp NULL DEFAULT NULL,
  `num_place` int(11) DEFAULT NULL,
  `escale` tinyint(1) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `statut` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idCompagnie` (`id_compagnie`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vols`
--

INSERT INTO `vols` (`id`, `id_compagnie`, `depart`, `destination`, `date_depart`, `num_place`, `escale`, `prix`, `statut`) VALUES
(1, 1, 'Paris', 'Londre', '2022-06-22 21:58:49', 62, 0, 100, ''),
(2, 1, 'Paris', 'Madrid', '2022-06-25 21:59:41', 52, 0, 36, ''),
(3, 2, 'Paris', 'New York', '2022-07-22 21:59:41', 32, 1, 320, ''),
(4, 1, 'Paris', 'Berlin', '2022-06-09 21:59:41', 20, 0, 50, ''),
(5, 1, 'Paris', 'Bordeaux', '2022-06-17 21:59:41', 90, 0, 70, ''),
(6, 1, 'Paris', 'Marseille', '2022-06-10 21:59:41', 30, 2, 90, ''),
(7, 2, 'Paris', 'Rome', '2022-06-24 21:59:41', 60, 0, 91, '');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activites`
--
ALTER TABLE `activites`
  ADD CONSTRAINT `activites_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);

--
-- Contraintes pour la table `chambres_hotels`
--
ALTER TABLE `chambres_hotels`
  ADD CONSTRAINT `chambres_hotels_ibfk_1` FOREIGN KEY (`chambre_id`) REFERENCES `chambres` (`id`),
  ADD CONSTRAINT `chambres_hotels_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`);

--
-- Contraintes pour la table `compagnies aeriennes`
--
ALTER TABLE `compagnies aeriennes`
  ADD CONSTRAINT `fk_idservices` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Contraintes pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Contraintes pour la table `reservation de hotel`
--
ALTER TABLE `reservation de hotel`
  ADD CONSTRAINT `reservation de hotel_ibfk_1` FOREIGN KEY (`chambre_hotel_id`) REFERENCES `chambres_hotels` (`id`);

--
-- Contraintes pour la table `reservations de vehicules`
--
ALTER TABLE `reservations de vehicules`
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`vehicule_complet_id`) REFERENCES `vehicules_extras` (`vehicule_complet_id`),
  ADD CONSTRAINT `reservations de vehicules_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `reservations de vols`
--
ALTER TABLE `reservations de vols`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`compagnie_id`) REFERENCES `compagnies aeriennes` (`id`),
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`passager_id`) REFERENCES `passagers` (`id`),
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`vol_id`) REFERENCES `vols` (`id`),
  ADD CONSTRAINT `reservations de vols_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `sdb_chambre`
--
ALTER TABLE `sdb_chambre`
  ADD CONSTRAINT `sdb_chambre_ibfk_1` FOREIGN KEY (`sdb_id`) REFERENCES `salles de bain` (`id`),
  ADD CONSTRAINT `sdb_chambre_ibfk_2` FOREIGN KEY (`chambre_id`) REFERENCES `chambres` (`id`);

--
-- Contraintes pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD CONSTRAINT `vehicules_ibfk_1` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`);

--
-- Contraintes pour la table `vehicules_extras`
--
ALTER TABLE `vehicules_extras`
  ADD CONSTRAINT `vehicules_extras_ibfk_1` FOREIGN KEY (`extras_id`) REFERENCES `extras` (`id`),
  ADD CONSTRAINT `vehicules_extras_ibfk_2` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicules` (`id`);

--
-- Contraintes pour la table `vols`
--
ALTER TABLE `vols`
  ADD CONSTRAINT `fk_idCompagnie` FOREIGN KEY (`id_compagnie`) REFERENCES `compagnies aeriennes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
