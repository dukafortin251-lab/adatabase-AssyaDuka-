INSERT INTO Categorie (idCategorie, libelle) VALUES 
(1, 'Mobilier'),
(2, 'Électroménager'),
(3, 'Livres'),
(4, 'Vaisselle'),
(5, 'Textile'),
(6, 'Jouets'),
(7, 'Bricolage');

INSERT INTO Competence (idCompetence, libelle) VALUES
(1, 'Couture'),
(2, 'Électricité'),
(3, 'Menuiserie'),
(4, 'Informatique'),
(5, 'Vente');

INSERT INTO Vente (idVente, dateDeVente, modeDePayement) VALUES
(1, '2026-03-01 14:30:00', 'Espèces'),
(2, '2026-03-01 16:15:00', 'Carte BANCAIRE'),
(3, '2026-03-02 11:00:00', 'Chèque');

INSERT INTO Personne (idPersonne, nom, telephone, adherente) VALUES
(1, 'Dupont Alice', '0601020304', TRUE),
(2, 'Martin Bob', '0605060708', FALSE),
(3, 'Durand Charlie', '0609101112', TRUE),
(4, 'Lefebvre Marie', '0611223344', FALSE);

INSERT INTO Depot (idDepot, typeDepot, idPersonne, dateDeDepot) VALUES 
(1, 'Dépôt Boutique', 1, '2026-02-01 10:00:00'),
(2, 'Collecte à domicile', 2, '2026-02-05 14:30:00');

INSERT INTO Objet (idObjet, idCategorie, etat, poids, parcours, idDepot, idVente, prixPaye, prixObjet, dateMiseEnRayon) VALUES 
(1, 4, 'bon état', 4.50, 'Vendu', 1, 1, 12.00, 15.00, '2026-02-02'),
(2, 2, 'à réparer', 12.00, 'En réparation', 1, NULL, NULL, NULL, NULL),
(3, 1, 'bon état', 22.00, 'En rayon', 2, NULL, NULL, 45.00, '2026-02-10'),
(4, 2, 'hors service', 8.50, 'Recyclage', 2, NULL, NULL, NULL, NULL);


INSERT INTO Benevole (idBenevole, nom, prenom, telephone, dateArrivee, idReparation) VALUES 
(1, 'Bernard', 'Jean', '0701020304', '2024-01-15', NULL),
(2, 'Petit', 'Claire', '0705060708', '2024-06-01', NULL),
(3, 'Rousseau', 'Thomas', '0709101112', '2025-02-10', NULL);

INSERT INTO BenevolePossedeCompetence (idCompetence, idBenevole) VALUES 
(2, 1),
(4, 1),
(1, 2),
(3, 3);

INSERT INTO Atelier (idAtelier, dateAtelier, nombreDePlace, idBenevoleParticipation) VALUES 
(1, '2026-02-15 14:00:00', 8, 1),
(2, '2026-03-05 10:00:00', 5, 2);

INSERT INTO InscriptionAtelierPersonne (idAtelier, idPersonne, dateInscription, participation) VALUES 
(1, 1, '2026-02-01 09:00:00', 'Présent'),
(1, 2, '2026-02-02 11:30:00', 'Désisté'),
(2, 3, '2026-02-20 16:00:00', 'Présent');

INSERT INTO Reparation (idReparation, idAtelier, idBenevole, dateReparation, echecDeReparation) VALUES 
(1, 1, 1, '2026-02-15 16:30:00', FALSE),
(2, NULL, 1, '2026-02-18 11:00:00', TRUE);

UPDATE Benevole SET idReparation = 1 WHERE idBenevole = 1;