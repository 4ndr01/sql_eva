use Bus;



-- Sélectionne les horaires de l'arrêt 'Madeleine' pour le lundi
SELECT Horaires.hour_Horaires AS "Horaires arrêt Madeleine (Lundi)"
FROM Arrets
         JOIN Arrets_horaires ON Arrets.ID_Arret = Arrets_horaires.ID_Arret
         JOIN Horaires ON Arrets_horaires.ID_Horaire = Horaires.ID_Horaire
WHERE Arrets.arret_name = 'Madeleine';

-- Sélectionne les horaires de l'arrêt 'République' pour le lundi
SELECT Horaires.hour_Horaires AS "Horaires arrêt République (Lundi)"
FROM Arrets
         JOIN Arrets_horaires ON Arrets.ID_Arret = Arrets_horaires.ID_Arret
         JOIN Horaires ON Arrets_horaires.ID_Horaire = Horaires.ID_Horaire
WHERE Arrets.arret_name = 'République';

-- Sélectionne les arrêts de la ligne 2 en direction de 'Kersec'
SELECT Arrets.arret_name AS "Parcours  ligne 2 Direction Kersec"
FROM Arrets
         JOIN Arrets_Direction ON Arrets.ID_Arret = Arrets_Direction.ID_Arret
         JOIN Direction ON Arrets_Direction.ID_direction = Direction.ID_direction
WHERE Direction.direction_name = 'Direction Kersec'
ORDER BY Arrets_Direction.order_in_direction;

-- Exercice 4, 5 : Sélectionne les horaires de l'arrêt 'Petit Tohannic' pour le lundi, en tenant compte des redirections temporaires
SELECT
    CASE
        WHEN Arrets.arret_name = 'Petit Tohannic' THEN CONCAT('L\'arrêt n\'est pas desservi. Veuillez vous reporter à "', Arret_Redirection.arret_name, '".')
        ELSE Horaires.hour_Horaires
        END AS "Horaires à l'arrêt Petit Tohannic (Lundi)"
FROM
    Arrets
        LEFT JOIN Redirections ON Arrets.ID_Arret = Redirections.ID_Arret_Non_Desservi
        LEFT JOIN Arrets AS Arret_Redirection ON Redirections.ID_Arret_Redirection = Arret_Redirection.ID_Arret
        LEFT JOIN Arrets_horaires ON Arrets.ID_Arret = Arrets_horaires.ID_Arret
        LEFT JOIN Horaires ON Arrets_horaires.ID_Horaire = Horaires.ID_Horaire
WHERE
    Arrets.arret_name = 'Petit Tohannic';


-- Exercice 6, 7 : Sélectionne les arrêts desservis par la ligne 2 dans chaque direction
SELECT
    CONCAT('Ligne 2', ' ', Direction.direction_name) AS Ligne,
    GROUP_CONCAT(Arrets.arret_name ORDER BY Arrets_Direction.order_in_direction SEPARATOR ',') AS "Arrêts desservis"
FROM
    Direction
        LEFT JOIN
    Arrets_Direction ON Direction.ID_direction = Arrets_Direction.ID_direction
        LEFT JOIN
    Arrets ON Arrets_Direction.ID_Arret = Arrets.ID_Arret
GROUP BY
    Direction.ID_direction, Direction.direction_name;

-- Appel de la procédure stockée pour insérer des horaires dans la table 'schedule'
CALL insert_schedule('06:32', '06:41', '00:01');

-- Sélectionne les horaires de la table 'schedule' après l'appel de la procédure stockée
SELECT horaires FROM schedule; -- Cette ligne est commentée
