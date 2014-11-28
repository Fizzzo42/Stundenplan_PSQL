-- Author Schmidiger, Kevin and Kaya, Oezhan

\echo Start filling tables with data

-- Table Person 
-- using Primary keys, which starts with 1
-- Dozents
\echo Filling table Person with Dozents, which are Persons

INSERT INTO Person (Name, Nachname, Alter, Wohnort, Adresse, Single) VALUES
('Daniel', 'Keller', 36, 'Rapperswil', 'Oberseestrasse 10', FALSE),
('Urs', 'Meier', 32, 'Affoltern', 'Seestrasse 123', FALSE),
('Hans', 'Keller', 46, 'Seebach', 'Hall of Fame Strassse 1', FALSE),
('Fabian', 'Aeschbacher', 33, 'Rapperswil', 'Zuercherstrasse 54', FALSE),
('Miroslav', 'Popovic', 50, 'Elgg', 'Bergstrasse 13', TRUE),
('Peter', 'Fischer', 39, 'Rapperswil', 'Urnerstrasse 66', FALSE),
('Victor', 'Giacobbo', 56, 'Winterthur', 'Giacobbo und Mueller Strasse 133', FALSE);

\echo Done filling in Dozents

SELECT setval('Person_PersonID_seq', 9);

-- Students
\echo Filling table Person with Students, which are Persons

INSERT INTO Person (Name, Nachname, Alter, Wohnort, Adresse, Single) VALUES
('Werner', 'Cheung', 22, 'Kloten', 'Klotenstrasse 30', TRUE),
('Michelle', 'Gomez', 21, 'California', 'Broadway Strassse 55', TRUE),
('Selina', 'Smith', 18, 'Elgg', 'Lagerstrasse 365', FALSE),
('Seline', 'Ott', 19, 'Rapperswil', 'Studentenstrasse 666', TRUE),
('Danillo', 'Genius', 22, 'Rapperswil', 'Geniusstrasse 145', TRUE),
('Royce', 'Immerschlaefer', 21, 'Weitweg', 'Alwayssleepstreet 431', TRUE),
('Berivan', 'Temizoy', 23, 'Winterthur', 'ZHAWstrasse 166', FALSE);

\echo Done filling in Students

-- Table Student
-- using primary keys, which starts with 2
\echo Filling table Student

INSERT INTO Student (Matrikelnummer, PersonID, Fachrichtung) VALUES
(2001, 10, 'Informatik'),
(2002, 11, 'Maschienenbau'),
(2003, 12, 'Landschaftsarchitektur'),
(2004, 13, 'Informatik'),
(2005, 14, 'Informatik'),
(2006, 15, 'Informatik'),
(2007, 16, 'Maschienenbau');

\echo Done filling table Student

-- Table Besuchte Module
\echo Filling table BesuchteModule

INSERT INTO BesuchteModule (Student, Modul) VALUES
(2004, 7001),
(2004, 7002),
(2004, 7004),
(2004, 7006),
(2002, 7009),
(2002, 7010),
(2003, 7009),
(2007, 7008);

\echo Done filling table BesuchteModule

-- Table Fachrichtung
\echo Filling table Fachrichtung

INSERT INTO Fachrichtung (Fachrichtung) VALUES
('Informatik'),
('Maschienenbau'),
('Landschaftsarchitektur'),
('Maschienenbau Innovation'),
('Raumplanung'),
('Architektur'),
('Geniositaet');

\echo Done filling table Fachrichtung

-- Table Dozent
-- using primary keys, which starts with 3
\echo Filling table Dozent

INSERT INTO Dozent (AngestelltenNr, PersonID) VALUES
(3001, 1),
(3002, 2),
(3003, 3),
(3004, 4),
(3005, 5),
(3006, 6),
(3007, 7);

\echo Done filling table Dozent

-- Table DozentToQualifikation
\echo Filling table DozentToQualifikation

INSERT INTO DozentToQualifikation (Dozent, Qualifikation) VALUES
(3001, 4001),
(3001, 4007),
(3001, 4008),
(3001, 4003),
(3001, 4005),
(3002, 4002),
(3002, 4010),
(3003, 4004),
(3004, 4006),
(3004, 4009),
(3005, 4002),
(3005, 4010),
(3005, 4006),
(3005, 4009),
(3006, 4003),
(3006, 4004),
(3006, 4006),
(3007, 4007),
(3007, 4008),
(3007, 4003);

\echo Done filling table DozentToQualifikation

-- Table Qualifikation
-- using primary keys, which starts with 4
\echo Filling table Qualifikation

INSERT INTO Qualifikation (QualiID, Bezeichnung) VALUES
(4001, 'User Interfaces 1'),
(4002, 'Analysis 1'),
(4003, 'Programmieren 3'),
(4004, 'Innovation'),
(4005, 'Datenbanken'),
(4006, 'Physik 1'),
(4007, 'Programmieren 1'),
(4008, 'Programmieren 2'),
(4009, 'Physik 2'),
(4010, 'Analysis 2'),
(4011, 'Geniositaet');

\echo Done filling table Qualifikation


-- Table Raum
-- using primary keys, which starts with 5
\echo Filling table Raum

INSERT INTO Raum (Nummer, AnzahlSitzplaetze) VALUES
(5001, 100),
(5002, 50),
(5003, 70),
(5004, 100),
(5005, 150),
(5006, 25),
(5007, 25),
(5008, 25),
(5009, 20),
(5010, 80),
(5011, 30);

\echo Done filling table Raum

-- Table Durchfuehrung
-- using primary keys, which starts with 6
\echo Filling table Durchfuehrung

INSERT INTO Durchfuehrung (DurchfuehrungsID, Startpunkt, Endpunkt, RaumNr, ModulID, BenoetigteQuali) VALUES
(6001, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5001, 7001, 4007),
(6002, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5002, 7002, 4008),
(6003, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5003, 7003, 4003),
(6004, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5004, 7004, 4002),
(6005, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5005, 7005, 4010),
(6006, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5006, 7006, 4006),
(6007, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5007, 7007, 4009),
(6008, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5008, 7008, 4005),
(6009, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5009, 7009, 4004),
(6010, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5010, 7010, 4001),
(6011, to_date('2014-01-01', 'YYYY-MM-DD'), to_date('2014-12-31', 'YYYY-MM-DD'), 5011, 7011, 4011);

\echo Done filling table Durchfuehrung

--Table DurchfuehrungToStudent
\echo Filling table DurchfuehrungToStudent

INSERT INTO DurchfuehrungToStudent (Durchfuehrung, Student) VALUES
(6001, 2001),
(6001, 2003),
(6001, 2005),
(6003, 2004),
(6004, 2001),
(6004, 2003),
(6004, 2005),
(6005, 2004),
(6007, 2004),
(6008, 2001),
(6008, 2003),
(6008, 2004),
(6008, 2005),
(6009, 2007),
(6011, 2004);

\echo Done filling table DurchfuehrungToStudent

-- Table Modul
-- using primary keys which starts with 7
\echo Filling table Modul

INSERT INTO Modul (ModulID, Name , BenoetigtesModul, ECTSPunkte, Kategorie, Beschreibung, Fachrichtung) VALUES
(7001, 'Programmieren 1', NULL, 6, 'Easy', 'Man lernt Java', 'Informatik'),
(7002, 'Programmieren 2', 7001, 8, 'Basic', 'Man lernt Algorithmen und Datenstrukturen', 'Informatik'),
(7003, 'Programmieren 3', 7002, 6, 'Expert', 'Man lernt C++11', 'Informatik'),
(7004, 'Analysis 1', NULL, 4, 'Basic', 'Man lernt Analysis 1', 'Mathematik'),
(7005, 'Analysis 2', 7004, 4, 'Advanced', 'Man lernt Analysis 2', 'Mathematik'),
(7006, 'Physik 1', 7005, 4, 'Basic', 'Men lernt Mechanik', 'Naturwissenschaft'),
(7007, 'Physik 2', 7006, 4, 'Advanced', 'Man lernt Fluide', 'Naturwissenschaft'),
(7008, 'Datenbanken', NULL, 4, 'Advanced', 'Man lernt Datenbanken aufabuen', 'Informatik'),
(7009, 'Innovation', NULL, 4, 'Basic', 'Man lernt innovieren', 'Maschienenbau'),
(7010, 'User Interfaces 1', NULL, 4, 'Advanced', 'Man lernt User Interfaces', 'Informatik'),
(7011, 'Geniositaet', NULL, 180, 'Expert', 'Man lernt Fluide', 'Geniositaet');

\echo Done filling table Modul

\echo Tables succsessfuly filled with data!

-- Testat 4:
-- Aufgabe 1.3 Testing

-- Enum Test:
--		INSERT INTO Modul (ModulID, Name , BenoetigtesModul, ECTSPunkte, Kategorie, Beschreibung, Fachrichtung) VALUES
--		(7012, 'Internet Technologien', NULL, 4, 'Sehr Schwer', 'Man programmiert Reddit 2 Mal', 'Informatik');

-- Output:
-- 		ERROR:  invalid input value for enum modulkategorie: "Sehr Schwer"
-- 		LINE 2: (7012, 'Internet Technologien', NULL, 4, 'Sehr Schwer', 'Man...


-- Boolean Test:
--		INSERT INTO Person (Name, Nachname, Alter, Wohnort, Adresse, Single) VALUES
--		('Siri', 'Alleswisser', 23, 'Cupertino', '1 Infinite Loop', 'WeDontKnow');

-- Output:
--		ERROR:  invalid input syntax for type boolean: "WeDontKnow"
--		LINE 2: ...Alleswisser', 23, 'Cupertino', '1 Infinite Loop', 'WeDontKno...


-- Aufgabe 2 - Constraint mit CHECK (statisch)
-- 2.2: Fehlerfall (Korrektfall sind bereits genügend vorhanden)

-- Alter >= 0 Test:
--		INSERT INTO Person (Name, Nachname, Alter, Wohnort, Adresse, Single) VALUES
--		('Kiddie', 'Neugeboren', -1, 'Irgendwo', 'Nirgendwo -1', TRUE);

-- Output:
--		ERROR:  new row for relation "person" violates check constraint "person_alter_check"
--		DETAIL:  Failing row contains (17, Kiddie, Neugeboren, -1, Irgendwo, Nirgendwo -1, t).

-- Matrikelnummer >= 2000 Test:
--		INSERT INTO Student (Matrikelnummer, PersonID, Fachrichtung) VALUES
--		(573, 17, 'Maschienenbau');

-- Output:
--		ERROR:  new row for relation "student" violates check constraint "student_matrikelnummer_check"
--		DETAIL:  Failing row contains (573, 17, Maschienenbau).
