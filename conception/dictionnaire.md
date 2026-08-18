Nom                         |  description.                | Type.         | Tailles.        | contraintes.           | Rmq

collecte 


Nom                          Nom de l'adherent.             Varchar.         Max.              Obligatoire.         
Prenom                       prenom de l'adherent.          Varchar.         Max.              Obligatoire
tel                          Numero adh.                    Varchar                        Id automatique
date de collecte.            Date de collecte.              Date.                              Obligatoire
id-objet                     Nom de l'objet.                Varchar.         Max.              Obligatoire
depot.                       depot d'objet.                 Varchar.         Max.              Obligatoire


Objets                       

num.                        Numero de l'ojet.               Varchar          Max.              Obligatoire
categorie.                  categorie de l'objet.           Varchar          Max.              Obligatoire
etat.                       etat de l'objet.                Varchar.         Max.              Obligatoire
poids                       Poids de l'objet.               Numerique.       Max.              Obligatoire             
parcours                    Parcours de l'objet.            Varchar.         Max.              Obligatoire 


Reparation

id-objet.                   Nom de l'objet.                 Varchar          Max               Obligatoire
atelier                     Nom de l'atelier.               Varchar          Max               Obligatoire
benevole.                   Nom du benevole.                Varchar          Max               Obligatoire
date.                       Date de reparation              Date             Max               Obligatoire
temps                       Temps de reparation             Numerique        Max               Obligatoire


Boutique

id-objet                   Nom de l'objet                   Varchar          Max                Obligatoire
prix                       prix de l'objet                  Numerique        Max                Obligatoire
date de vente              date de vente                    Date             Max.               Obligatoire 
mode de paiement           Moyen de paiement                varchar          Max                Obligatoire


Benevoles


date d'inscription.        Date d'adhesion.                 Date             Max                Obligatoire
competences                qualification                    Varchar          Max                Obligatoire
id-objet                                                    Varchar          Max                Obligatoire           

Ateliers 


atelier.                   nom de l'atelier                 Varchar          Max                Obligatoire  
date.                      date de l'activite               Date             Max                Obligatoire
duree                      duree d'activite                 Numerique        Max                Obligatoire
nombre de place            nombre de place dispo            Numerique        Max                Obligatoire
benevole                   nom du benevole                  Varchar          Max                obligatoire
inscription.               inscris                          Boolean          Max                Obligatoire
participation              Presence                         Boolean          Max                Obligatoire






tous r1

categorie(id categorie) R1 

vente (id vente, date de vente, mode de payement)R1


benevole(id benevole, nom, prenom, telephone, dateArrivee, #idreparation) R2
 
benevolePossedeCompetence (#idCommpetence,#idBenevole)R3

competence (idCompetence, libelle,)


atelier (idAtelier, date, nombre de place, #idbenevole participation) R1+R2

inscriptionAtelierPersonne (#idatelier, #idpersonne, datedincription, participation) R3

objet (idObjet , categorie, etat, poids, parcours,#iddepot, #idvente prixpaye, prix objet, datemiseenrayon) R2 


Depot (idDepot, typeDepot, #idPersonne, dateDeDepot) R2


reparation(atelier, benevole, date, echecDereparation) 


Personne (idPersonne telephone, nom, adherente)  
