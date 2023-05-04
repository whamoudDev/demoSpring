
INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'France'),
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
(2, 'ROLE_ADMIN');

INSERT INTO utilisateur(prenom, nom, pays_id, entreprise_id, email, password, role_id, created_at, update_at)
VALUES
("John","Doe",2,1,"a@a.com","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",1,UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Walid", "Hamoud",3,1,"wh@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",2,UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Tita","Mahir",3,1,"tm@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",1,UTC_TIMESTAMP(),UTC_TIMESTAMP()),
("Adel", "Iberraken",3,1,"ia@mns.fr","$2a$10$kIrDzHlSVKBWFmdgJW4D0.ts6PdlYTDoSAYrvJt7M1cHILFsT/206",1,NOW(),NOW());

INSERT INTO `recherche_emploi_utilisateur` (`utilisateur_id`, `emploi_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 4);