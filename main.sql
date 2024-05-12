-- DROP DATABASE KINO;
-- CREATE DATABASE KINO;

USE KINO;

IF OBJECT_ID('ZarezerwowaneMiejsca', 'U') IS NOT NULL DROP TABLE ZarezerwowaneMiejsca;
IF OBJECT_ID('Bilety', 'U') IS NOT NULL DROP TABLE Bilety;
IF OBJECT_ID('Seanse', 'U') IS NOT NULL DROP TABLE Seanse;
IF OBJECT_ID('Filmy', 'U') IS NOT NULL DROP TABLE Filmy;
IF OBJECT_ID('Miejsca', 'U') IS NOT NULL DROP TABLE Miejsca;
IF OBJECT_ID('Sale', 'U') IS NOT NULL DROP TABLE Sale;
IF OBJECT_ID('Klienci', 'U') IS NOT NULL DROP TABLE Klienci;
IF OBJECT_ID('Recenzje ', 'U') IS NOT NULL DROP TABLE Sale;
IF OBJECT_ID('Kategorie ', 'U') IS NOT NULL DROP TABLE Sale;
IF OBJECT_ID('Filmy_Kategorie ', 'U') IS NOT NULL DROP TABLE Sale;

-- Klienci
CREATE TABLE Klienci (
    KlientID INT IDENTITY(1,1) PRIMARY KEY,
    Imie VARCHAR(255),
    Nazwisko VARCHAR(255) NOT NULL,
    DataUrodzenia DATE
);

-- Sale
CREATE TABLE Sale (
    SalaID INT IDENTITY(1,1) PRIMARY KEY,
    NazwaSali VARCHAR(255) NOT NULL,
    LiczbaMiejsc INT NOT NULL
);

-- Filmy
CREATE TABLE Filmy (
    FilmID INT IDENTITY(1,1) PRIMARY KEY,
    Tytul VARCHAR(255) NOT NULL,
    Rezyser VARCHAR(255) NOT NULL,
    RokWydania VARCHAR(4)
);

-- Seanse
CREATE TABLE Seanse (
    SeansID INT IDENTITY(1,1) PRIMARY KEY,
    Film INT NOT NULL,
    Sala INT NOT NULL,
    Data DATE NOT NULL,
    FOREIGN KEY (Film) REFERENCES Filmy(FilmID), 
    FOREIGN KEY (Sala) REFERENCES Sale(SalaID)
);

-- Miejsca table
CREATE TABLE Miejsca (
    MiejsceID INT IDENTITY(1,1) PRIMARY KEY,
    Sala INT,
    Rzad INT,
    Fotel INT,
    FOREIGN KEY (Sala) REFERENCES Sale(SalaID)
);

-- Bilety (zmiana z Rezerwacje)
CREATE TABLE Bilety (
    BiletID INT IDENTITY(1,1) PRIMARY KEY,
    Klient INT NOT NULL,
    Seans INT NOT NULL,
    Miejsce INT NOT NULL,
    Cena INT NOT NULL,
    FOREIGN KEY (Klient) REFERENCES Klienci(KlientID),
    FOREIGN KEY (Seans) REFERENCES Seanse(SeansID),
    FOREIGN KEY (Miejsce) REFERENCES Miejsca(MiejsceID)
);

CREATE TABLE ZarezerwowaneMiejsca (
    ZarezerwowaneMiejsceID INT IDENTITY(1,1) PRIMARY KEY,
    Bilet INT,
    Siedzenie INT,
    FOREIGN KEY (Bilet) REFERENCES Bilety(BiletID),
    FOREIGN KEY (Siedzenie) REFERENCES Miejsca(MiejsceID)
);

CREATE TABLE Recenzje (
    RecenzjaID INT IDENTITY(1,1) PRIMARY KEY,
    Film INT NOT NULL,
    Ocena INT NOT NULL,
    Opinia VARCHAR(1000),
    DataRecenzji DATE,
    FOREIGN KEY (Film) REFERENCES Filmy(FilmID)
);

CREATE TABLE Kategorie (
    KategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NazwaKategorii VARCHAR(255) NOT NULL,
    Opis VARCHAR(1000)
);

CREATE TABLE Filmy_Kategorie (
    Film INT,
    Kategoria INT,
    PRIMARY KEY (Film, Kategoria),
    FOREIGN KEY (Film) REFERENCES Filmy(FilmID),
    FOREIGN KEY (Kategoria) REFERENCES Kategorie(KategoriaID)
);
