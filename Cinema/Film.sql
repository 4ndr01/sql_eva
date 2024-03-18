create table Cinema.Film
(
    Film_ID     int          not null
        primary key,
    Titre       varchar(255) null,
    Genre       varchar(100) null,
    Durée       int          null,
    Réalisateur varchar(255) null,
    Acteurs     varchar(255) null
)
    engine = InnoDB;

