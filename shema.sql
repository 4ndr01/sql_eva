USE Bus;

-- Table pour les bus
CREATE TABLE Bus (
                     ID_Bus INT PRIMARY KEY
);

-- Table pour les arrêts
CREATE TABLE Arret (
                       ID_Arret INT PRIMARY KEY,
                       Nom_Arret VARCHAR(50) -- Supposons que les noms d'arrêts peuvent être jusqu'à 50 caractères
);

-- Table pour les horaires
CREATE TABLE Horaire (
                         ID_Horaire INT PRIMARY KEY,
                         Heure TIME -- Stocker l'heure sous forme de temps
);

-- Table pour les passages
CREATE TABLE Passage (
                         ID_Passage INT PRIMARY KEY,
                         Lieu INT,
                         Heure TIME,
                         Bus INT,
                         FOREIGN KEY (Lieu) REFERENCES Arret(ID_Arret),
                         FOREIGN KEY (Heure) REFERENCES Horaire(ID_Horaire),
                         FOREIGN KEY (Bus) REFERENCES Bus(ID_Bus)
);


-- Ajout d'une nouvelle table pour gérer les arrêts non desservis temporairement
CREATE TABLE ArretNonDesservi (
                                  ID_ArretNonDesservi INT AUTO_INCREMENT PRIMARY KEY,
                                  ArretDesservi INT, -- L'arrêt à rediriger
                                  ArretProche INT, -- L'arrêt le plus proche
                                  DebutDate DATE,
                                  FinDate DATE
);
