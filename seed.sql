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

INSERT INTO Personne (idPersonne, nom, telephone, adherente) VALUES
(1, 'Dupont Alice', '0601020304', TRUE),
(2, 'Martin Bob', '0605060708', FALSE),
(3, 'Durand Charlie', '0609101112', TRUE),
(4, 'Lefebvre Marie', '0611223344', FALSE),
(5, 'Moreau Pierre', '0622334455', TRUE);

INSERT INTO Benevole (idBenevole, nom, prenom, telephone, dateArrivee, idReparation) VALUES
(1, 'Bernard', 'Jean', '0701020304', '2024-01-15', NULL),
(2, 'Petit', 'Claire', '0705060708', '2024-06-01', NULL),
(3, 'Rousseau', 'Thomas', '0709101112', '2025-02-10', NULL),
(4, 'Girard', 'Sophie', '0711223344', '2025-05-20', NULL);

INSERT INTO BenevolePossedeCompetence (idCompetence, idBenevole) VALUES 
(2, 1),
(4, 1),
(1, 2),
(3, 3),
(2, 4);

INSERT INTO Depot (idDepot, typeDepot, idPersonne, dateDeDepot) VALUES 
(1, 'Dépôt Boutique', 1, '2026-07-05 10:00:00'),
(2, 'Collecte à domicile', 1, '2026-07-12 14:00:00'),
(3, 'Dépôt Boutique', 1, '2026-07-20 11:00:00'),
(4, 'Dépôt Boutique', 1, '2026-08-01 09:30:00'),
(5, 'Collecte à domicile', 2, '2026-07-15 15:00:00'),
(6, 'Dépôt Boutique', 3, '2026-01-10 10:00:00');

INSERT INTO Vente (idVente, dateDeVente, modeDePayement) VALUES
(1, '2026-07-10 14:30:00', 'Espèces'),
(2, '2026-07-18 16:15:00', 'Carte BANCAIRE'),
(3, '2026-08-02 11:00:00', 'Chèque'),
(4, '2026-08-05 15:45:00', 'Carte BANCAIRE');

INSERT INTO Objet (idObjet, idCategorie, etat, poids, parcours, idDepot, idVente, prixPaye, prixObjet, dateMiseEnRayon) VALUES 
(1, 4, 'bon état', 2.50, 'Vendu', 1, 1, 15.00, 15.00, '2026-07-06'),
(2, 2, 'reparé', 8.00, 'Vendu', 1, 2, 85.00, 90.00, '2026-07-13'),
(3, 1, 'bon état', 18.00, 'Vendu', 2, 3, 120.00, 120.00, '2026-07-16'),
(4, 4, 'bon état', 1.20, 'Vendu', 3, 4, 10.00, 10.00, '2026-07-22'),
(5, 1, 'bon état', 25.00, 'En rayon', 5, NULL, NULL, 50.00, '2026-07-17'),
(6, 3, 'bon état', 0.80, 'En rayon', 6, NULL, NULL, 5.00, '2026-01-15'),
(7, 6, 'bon état', 1.50, 'En rayon', 6, NULL, NULL, 12.00, '2026-02-01'),
(8, 2, 'à réparer', 11.00, 'En réparation', 1, NULL, NULL, NULL, NULL),
(9, 2, 'irréparable', 9.50, 'Recyclage', 2, NULL, NULL, NULL, NULL),
(10, 5, 'bon état', 3.00, 'Réemployé', 3, NULL, NULL, NULL, NULL);

INSERT INTO Atelier (idAtelier, dateAtelier, nombreDePlace, idBenevoleParticipation) VALUES 
(1, '2026-02-15 14:00:00', 8, 1),
(2, '2026-05-10 10:00:00', 5, 2),
(3, '2026-09-10 14:00:00', 6, NULL);

INSERT INTO InscriptionAtelierPersonne (idAtelier, idPersonne, dateInscription, participation) VALUES 
(1, 1, '2026-02-01 09:00:00', 'Présent'),
(1, 2, '2026-02-02 11:30:00', 'Présent'),
(1, 3, '2026-02-03 14:00:00', 'Absent'),
(2, 4, '2026-05-01 10:00:00', 'Présent'),
(2, 5, '2026-05-02 16:00:00', 'Présent');

INSERT INTO Reparation (idReparation, idAtelier, idBenevole, dateReparation, echecDeReparation) VALUES 
(1, 1, 1, '2026-02-15 16:30:00', FALSE),
(2, 1, 1, '2026-02-15 17:30:00', FALSE),
(3, NULL, 1, '2026-03-10 11:00:00', TRUE),
(4, 2, 2, '2026-05-10 11:30:00', FALSE),
(5, NULL, 3, '2026-06-01 14:00:00', TRUE);

UPDATE Benevole SET idReparation = 1 WHERE idBenevole = 1;
UPDATE Benevole SET idReparation = 4 WHERE idBenevole = 2;
UPDATE Benevole SET idReparation = 5 WHERE idBenevole = 3;