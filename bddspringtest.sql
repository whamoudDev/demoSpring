-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 mai 2023 à 07:21
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bddspringtest`
--

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

DROP TABLE IF EXISTS `emploi`;
CREATE TABLE IF NOT EXISTS `emploi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emploi`
--

INSERT INTO `emploi` (`id`, `nom`) VALUES
(1, 'Developpeur'),
(2, 'Boulanger'),
(3, 'Technicien'),
(4, 'Chauffeur');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`id`, `nom`) VALUES
(1, 'Amazon'),
(2, 'Google'),
(3, 'Microsoft'),
(4, 'Apple');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'France'),
(2, 'Algérie'),
(3, 'Russie'),
(4, 'Chine');

-- --------------------------------------------------------

--
-- Structure de la table `recherche_emploi_utilisateur`
--

DROP TABLE IF EXISTS `recherche_emploi_utilisateur`;
CREATE TABLE IF NOT EXISTS `recherche_emploi_utilisateur` (
  `utilisateur_id` int NOT NULL,
  `emploi_id` int NOT NULL,
  PRIMARY KEY (`utilisateur_id`,`emploi_id`),
  KEY `FKm97nfoc6ask1llg09q3mppqre` (`emploi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recherche_emploi_utilisateur`
--

INSERT INTO `recherche_emploi_utilisateur` (`utilisateur_id`, `emploi_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_image_profil` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prenom` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `entreprise_id` int DEFAULT NULL,
  `pays_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8fjtucbyo2t6agaejym2j764f` (`entreprise_id`),
  KEY `FKc1g8do1rrrp4bwytrl73elnou` (`pays_id`),
  KEY `FKaqe8xtajee4k0wlqrvh2pso4l` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `created_at`, `email`, `nom`, `nom_image_profil`, `password`, `prenom`, `update_at`, `entreprise_id`, `pays_id`, `role_id`) VALUES
(1, '2023-04-28 10:01:36.000000', 'a@a.com', 'Doe', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'John', '2023-04-28 10:01:36.000000', 1, 2, 1),
(2, '2023-04-28 10:01:36.000000', 'wh@mns.fr', 'Hamoud', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Walid', '2023-04-28 10:01:36.000000', 1, 3, 2),
(3, '2023-04-28 10:01:36.000000', 'tm@mns.fr', 'Mahir', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Tita', '2023-04-28 10:01:36.000000', 1, 3, 1),
(4, '2023-04-28 12:01:36.000000', 'ia@mns.fr', 'Iberraken', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Adel', '2023-04-28 12:01:36.000000', 1, 3, 1),
(5, '2023-04-28 10:02:29.867986', 'sdfsf@dqfqdf', 'erzer', 'f28745c1-2906-465f-937a-3ad3214a6567_PcPortable.jpg', '$2a$10$J91R788j9HI4p7LaJedvtOufqKzEfMx8f3.7JSC38I2QJ/Flf0GLK', 'ezrzf', '2023-04-28 10:02:29.869026', NULL, 3, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `recherche_emploi_utilisateur`
--
ALTER TABLE `recherche_emploi_utilisateur`
  ADD CONSTRAINT `FKin27d40gudmy4kejw5ufuxakp` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKm97nfoc6ask1llg09q3mppqre` FOREIGN KEY (`emploi_id`) REFERENCES `emploi` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK8fjtucbyo2t6agaejym2j764f` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`),
  ADD CONSTRAINT `FKaqe8xtajee4k0wlqrvh2pso4l` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKc1g8do1rrrp4bwytrl73elnou` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
