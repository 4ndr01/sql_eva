create table Cinema.Salle
(
    Salle_ID int         not null
        primary key,
    Numéro   int         null,
    Capacité int         null,
    Type     varchar(50) null
)
    engine = InnoDB;

