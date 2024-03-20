use Bus;

SELECT Horaire.Heure
FROM Passage
         JOIN Horaire ON Passage.Heure = Horaire.ID_Horaire
WHERE Passage.Lieu = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Madeleine')
ORDER BY Horaire.Heure;


SELECT Horaire.Heure
FROM Passage
         JOIN Horaire ON Passage.Heure = Horaire.ID_Horaire
WHERE Passage.Lieu = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Republique')
ORDER BY Horaire.Heure;

# afficher le parcours complet de la ligne 2:

-- Désactiver ONLY_FULL_GROUP_BY
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Afficher le parcours complet de la ligne 2 Direction Kersec
SELECT Nom_Arret AS 'Parcours de la ligne 2 Direction Kersec'
FROM Passage
         JOIN Arret ON Passage.Lieu = Arret.ID_Arret
WHERE Passage.Bus IN (SELECT ID_Bus FROM Bus WHERE ID_Bus = 8) -- Bus direction Kersec
ORDER BY Passage.ID_Passage;


-- Mettre à jour l'arrêt Petit Tohannic pour indiquer qu'il n'est pas temporairement desservi
UPDATE ArretNonDesservi
SET ArretDesservi = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Petit Tohannic'),
    ArretProche = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Delestraint'),
    DebutDate = '2024-03-20', -- Date de début des travaux
    FinDate = '2024-03-31' -- Date de fin des travaux
WHERE ArretDesservi = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Petit Tohannic');


-- 5. Afficher le message "Arrêt temporairement non desservi." à la place des horaires pour l'arrêt Petit Tohannic
SELECT
    CASE
        WHEN (SELECT COUNT(*) FROM ArretNonDesservi WHERE ArretDesservi = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Petit Tohannic') AND DebutDate <= CURDATE() AND FinDate >= CURDATE()) > 0 THEN 'L''arrêt n''est pas desservi. Veuillez vous reporter à l''arrêt ' || (SELECT Nom_Arret FROM Arret WHERE ID_Arret = (SELECT ArretProche FROM ArretNonDesservi WHERE ArretDesservi = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Petit Tohannic') AND DebutDate <= CURDATE() AND FinDate >= CURDATE()))
        ELSE Horaire.Heure -- Préciser la table Horaire pour la colonne Heure
        END AS Horaire
FROM
    Passage
        JOIN
    Horaire ON Passage.Heure = Horaire.ID_Horaire
WHERE
    Lieu = (SELECT ID_Arret FROM Arret WHERE Nom_Arret = 'Petit Tohannic');

#.7
SELECT
    CONCAT('2 Direction Kersec') AS Ligne,
    GROUP_CONCAT(
            CASE
                WHEN (SELECT COUNT(*) FROM ArretNonDesservi WHERE ArretDesservi = a.ID_Arret AND CURDATE() BETWEEN DebutDate AND FinDate) > 0
                    THEN CONCAT(a.Nom_Arret, ' (Arrêt temporairement non desservi)')
                ELSE a.Nom_Arret
                END
            ORDER BY p.ID_Passage
    ) AS 'Arrêts desservis'
FROM
    Passage p
        JOIN
    Arret a ON p.Lieu = a.ID_Arret
WHERE
    p.Bus = 1
GROUP BY
    p.Bus

UNION

SELECT
    CONCAT('2 Direction P+R Ouest') AS Ligne,
    GROUP_CONCAT(
            CASE
                WHEN (SELECT COUNT(*) FROM ArretNonDesservi WHERE ArretDesservi = a.ID_Arret AND CURDATE() BETWEEN DebutDate AND FinDate) > 0
                    THEN CONCAT(a.Nom_Arret, ' (Arrêt temporairement non desservi)')
                ELSE a.Nom_Arret
                END
            ORDER BY p.ID_Passage DESC
    ) AS 'Arrêts desservis'
FROM
    Passage p
        JOIN
    Arret a ON p.Lieu = a.ID_Arret
WHERE
    p.Bus = 9
GROUP BY
    p.Bus;



