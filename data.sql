use Bus;

-- Supprimer les anciennes données
DELETE FROM Passage;
DELETE FROM Horaire;
DELETE FROM Arret;
DELETE FROM Bus;

-- Insérer les données pour les arrêts principaux de la ligne 2 pour les jours de semaine
-- Ajouter les bus

INSERT INTO Bus (ID_Bus) VALUES (10);

SELECT ID_Bus FROM Bus;


-- Ajouter les arrêts
INSERT INTO Arret (ID_Arret, Nom_Arret) VALUES
                                            (1, 'P+R Ouest'),
                                            (2, 'Fourchêne'),
                                            (3, 'Madeleine'),
                                            (4, 'République'),
                                            (5, 'PIBS 2'),
                                            (6, 'Petit Tohannic'),
                                            (7, 'Delestraint'),
                                            (8, 'Kersec');

-- Ajouter les horaires
INSERT INTO Horaire (ID_Horaire, Heure) VALUES
                                            (1, '06:32'), (2, '06:34'), (3, '06:37'), (4, '06:42'),
                                            (5, '06:46'), (6, '06:50'), (7, '06:51'), (8, '06:55'),
                                            (9, '06:42'), (10, '06:44'), (11, '06:47'), (12, '06:52'),
                                            (13, '06:56'), (14, '07:00'), (15, '07:01'), (16, '07:05'),
                                            (17, '06:52'), (18, '06:54'), (19, '06:57'), (20, '07:02'),
                                            (21, '07:07'), (22, '07:11'), (23, '07:12'), (24, '07:16'),
                                            (25, '07:02'), (26, '07:00'), (27, '07:06'), (28, '07:12'),
                                            (29, '07:17'), (30, '07:21'), (31, '07:22'), (32, '07:26'),
                                            (33, '07:10'), (34, '07:12'), (35, '07:16'), (36, '07:22'),
                                            (37, '07:27'), (38, '07:31'), (39, '07:32'), (40, '07:36');

-- Ajouter les passages
INSERT INTO Passage (Lieu, Heure, Bus)
SELECT Lieu, Heure, 9 -- Remplacez 9 par l'ID du bus pour l'autre direction
FROM Passage
WHERE Bus = 1 -- ID du bus pour l'autre direction
ORDER BY ID_Passage;

-- 6. Insérer un nouveau bus pour la direction opposée (Direction P+R Ouest)
INSERT INTO Bus (ID_Bus) VALUES (9);

-- Insérer les passages pour ce bus, en utilisant les mêmes horaires que pour l'autre direction (premier trajet de la journée)
INSERT INTO Passage (Lieu, Heure, Bus)
SELECT Lieu, Heure, 9
FROM Passage
WHERE Bus = 1
ORDER BY ID_Passage;

-- Déterminer les arrêts desservis par la ligne 2 dans la direction opposée
SELECT Nom_Arret
FROM Arret
WHERE ID_Arret IN (SELECT Lieu FROM Passage WHERE Bus = 9)
ORDER BY ID_Arret;
