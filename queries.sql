
-- (1) Combien d'objets avons-nous reçus le mois dernier, et quel poids total ?

-- SELECT 
--     COUNT(o.idObjet) AS nombre_objets,
--     SUM(o.poids) AS poids_total_kg
-- FROM Objet o
-- JOIN Depot d ON o.idDepot = d.idDepot
-- WHERE d.dateDeDepot >= '2026-07-01' 
--   AND d.dateDeDepot < '2026-08-01';
-- 8 objet reçu le mois dernier le poids est de 78?,20Kg



-- (2) Quels objets sont actuellement en rayon, et depuis combien de temps ?
 
-- SELECT 
--     o.idObjet,
--     c.libelle AS categorie,
--     o.dateMiseEnRayon,
--     (CURRENT_DATE - o.dateMiseEnRayon) AS jours_en_rayon
-- FROM Objet o
-- JOIN Categorie c ON o.idCategorie = c.idCategorie
-- WHERE o.parcours = 'En rayon';

-- mobilier(33j), livres(216),jouets(199),




-- (3) Quelle catégorie se vend le mieux ? Laquelle rapporte le plus ?
-- SELECT 
--     c.libelle AS categorie,
--     COUNT(o.idObjet) AS nombre_ventes,
--     SUM(o.prixPaye) AS total_rapporte 
-- FROM objet o 
-- join categorie c ON o.idCategorie = c.idCategorie
-- WHERE o.parcours = 'Vendu'
-- group by c.libelle 
-- ORDER BY total_rapporte DESC;




--(4) Combien d'heures de bénévolat ont été 
--consacrées à la réparation cette année ? 

-- SELECT COUNT(*) AS total_heures
-- FROM Reparation
-- WHERE EXTRACT(YEAR FROM dateReparation) = 2026;

--5heure sont consacrées 

--(5) Quel est le taux de réussite des réparations, par bénévole et globalement ?

-- SELECT 
--     COUNT(*) AS total_reparations,
--     SUM(CASE WHEN echecDeReparation = FALSE THEN 1 ELSE 0 END) AS reussites,
--     ROUND(SUM(CASE WHEN echecDeReparation = FALSE THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS taux_reussite_global
-- FROM Reparation;
-- taux réusitte globale : 60.00


-- SELECT 
--     idBenevole,
--     COUNT(*) AS total_reparations,
--     SUM(CASE WHEN echecDeReparation = FALSE THEN 1 ELSE 0 END) AS reussites,
--     ROUND(SUM(CASE WHEN echecDeReparation = FALSE THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS taux_reussite
-- FROM Reparation
-- GROUP BY idBenevole;
-- taux de reussite 0 et 100 et 66


--(6) Quelles personnes nous ont fait plus de trois dépôts ?
-- SELECT 
--     idBenevole,
--     COUNT(*) AS total_reparations,
--     SUM(CASE WHEN echecDeReparation = FALSE THEN 1 ELSE 0 END) AS reussites,
--     ROUND(SUM(CASE WHEN echecDeReparation = FALSE THEN 1.0 ELSE 0 END) / COUNT(*) * 100, 2) AS taux_reussite
-- FROM Reparation
-- GROUP BY idBenevole;


--(7) Quel poids total avons-nous détourné de la déchetterie (tout ce qui n'est pas recyclé) ?
-- SELECT 
--     SUM(poids) AS poids_total_detourne_kg
-- FROM Objet
-- WHERE LOWER(statut) NOT IN ('recyclé', 'recycle', 'jeté', 'jete', 'déchetterie', 'dechetterie');


--(8) Quel est le taux de présence réelle sur nos ateliers ?
-- SELECT 
--     ROUND(
--         COUNT(*) FILTER (WHERE participation = 'Présent') * 100.0 / COUNT(*),
--         2
--     ) AS taux_presence
-- FROM InscriptionAtelierPersonne;

--(9) Quels bénévoles ont la compétence « électricité » et sont disponibles pour animer un atelier ?
-- SELECT 
--     b.idBenevole,
--     b.nom,
--     b.prenom,
--     c.libelle AS competence
-- FROM Benevole b
-- JOIN BenevolePossedeCompetence bpc
--     ON b.idBenevole = bpc.idBenevole
-- JOIN Competence c
--     ON bpc.idCompetence = c.idCompetence
-- WHERE c.libelle = 'Électricité'
-- AND b.idBenevole NOT IN (
--     SELECT idBenevoleParticipation
--     FROM Atelier
--     WHERE idBenevoleParticipation IS NOT NULL
--     AND dateAtelier >= CURRENT_DATE
-- );


--(10) Quels objets sont en rayon depuis plus de six mois et devraient être sortis ?
-- SELECT 
--     o.idObjet,
--     c.libelle AS categorie,
--     o.dateMiseEnRayon,
--     o.poids,
--     (CURRENT_DATE - o.dateMiseEnRayon) AS jours_en_rayon
-- FROM Objet o
-- JOIN Categorie c 
--     ON o.idCategorie = c.idCategorie
-- WHERE o.parcours = 'En rayon'
--   AND o.dateMiseEnRayon < CURRENT_DATE - INTERVAL '6 months';