create table Cinema.Billet
(
    Billet_ID int            not null
        primary key,
    Séance_ID int            null,
    Client_ID int            null,
    Quantité  int            null,
    PrixTotal decimal(10, 2) null,
    constraint billet_ibfk_1
        foreign key (Séance_ID) references cinema.Séance (Séance_ID),
    constraint billet_ibfk_2
        foreign key (Client_ID) references cinema.Client (Client_ID)
)
    engine = InnoDB;

create index Client_ID
    on Cinema.Billet (Client_ID);

create index Séance_ID
    on Cinema.Billet (Séance_ID);

