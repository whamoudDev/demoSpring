
INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'Luxembourg'),
(2, 'Algérie'),
(3, 'Russie'),
(4, 'Chine');

INSERT INTO `emploi` (`id`, `nom`) VALUES
(1, 'Developpeur'),
(2, 'Boulanger'),
(3, 'Technicien'),
(4, 'Chauffeur');

INSERT INTO `Entreprise` (`id`, `nom`) VALUES
(1, 'Amazon'),
(2, 'Google'),
(3, 'Microsoft'),
(4, 'Apple');

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN'),
(3, 'ROLE_SUPERADMIN');


INSERT INTO utilisateur(prenom, nom, pays_id, entreprise_id, email, password,  created_at, update_at)
VALUES
("John","Doe",2,1,"a@a.com","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Walid", "Hamoud",3,1,"wh@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Tita","Mahir",3,1,"tm@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Adel", "Iberraken",3,1,"ia@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",NOW(),NOW());

INSERT INTO roles(utilisateur_id, role_id) VALUES
(1,2),
(2,3),
(3,1),
(4,1);

INSERT INTO `recherche_emploi_utilisateur` (`utilisateur_id`, `emploi_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 4);

INSERT INTO `contrat` (`id`, `date_de_creation`, `date_de_retour`) VALUES
(1, '2023-05-09', '2023-05-11'),
(2, '2023-05-10', NULL);

INSERT INTO `materiel` (`id`, `nom`, `numero`) VALUES
(1, 'Ecran 30\"', 123),
(2, 'Ecran 30\"', 456),
(3, 'Clavier', 789);

INSERT INTO `ligne_de_contrat` (`contrat_id`, `materiel_id`, `date_de_retour_anticipe`) VALUES
(1, 1, NULL),
(1, 3, '2023-05-10'),
(2, 2, NULL);

