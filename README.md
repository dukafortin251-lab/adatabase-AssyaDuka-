# Adatabase — Base de données

## Présentation

Projet SQL Adatabase

La base de données permet de gérer :

* les personnes et leurs dépôts ;
* les objets et leurs catégories ;
* les ventes ;
* les bénévoles et leurs compétences ;
* les ateliers et les inscriptions ;
* les réparations et leur taux de réussite.

## Technologies

* PostgreSQL 16
* Docker
* SQL

## Initialisation

Pour initialiser la base de données :

bash
docker compose up -d
docker exec -i adatabase-db psql -U ada -d adatabase < migration_up.sql
docker exec -i adatabase-db psql -U ada -d adatabase < seed.sql


## Fichiers principaux

*  docker-compose.yml — configuration de PostgreSQL avec Docker
*  migration_up.sql — création des tables et des relations
*  migration_down.sql — suppression de la structure de la base
*  seed.sql — insertion des données de test
*  queries.sql — requêtes SQL répondant aux questions du TP
*  conception/ — éléments de conception de la base de données

## Requêtes réalisées

Les requêtes SQL permettent notamment de repondre aux questions du tp, notament : 

* le nombre d'objets reçus le mois dernier et leur poids total ;
* les objets actuellement en rayon et leur ancienneté ;
* les catégories qui se vendent le mieux et celles qui rapportent le plus ;
* le nombre de réparations réalisées cette année ;
* le taux de réussite des réparations globalement et par bénévole ;
* les personnes ayant effectué plus de trois dépôts ;
* le poids des objets réemployés ;
* le taux de présence aux ateliers ;
* les bénévoles possédant la compétence « Électricité » et disponibles pour animer un atelier ;
* les objets présents en rayon depuis plus de six mois.

## Structure de la base

La base contient les tables suivantes :

*  Categorie
*  Vente
*  Competence
*  Personne
*  Depot
*  Objet
*  Benevole
*  BenevolePossedeCompetence
*  Atelier
*  InscriptionAtelierPersonne
*  Reparation

## Arrêt de la base

bash
docker compose down


Les données sont conservées dans le volume Docker.

Pour supprimer complètement les données et repartir de zéro :

bash
docker compose down -v

