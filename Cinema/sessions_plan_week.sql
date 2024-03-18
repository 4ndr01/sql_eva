create definer = root@localhost view Cinema.sessions_plan_week as
select `cinema`.`séance`.`Séance_ID` AS `Séance_ID`,
       `cinema`.`séance`.`Film_ID`   AS `Film_ID`,
       `cinema`.`séance`.`Salle_ID`  AS `Salle_ID`,
       `cinema`.`séance`.`DateHeure` AS `DateHeure`,
       `cinema`.`séance`.`Prix`      AS `Prix`
from `cinema`.`séance`
where (dayofweek(`cinema`.`séance`.`DateHeure`) between 2 and 6);

