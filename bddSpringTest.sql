-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 15 juin 2023 à 11:55
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
-- Structure de la table `contrat`
--

DROP TABLE IF EXISTS `contrat`;
CREATE TABLE IF NOT EXISTS `contrat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_de_creation` date DEFAULT NULL,
  `date_de_retour` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contrat`
--

INSERT INTO `contrat` (`id`, `date_de_creation`, `date_de_retour`) VALUES
(1, '2023-05-09', '2023-05-11'),
(2, '2023-05-10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `emploi`
--

DROP TABLE IF EXISTS `emploi`;
CREATE TABLE IF NOT EXISTS `emploi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
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
  `nom` varchar(255) DEFAULT NULL,
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
-- Structure de la table `ligne_de_contrat`
--

DROP TABLE IF EXISTS `ligne_de_contrat`;
CREATE TABLE IF NOT EXISTS `ligne_de_contrat` (
  `contrat_id` int NOT NULL,
  `materiel_id` int NOT NULL,
  `date_de_retour_anticipe` date DEFAULT NULL,
  PRIMARY KEY (`contrat_id`,`materiel_id`),
  KEY `FK7wwltaxcl89fe8tyt2ieyupwv` (`materiel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_de_contrat`
--

INSERT INTO `ligne_de_contrat` (`contrat_id`, `materiel_id`, `date_de_retour_anticipe`) VALUES
(1, 1, NULL),
(1, 3, '2023-05-10'),
(2, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `numero` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id`, `nom`, `numero`) VALUES
(1, 'Ecran 30\"', 123),
(2, 'Ecran 30\"', 456),
(3, 'Clavier', 789);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'Luxembourg'),
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
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_SUPERADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `utilisateur_id` int NOT NULL,
  `role_id` int NOT NULL,
  KEY `FKgwdqnvhgfx78oeaxjx2acxqn8` (`role_id`),
  KEY `FKkheg2dyk9h6pj3ntypsnm1305` (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`utilisateur_id`, `role_id`) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `nom_image_profil` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(80) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `entreprise_id` int DEFAULT NULL,
  `pays_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8fjtucbyo2t6agaejym2j764f` (`entreprise_id`),
  KEY `FKc1g8do1rrrp4bwytrl73elnou` (`pays_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `created_at`, `email`, `nom`, `nom_image_profil`, `password`, `prenom`, `update_at`, `entreprise_id`, `pays_id`) VALUES
(1, '2023-06-15 11:55:04.000000', 'a@a.com', 'Doe', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'John', '2023-06-15 11:55:04.000000', 1, 2),
(2, '2023-06-15 11:55:04.000000', 'wh@mns.fr', 'Hamoud', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Walid', '2023-06-15 11:55:04.000000', 1, 3),
(3, '2023-06-15 11:55:04.000000', 'tm@mns.fr', 'Mahir', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Tita', '2023-06-15 11:55:04.000000', 1, 3),
(4, '2023-06-15 13:55:04.000000', 'ia@mns.fr', 'Iberraken', NULL, '$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206', 'Adel', '2023-06-15 13:55:04.000000', 1, 3);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ligne_de_contrat`
--
ALTER TABLE `ligne_de_contrat`
  ADD CONSTRAINT `FK5tui6uo11yoq0ag9vne4m1o55` FOREIGN KEY (`contrat_id`) REFERENCES `contrat` (`id`),
  ADD CONSTRAINT `FK7wwltaxcl89fe8tyt2ieyupwv` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`);

--
-- Contraintes pour la table `recherche_emploi_utilisateur`
--
ALTER TABLE `recherche_emploi_utilisateur`
  ADD CONSTRAINT `FKin27d40gudmy4kejw5ufuxakp` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKm97nfoc6ask1llg09q3mppqre` FOREIGN KEY (`emploi_id`) REFERENCES `emploi` (`id`);

--
-- Contraintes pour la table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `FKgwdqnvhgfx78oeaxjx2acxqn8` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKkheg2dyk9h6pj3ntypsnm1305` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK8fjtucbyo2t6agaejym2j764f` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprise` (`id`),
  ADD CONSTRAINT `FKc1g8do1rrrp4bwytrl73elnou` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
