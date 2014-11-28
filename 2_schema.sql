-- Author Schmidiger, Kevin and Kaya, Oezhan

\echo Start creating Tables

CREATE TYPE ModulKategorie AS ENUM ('Easy' ,'Basic', 'Advanced', 'Expert');

CREATE TABLE Person(
	PersonID SERIAL PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	Nachname VARCHAR(20) NOT NULL, 
	Alter INTEGER NOT NULL CHECK (Alter >= 0),
	Wohnort VARCHAR(30) NOT NULL,
	Adresse VARCHAR(40) NOT NULL,
	Single BOOLEAN NOT NULL
);

CREATE TABLE Student (
	Matrikelnummer INTEGER PRIMARY KEY CHECK (Matrikelnummer >= 2000),
	PersonID INTEGER NOT NULL,
	Fachrichtung VARCHAR(30) NOT NULL
);

CREATE TABLE BesuchteModule(
	Student INTEGER NOT NULL,
	Modul INTEGER NOT NULL,
	PRIMARY KEY (Student, Modul)
);

CREATE TABLE Fachrichtung (
	Fachrichtung VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Dozent (
	AngestelltenNr INTEGER PRIMARY KEY, 
	PersonID INTEGER NOT NULL
);

CREATE TABLE Qualifikation (
	QualiID INTEGER PRIMARY KEY,
	Bezeichnung VARCHAR(30) NOT NULL 
);

CREATE TABLE DozentToQualifikation (
	Dozent INTEGER NOT NULL,
	Qualifikation INTEGER NOT NULL,
	PRIMARY KEY (Dozent, Qualifikation)
);

CREATE TABLE Raum (
	Nummer INTEGER PRIMARY KEY,
	AnzahlSitzplaetze INTEGER NOT NULL
);

CREATE TABLE Durchfuehrung (
	DurchfuehrungsID INTEGER PRIMARY KEY,
	Startpunkt DATE NOT NULL,
	Endpunkt DATE NOT NULL,
	RaumNr INTEGER NOT NULL,
	ModulID INTEGER NOT NULL,
	BenoetigteQuali INTEGER
);

CREATE TABLE DurchfuehrungToStudent(
	Durchfuehrung INTEGER NOT NULL,
	Student INTEGER NOT NULL,
	PRIMARY KEY (Durchfuehrung, Student)
);

CREATE TABLE Modul (
	ModulID INTEGER PRIMARY KEY,
	Name VARCHAR(30),
	BenoetigtesModul INTEGER,
	ECTSPunkte INTEGER NOT NULL,
	Kategorie ModulKategorie NOT NULL,
	Beschreibung TEXT NOT NULL,
	Fachrichtung VARCHAR(30) NOT NULL
);

\echo Tables successfully created!