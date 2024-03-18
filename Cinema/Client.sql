create table Cinema.Client
(
    Client_ID int          not null
        primary key,
    Nom       varchar(100) null,
    Prénom    varchar(100) null,
    Adresse   varchar(255) null,
    Téléphone varchar(20)  null,
    Email     varchar(100) null
)
    engine = InnoDB;

