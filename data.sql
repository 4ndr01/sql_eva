

use Bus;

-- Supprime toutes les lignes de la table Arrets
DELETE FROM Arrets;

-- Supprime toutes les lignes de la table Horaires
DELETE FROM Horaires;

-- Supprime toutes les lignes de la table Ligne
DELETE FROM Ligne;

-- Supprime toutes les lignes de la table Direction
DELETE FROM Direction;

-- Supprime toutes les lignes de la table Arrets_horaires
DELETE FROM Arrets_horaires;

-- Supprime toutes les lignes de la table Ligne_direction
DELETE FROM Ligne_direction;

-- Supprime toutes les lignes de la table Ligne_Arret
DELETE FROM Ligne_Arret;

-- Supprime toutes les lignes de la table Arrets_Direction
DELETE FROM Arrets_Direction;

-- Insère des enregistrements dans la table Arrets avec leur ID et nom
INSERT INTO Arrets (ID_Arret, arret_name) VALUES (1, 'P+R Ouest'), (2, 'Fourchène1'), (3, 'Madeleine'), (4, 'République'), (5, 'Pibs2'), (6, 'Petit Tohannic'), (7, 'Delestraint'), (8, 'Kersec');

-- Insère des enregistrements dans la table Horaires avec leur ID et heure
INSERT INTO Horaires (ID_Horaire, hour_Horaires) VALUES
                                                     (1, '6:32:00'), (2, '6:42:00'), (3, '6:52:00'), (4, '7:00:00'), (5, '7:10:00'), (6, '6:34:00'), (7, '6:44:00'), (8, '6:54:00'), (9, '7:02:00'), (10, '7:12:00'),
                                                     (11, '6:37:00'), (12, '6:47:00'), (13, '6:57:00'), (14, '7:06:00'), (15, '7:16:00'), (16, '7:22:00'), (17, '7:07:00'), (18, '7:17:00'), (19, '6:46:00'), (20, '6:56:00'),
                                                     (21, '7:27:00'), (22, '6:50:00'), (23, '7:11:00'), (24, '7:21:00'), (25, '7:31:00'), (26, '6:51:00'), (27, '7:01:00'), (28, '7:32:00'), (29, '6:55:00'), (30, '7:05:00'),
                                                     (31, '7:26:00'), (32, '7:36:00');

-- Insère des enregistrements dans la table Ligne avec leur ID et nom
INSERT INTO Ligne (ID_Ligne, ligne_name) VALUES (1, 'Ligne 2');

-- Insère des enregistrements dans la table Direction avec leur ID et nom
INSERT INTO Direction (ID_direction, direction_name) VALUES (1, 'Direction Kersec'), (2, 'Direction P+R Ouest');

-- Insère des associations entre les arrêts et les horaires
INSERT INTO Arrets_horaires (ID_Arret, ID_Horaire) VALUES (3,11), (3,12), (3,13), (3,14), (3,15), (4,2), (4,3), (4,9), (4,10), (4,16);

-- Insère des associations entre les arrêts et les directions avec l'ordre
INSERT INTO Arrets_Direction (ID_Arret, ID_direction, order_in_direction) VALUES (1,1,1), (2,1,2), (3,1,3), (4,1,4), (5,1,5), (6,1,6), (7,1,7), (8,1,8), (8,2,1), (7,2,2), (6,2,3), (5,2,4), (4,2,5), (3,2,6), (2,2,7), (1,2,8);


