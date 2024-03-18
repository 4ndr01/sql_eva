create table Cinema.Séance
(
    Séance_ID int            not null
        primary key,
    Film_ID   int            null,
    Salle_ID  int            null,
    DateHeure datetime       null,
    Prix      decimal(10, 2) null,
    constraint séance_ibfk_1
        foreign key (Film_ID) references cinema.Film (Film_ID),
    constraint séance_ibfk_2
        foreign key (Salle_ID) references cinema.Salle (Salle_ID)
)
    engine = InnoDB;

create index Film_ID
    on Cinema.Séance (Film_ID);

create index Salle_ID
    on Cinema.Séance (Salle_ID);

