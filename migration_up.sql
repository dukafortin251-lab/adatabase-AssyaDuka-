-- 1. Tables indépendantes
CREATE TABLE Categorie (
    idCategorie SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE Vente (
    idVente SERIAL PRIMARY KEY,
    dateDeVente TIMESTAMP NOT NULL,
    modeDePayement VARCHAR(50)
);

CREATE TABLE Competence (
    idCompetence SERIAL PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL
);

CREATE TABLE Personne (
    idPersonne SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    adherente BOOLEAN DEFAULT FALSE
);

-- 2. Depot (dépend de Personne)
CREATE TABLE Depot (
    idDepot SERIAL PRIMARY KEY,
    typeDepot VARCHAR(50),
    idPersonne INT,
    dateDeDepot TIMESTAMP NOT NULL,
    CONSTRAINT fk_depot_personne FOREIGN KEY (idPersonne) REFERENCES Personne(idPersonne)
);

-- 3. Objet (dépend de Categorie, Depot et Vente)
CREATE TABLE Objet (
    idObjet SERIAL PRIMARY KEY,
    idCategorie INT,
    etat VARCHAR(50),
    poids DECIMAL(5,2),
    parcours TEXT,
    idDepot INT,
    idVente INT,
    prixPaye DECIMAL(8,2),
    prixObjet DECIMAL(8,2),
    dateMiseEnRayon DATE,
    CONSTRAINT fk_objet_categorie FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie),
    CONSTRAINT fk_objet_depot FOREIGN KEY (idDepot) REFERENCES Depot(idDepot),
    CONSTRAINT fk_objet_vente FOREIGN KEY (idVente) REFERENCES Vente(idVente)
);

-- 4. Benevole (correction de la virgule et du point-virgule)
CREATE TABLE Benevole (
    idBenevole SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    dateArrivee DATE,
    idReparation INT
);

CREATE TABLE BenevolePossedeCompetence (
    idCompetence INT,
    idBenevole INT,
    PRIMARY KEY (idCompetence, idBenevole),
    CONSTRAINT fk_bpc_competence FOREIGN KEY (idCompetence) REFERENCES Competence(idCompetence),
    CONSTRAINT fk_bpc_benevole FOREIGN KEY (idBenevole) REFERENCES Benevole(idBenevole)
);

CREATE TABLE Atelier (
    idAtelier SERIAL PRIMARY KEY,
    dateAtelier TIMESTAMP NOT NULL,
    nombreDePlace INT,
    idBenevoleParticipation INT,
    CONSTRAINT fk_atelier_benevole FOREIGN KEY (idBenevoleParticipation) REFERENCES Benevole(idBenevole)
);

CREATE TABLE InscriptionAtelierPersonne (
    idAtelier INT,
    idPersonne INT,
    dateInscription TIMESTAMP NOT NULL,
    participation VARCHAR(100),
    PRIMARY KEY (idAtelier, idPersonne),
    CONSTRAINT fk_iap_atelier FOREIGN KEY (idAtelier) REFERENCES Atelier(idAtelier),
    CONSTRAINT fk_iap_personne FOREIGN KEY (idPersonne) REFERENCES Personne(idPersonne)
);

CREATE TABLE Reparation (
    idReparation SERIAL PRIMARY KEY,
    idAtelier INT,
    idBenevole INT,
    dateReparation TIMESTAMP NOT NULL,
    echecDeReparation BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_reparation_atelier FOREIGN KEY (idAtelier) REFERENCES Atelier(idAtelier),
    CONSTRAINT fk_reparation_benevole FOREIGN KEY (idBenevole) REFERENCES Benevole(idBenevole)
);

ALTER TABLE Benevole
ADD CONSTRAINT fk_benevole_reparation
FOREIGN KEY (idReparation) REFERENCES Reparation(idReparation);