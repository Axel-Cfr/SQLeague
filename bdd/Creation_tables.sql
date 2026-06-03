CREATE TABLE format(
   id_format INT AUTO_INCREMENT,
   nom_format VARCHAR(50) NOT NULL,
   description VARCHAR(500),
   taille_equipe INT,
   PRIMARY KEY(id_format)
);

CREATE TABLE Jeux(
   id_jeux INT AUTO_INCREMENT,
   nom_jeux VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_jeux)
);

CREATE TABLE plateformes_difusion(
   id_platforme INT AUTO_INCREMENT,
   lien_plateforme VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_platforme)
);

CREATE TABLE type_utilisateur(
   id_type INT AUTO_INCREMENT,
   nom_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE Equipe(
   id_equipe INT AUTO_INCREMENT,
   nom_equipe VARCHAR(50) NOT NULL,
   taille INT NOT NULL,
   PRIMARY KEY(id_equipe)
);

CREATE TABLE lieu_tournoi(
   id_lieu INT AUTO_INCREMENT,
   nom_lieu VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_lieu)
);

CREATE TABLE Tournoi(
   id_tournoi INT AUTO_INCREMENT,
   nom_tournoi VARCHAR(50) NOT NULL,
   date_tournoi DATE NOT NULL,
   heure_debut TIME NOT NULL,
   id_jeux INT NOT NULL,
   id_format INT NOT NULL,
   PRIMARY KEY(id_tournoi),
   FOREIGN KEY(id_jeux) REFERENCES Jeux(id_jeux),
   FOREIGN KEY(id_format) REFERENCES format(id_format)
);

CREATE TABLE Utilisateur(
   id_utilisateur INT AUTO_INCREMENT,
   nom_utilisateur VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   hash_mot_de_passe BINARY(32) NOT NULL,
   id_type INT NOT NULL,
   PRIMARY KEY(id_utilisateur),
   FOREIGN KEY(id_type) REFERENCES type_utilisateur(id_type)
);

CREATE TABLE RECOMPENSE(
   ID_recompense INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   argent INT NOT NULL,
   id_tournoi INT NOT NULL,
   PRIMARY KEY(ID_recompense),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi)
);

CREATE TABLE annonce(
   id_annonce INT AUTO_INCREMENT,
   titre VARCHAR(50) NOT NULL,
   contenu VARCHAR(3000) NOT NULL,
   lien_inscription VARCHAR(50) NOT NULL,
   date_tournoi DATE NOT NULL,
   lien_image VARCHAR(50) NOT NULL,
   id_tournoi INT NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_annonce),
   UNIQUE(id_tournoi),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE article(
   id_article INT AUTO_INCREMENT,
   titre VARCHAR(50) NOT NULL,
   contenu VARCHAR(3000) NOT NULL,
   date_publication DATE NOT NULL,
   lien_image VARCHAR(50) NOT NULL,
   id_utilisateur INT NOT NULL,
   PRIMARY KEY(id_article),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE diffuser(
   id_tournoi INT,
   id_platforme INT,
   PRIMARY KEY(id_tournoi, id_platforme),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi),
   FOREIGN KEY(id_platforme) REFERENCES plateformes_difusion(id_platforme)
);

CREATE TABLE participer_solo(
   id_tournoi INT,
   id_utilisateur INT,
   score INT NOT NULL DEFAULT 0,
   rang INT DEFAULT NULL,
   PRIMARY KEY(id_tournoi, id_utilisateur),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

CREATE TABLE appartenir(
   id_utilisateur INT,
   id_equipe INT,
   PRIMARY KEY(id_utilisateur, id_equipe),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE participer_equipe(
   id_tournoi INT,
   id_equipe INT,
   score INT NOT NULL DEFAULT 0,
   rang INT DEFAULT NULL,
   PRIMARY KEY(id_tournoi, id_equipe),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi),
   FOREIGN KEY(id_equipe) REFERENCES Equipe(id_equipe)
);

CREATE TABLE seDerouler(
   id_tournoi INT,
   id_lieu INT,
   PRIMARY KEY(id_tournoi, id_lieu),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi),
   FOREIGN KEY(id_lieu) REFERENCES lieu_tournoi(id_lieu)
);

CREATE TABLE obtenir(
   id_utilisateur INT,
   ID_recompense INT,
   PRIMARY KEY(id_utilisateur, ID_recompense),
   FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur(id_utilisateur),
   FOREIGN KEY(ID_recompense) REFERENCES RECOMPENSE(ID_recompense)
);
