-- 1. Tables indépendantes
CREATE TABLE Categorie (
    idCategorie INT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE Vente (
    idVente INT PRIMARY KEY,
    dateDeVente TIMESTAMP NOT NULL,
    modeDePayement VARCHAR(50)
);

CREATE TABLE Competence (
    idCompetence INT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE Personne (
    idPersonne INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    adherente BOOLEAN DEFAULT FALSE
);

CREATE TABLE Depot (
    idDepot INT PRIMARY KEY,
    typeDepot VARCHAR(50),
    idPersonne INT REFERENCES Personne(idPersonne),
    dateDeDepot TIMESTAMP NOT NULL
);

CREATE TABLE Objet (
    idObjet INT PRIMARY KEY,
    idCategorie INT REFERENCES Categorie(idCategorie),
    etat VARCHAR(50),
    poids DECIMAL(5,2),
    parcours TEXT,
    idDepot INT REFERENCES Depot(idDepot),
    idVente INT REFERENCES Vente(idVente),
    prixPaye DECIMAL(8,2),
    prixObjet DECIMAL(8,2),
    dateMiseEnRayon DATE
);

CREATE TABLE Benevole (
    idBenevole INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    dateArrivee DATE,
    idReparation INT
);

CREATE TABLE BenevolePossedeCompetence (
    idCompetence INT REFERENCES Competence(idCompetence),
    idBenevole INT REFERENCES Benevole(idBenevole),
    PRIMARY KEY (idCompetence, idBenevole)
);

CREATE TABLE Atelier (
    idAtelier INT PRIMARY KEY,
    dateAtelier TIMESTAMP NOT NULL,
    nombreDePlace INT,
    idBenevoleParticipation INT REFERENCES Benevole(idBenevole)
);

CREATE TABLE InscriptionAtelierPersonne (
    idAtelier INT REFERENCES Atelier(idAtelier),
    idPersonne INT REFERENCES Personne(idPersonne),
    dateInscription TIMESTAMP NOT NULL,
    participation VARCHAR(100),
    PRIMARY KEY (idAtelier, idPersonne)
);

CREATE TABLE Reparation (
    idReparation INT PRIMARY KEY,
    idAtelier INT REFERENCES Atelier(idAtelier),
    idBenevole INT REFERENCES Benevole(idBenevole),
    dateReparation TIMESTAMP NOT NULL,
    echecDeReparation BOOLEAN DEFAULT FALSE
);

ALTER TABLE Benevole
ADD FOREIGN KEY (idReparation) REFERENCES Reparation(idReparation);

