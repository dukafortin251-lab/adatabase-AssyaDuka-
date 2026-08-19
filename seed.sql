INSERT INTO Categorie (idCategorie, libelle) VALUES 
(1, 'Mobilier'),
(2, 'Électroménager'),
(3, 'Livres'),
(4, 'Vaisselle'),
(5, 'Textile'),
(6, 'Jouets'),
(7, 'Bricolage');


INSERT INTO competence (idCompetence, libelle) VALUES
(1, 'Couture'),
(2, 'Électricité'),
(3, 'Menuiserie'),
(4, 'Informatique'),
(5, 'Vente');

INSERT INTO Vente (idVente, dateDeVente, modeDePlayement) VALUES
(1, '2026-03-01 14:30:00', 'Espèces'),
(2, '2026-03-01 16:15:00', 'Carte BANCAIRE'),
(3, '2026-03-02 11:00:00', 'Chèque');


INSERT INTO Personne (idpersonne, nom, telephone, adherante) VALUES
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


INSERT INTO Benevole 