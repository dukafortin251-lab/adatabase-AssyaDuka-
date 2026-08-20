# Decisions d'Architecture - Projet ADATABASE ASSYADUKA

## 1. Contrainte de référence circulaire (Benevole / Reparation)
* **Contexte** : Une dépendance croisée existe entre `Benevole` et `Reparation`.
* **Décision** : La clé étrangère `idReparation` dans `Benevole` est rendue optionnelle (`NULL`) à l'insertion initiale. Elle est mise à jour via un `UPDATE` une fois la réparation enregistrée. Les scripts de suppression utilisent `ALTER TABLE ... DROP CONSTRAINT` pour éviter les blocages de dépendance.

## 2. Découpage du parcours et des états des objets
* **Contexte** : Nécessité de suivre l'évolution d'un objet remis à l'association.
* **Décision** : Utilisation d'un champ texte `parcours` (`En rayon`, `Vendu`, `Recyclage`, `Réemployé`, `En réparation`) combiné aux clés étrangères optionnelles (`idDepot`, `idVente`) pour tracer l'historique complet sans multiplier les tables intermédiaires.

## 3. Gestion de l'historique des présences en atelier
* **Contexte** : Différencier l'inscription administrative de la présence effective.
* **Décision** : Ajout du champ `participation` (`Présent`, `Absent`) dans la table d'association `InscriptionAtelierPersonne` pour mesurer le taux d'assiduité réel.