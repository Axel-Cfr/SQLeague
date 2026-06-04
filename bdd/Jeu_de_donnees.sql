-- Types d'utilisateurs
INSERT INTO type_utilisateur (nom_type) VALUES
('admin'),
('user'),
('com'),
('bde');

-- Formats
INSERT INTO format (nom_format, description, taille_equipe) VALUES
('Best Of 1', 'Un seul match par rencontre', 1),
('Best Of 3', 'Deux victoires nécessaires pour gagner', 1),
('Best Of 1 - Equipe 5v5', 'Un seul match par rencontre en équipe de 5', 5),
('Best Of 3 - Equipe 2v2', 'Deux victoires nécessaires en équipe de 2', 2);

-- Jeux
INSERT INTO Jeux (nom_jeux) VALUES
('League of Legends'),
('Valorant'),
('Rocket League'),
('FIFA 25'),
('Counter-Strike 2');

-- Lieux
INSERT INTO lieu_tournoi (nom_lieu) VALUES
('Salle B012'),
('Salle A204'),
('En ligne'),
('Amphi Turing');

-- Plateformes de diffusion
INSERT INTO plateformes_difusion (lien_plateforme) VALUES
('https://twitch.tv/sqleague'),
('https://youtube.com/@sqleague');

-- Utilisateurs
INSERT INTO Utilisateur (nom_utilisateur, email, hash_mot_de_passe, id_type) VALUES
-- Organisateurs (id_type = 1)
('NightOwl_Noa', 'noa.martin@edu.fr',   UNHEX(SHA2('Noa#2026',   256)), 1),
('ProNoa42',     'noa.garcia@edu.fr',   UNHEX(SHA2('Noa#2026',   256)), 1),
-- Joueurs (id_type = 2)
('ShadowBlade',  'ines.moreau@edu.fr',  UNHEX(SHA2('Ines#2026',  256)), 2),
('PixelKnight',  'lucas.simon@edu.fr',  UNHEX(SHA2('Lucas#2026', 256)), 2),
('StormRider',   'theo.petit@edu.fr',   UNHEX(SHA2('Theo#2026',  256)), 2),
('FrostQueen',   'emma.bernard@edu.fr', UNHEX(SHA2('Emma#2026',  256)), 2),
('VoidHunter',   'adam.robert@edu.fr',  UNHEX(SHA2('Adam#2026',  256)), 2),
('BlazeMaster',  'chloe.thomas@edu.fr', UNHEX(SHA2('Chloe#2026', 256)), 2),
('IronWolf',     'hugo.michel@edu.fr',  UNHEX(SHA2('Hugo#2026',  256)), 2),
('StarSeeker',   'lea.fontaine@edu.fr', UNHEX(SHA2('Lea#2026',   256)), 2),
('DarkMatter',   'ryan.girard@edu.fr',  UNHEX(SHA2('Ryan#2026',  256)), 2),
('NeonFalcon',   'sofia.roux@edu.fr',   UNHEX(SHA2('Sofia#2026', 256)), 2),
-- Communication (id_type = 3)
('AliXcom',      'alix.dupont@edu.fr',  UNHEX(SHA2('Alix#2026',  256)), 3),
-- BDE (id_type = 4)
('JadeAdmin',    'jade.leroy@edu.fr',   UNHEX(SHA2('Jade#2026',  256)), 4);

-- Tournois (passés + à venir)
INSERT INTO Tournoi (nom_tournoi, date_tournoi, heure_debut, id_jeux, id_format) VALUES
('LoL Winter Cup',        '2026-01-15', '19:00:00', 1, 3), -- id 1 - équipe 5v5 terminé
('Valorant Spring Open',  '2026-03-20', '20:00:00', 2, 1), -- id 2 - solo BO1 terminé
('Rocket League Clash',   '2026-05-10', '18:30:00', 3, 4), -- id 3 - équipe 2v2 terminé
('CS2 Summer Showdown',   '2026-07-12', '20:00:00', 5, 2), -- id 4 - solo BO3 à venir
('FIFA 25 Cup',           '2026-08-25', '19:00:00', 4, 1); -- id 5 - solo BO1 à venir

-- Lieux des tournois
INSERT INTO seDerouler (id_tournoi, id_lieu) VALUES
(1, 1),  -- LoL Winter Cup en salle B012
(2, 3),  -- Valorant en ligne
(3, 2),  -- Rocket League en salle A204
(4, 3),  -- CS2 en ligne
(5, 4);  -- FIFA en Amphi Turing

-- Diffusion
INSERT INTO diffuser (id_tournoi, id_platforme) VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2);

-- Récompenses
INSERT INTO RECOMPENSE (nom, argent, id_tournoi) VALUES
('1er LoL Winter Cup',       50, 1),
('2ème LoL Winter Cup',      30, 1),
('3ème LoL Winter Cup',      20, 1),
('1er Valorant Spring Open', 40, 2),
('2ème Valorant Spring Open',20, 2),
('1er Rocket League Clash',  30, 3),
('2ème Rocket League Clash', 15, 3),
('1er CS2 Summer Showdown',  50, 4),
('2ème CS2 Summer Showdown', 25, 4),
('1er FIFA 25 Cup',          40, 5),
('2ème FIFA 25 Cup',         20, 5);

-- Équipes (pour LoL 5v5 et Rocket League 2v2)
INSERT INTO Equipe (nom_equipe, taille) VALUES
('Team Alpha',  5),  -- id 1 - LoL
('Team Omega',  5),  -- id 2 - LoL
('RocketDuo A', 2),  -- id 3 - Rocket League
('RocketDuo B', 2);  -- id 4 - Rocket League

-- Membres des équipes
INSERT INTO appartenir (id_utilisateur, id_equipe) VALUES
-- Team Alpha (LoL) : joueurs 5 à 9
(5, 1), (6, 1), (7, 1), (8, 1), (9, 1),
-- Team Omega (LoL) : joueurs 10 à 14
(10, 2), (11, 2), (12, 2), (13, 2), (14, 2),
-- RocketDuo A : joueurs 5 et 6
(5, 3), (6, 3),
-- RocketDuo B : joueurs 7 et 8
(7, 4), (8, 4);

-- Participations équipe (tournois terminés)
INSERT INTO participer_equipe (id_tournoi, id_equipe, score, rang) VALUES
(1, 1, 350, 1),  -- Team Alpha 1er LoL
(1, 2, 210, 2),  -- Team Omega 2ème LoL
(3, 3, 180, 1),  -- RocketDuo A 1er Rocket League
(3, 4, 120, 2);  -- RocketDuo B 2ème Rocket League

-- Participations solo (Valorant - tournoi terminé)
INSERT INTO participer_solo (id_tournoi, id_utilisateur, score, rang) VALUES
(2, 5,  420, 1),
(2, 6,  380, 2),
(2, 7,  310, 3),
(2, 8,  290, 4),
(2, 9,  250, 5),
(2, 10, 230, 6),
(2, 11, 190, 7),
(2, 12, 150, 8);

-- Participations solo (CS2 et FIFA - à venir, score et rang non définis)
INSERT INTO participer_solo (id_tournoi, id_utilisateur) VALUES
(4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10),
(5, 5), (5, 7), (5, 9), (5, 11), (5, 13);

-- Récompenses obtenues (tournois terminés)
INSERT INTO obtenir (id_utilisateur, ID_recompense) VALUES
-- LoL : Team Alpha gagne (5 joueurs partagent la récompense 1er)
(5,  1), (6,  1), (7,  1), (8,  1), (9,  1),
-- LoL : Team Omega 2ème
(10, 2), (11, 2), (12, 2), (13, 2), (14, 2),
-- Valorant solo
(5,  4),  -- 1er
(6,  5),  -- 2ème
-- Rocket League : RocketDuo A 1er
(5,  6), (6,  6),
-- Rocket League : RocketDuo B 2ème
(7,  7), (8,  7);

-- Annonces (liées aux tournois à venir)
INSERT INTO annonce (titre, contenu, lien_inscription, date_tournoi, lien_image, id_tournoi, id_utilisateur) VALUES
(
  'CS2 Summer Showdown — Inscriptions ouvertes !',
  'Le tournoi CS2 Summer Showdown aura lieu le 12 juillet 2026 à 20h en ligne. Format Best Of 3. Cashprize total : 75€. Places limitées à 16 joueurs.',
  'https://forms.sqleague.fr/cs2-summer-2026',
  '2026-07-12',
  '/images/cs2_summer.jpg',
  4,
  3
),
(
  'FIFA 25 Cup — Rendez-vous le 25 août !',
  'Venez défier les meilleurs joueurs FIFA du campus ! Tournoi solo Best Of 1, le 25 août 2026 à 19h en Amphi Turing. Cashprize : 60€.',
  'https://forms.sqleague.fr/fifa25-cup-2026',
  '2026-08-25',
  '/images/fifa25_cup.jpg',
  5,
  3
);

-- Articles (actualités générales)
INSERT INTO article (titre, contenu, date_publication, lien_image, id_utilisateur) VALUES
(
  'Retour sur la LoL Winter Cup',
  'La Team Alpha a dominé la compétition du début à la fin, s''imposant face à la Team Omega en grande finale. Bravo à tous les participants pour leur fair-play !',
  '2026-01-16',
  '/images/lol_winter_recap.jpg',
  1
),
(
  'ShadowBlade remporte le Valorant Spring Open',
  'Après une série de matchs intenses, ShadowBlade (Inès Moreau) s''est imposée comme la meilleure joueuse du tournoi avec 420 points. Félicitations !',
  '2026-03-21',
  '/images/valorant_spring_recap.jpg',
  1
),
(
  'Rocket League Clash : RocketDuo A champions !',
  'Le duo ShadowBlade / PixelKnight a remporté le Rocket League Clash avec une belle performance en finale. Le prochain tournoi approche, restez connectés !',
  '2026-05-11',
  '/images/rl_clash_recap.jpg',
  1
);
