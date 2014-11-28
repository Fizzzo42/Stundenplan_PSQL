-- Author Schmidiger, Kevin and Kaya, Oezhan

\echo Start setting the constraints

-- Constraits for Students
\echo Setting constraints for table Student
ALTER TABLE Student
ADD CONSTRAINT fk_StudentPerson
	FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
;

ALTER TABLE Student
ADD CONSTRAINT fk_StudentFachrichtung
	FOREIGN KEY (Fachrichtung) REFERENCES Fachrichtung (Fachrichtung)
;
\echo Done setting constraints for Student

-- Constraits for table BesuchteModule
\echo Setting constraints for table BesuchteModule
ALTER TABLE BesuchteModule
ADD CONSTRAINT fk_BesuchteModuleStudent
	FOREIGN KEY (Student) REFERENCES Student (Matrikelnummer)
;

ALTER TABLE BesuchteModule
ADD CONSTRAINT fk_BesuchteModuleModul
	FOREIGN KEY (Modul) REFERENCES Modul (ModulID)
;
\echo Done setting constraints for table BesuchteModule

-- Constraits for table Dozent
\echo Setting constraints for table Dozent
ALTER TABLE Dozent
ADD CONSTRAINT fk_DozentPerson
	FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
;
\echo Done setting constraints for table Dozent

-- Constraits for table DozentToQualifikation
\echo Setting constraints for table DozentToQualifikation
ALTER TABLE DozentToQualifikation
ADD CONSTRAINT fk_DozentToQualifikationDozent
	FOREIGN KEY (Dozent) REFERENCES Dozent (AngestelltenNr)
;

ALTER TABLE DozentToQualifikation
ADD CONSTRAINT fk_DozentToQualifikationQualifikation
	FOREIGN KEY (Qualifikation) REFERENCES Qualifikation (QualiID)
;
\echo Done setting constraints for table DozentToQualifikation

-- Constraits for table Durchfuehrung
\echo Setting constraints for table Durchfuehrung
ALTER TABLE Durchfuehrung
ADD CONSTRAINT fk_DurchfuehrungRaum
	FOREIGN KEY (RaumNr) REFERENCES Raum (Nummer)
;

ALTER TABLE Durchfuehrung
ADD CONSTRAINT fk_DurchfuehrungModul
	FOREIGN KEY (ModulID) REFERENCES Modul (ModulID)
;

ALTER TABLE Durchfuehrung
ADD CONSTRAINT fk_DurchfuehrungQualifikation
	FOREIGN KEY (BenoetigteQuali) REFERENCES Qualifikation (QualiID)
;
\echo Done setting constraints for table Durchfuehrung

-- Constraits for table DurchfuehrungToStudent
\echo Setting constraints for table DurchfuehrungToStudent
ALTER TABLE DurchfuehrungToStudent
ADD CONSTRAINT fk_DurchfuehrungToStudentDurchfuehrung
	FOREIGN KEY (Durchfuehrung) REFERENCES Durchfuehrung (DurchfuehrungsID)
;

ALTER TABLE DurchfuehrungToStudent
ADD CONSTRAINT fk_DurchfuehrungToStudentStudent
	FOREIGN KEY (Student) REFERENCES Student (Matrikelnummer)
;
\echo Done setting constraints for table DurchfuehrungToStudent

-- Constraits for table Modul
\echo Setting constraints for table Modul
ALTER TABLE Modul
ADD CONSTRAINT fk_BenoetigtesModul
	FOREIGN KEY (BenoetigtesModul) REFERENCES Modul (ModulID)
;
\echo Done setting constraints for table Modul

\echo Adding Check Constraits
--ALTER TABLE Person ADD CONSTRAINT Alter CHECK (Alter >= 0);
--ALTER TABLE Student ADD CONSTRAINT Matrikelnummer CHECK (Matrikelnummer >= 2000);
\echo Done adding Check Constraints


\echo Constraits successfuly created!