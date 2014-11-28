-- Author Schmidiger, Kevin and Kaya, Oezhan

-- 1. Liste die Wohnorte aller Studenten und Dozenten auf wobei ein Wohnort nur einmal vorkommen darf
select distinct wohnort as "Wohnort der Stud & Doz" from person;

-- 2. Liste aller Module welche von Studierenden erfolgreich abgeschlossen wurde
select pers.name as "Vorname", pers.nachname as "Nachname", stud.fachrichtung as "Fachrichtung", mod.name as "Modul", mod.ECTSPunkte as "ECTS Punkte" from person as pers inner join student as stud on pers.personid = stud.personid inner join besuchteModule as besMod on stud.matrikelnummer = besMod.student inner join modul as mod on besMod.modul = mod.modulid;

-- 3. Gib mir den Vor - und Nachnamen der ältesten Person der Schule (egal ob Dozent oder Student)
select name, nachname, alter from person where alter = (select max(alter) from person);

-- 4. Gib mir die Liste aller Wohnorte der Studierenden mit deren Anzahl (Wohnort mit den meisten Studierenden zuoberst)
select wohnort, count(*) from person, student where person.personid = student.personid group by wohnort order by count(*) desc;

-- 5. Gib mir den Vor - und Nachnamen aller Studierenden die zurzeit keine Module besuchen
select name, nachname from person where personid in (select personid from Student where matrikelnummer not in(select Student from DurchfuehrungToStudent));


-- 3.1 Common Table Expression (CTE, WITH-Statement):
WITH alleModulBesuchende AS(
	select * from person where personid in (select personid from Student where matrikelnummer in(select Student from DurchfuehrungToStudent))
)
select name, nachname from alleModulBesuchende;


-- 3.2 Window-Funktionen:
-- Grupiere alle Personen an der Schule nach Singlestatus und sortiere sie anhand ihres Alters
select rank() OVER(PARTITION BY Single order by Alter), Name, Nachname, Alter, Single from Person;

CREATE VIEW AlleStudenten(Name, Nachname) AS SELECT Name, Nachname FROM Person WHERE PersonID IN (SELECT PersonID FROM Student);

SELECT * FROM AlleStudenten ORDER BY Name;


-- 4.1 Views: View der ECTS Punkte aller Studierenden welche bereits ECTS Punkte haben
CREATE VIEW ECTSFromStudents(Vorname, Nachname, ECTSPunkte) AS select pers.name as "Vorname", pers.nachname as "Nachname", sum(mod.ECTSPunkte) as "ECTSPunkte" from person as pers inner join student as stud on pers.personid = stud.personid inner join besuchteModule as besMod on stud.matrikelnummer = besMod.student inner join modul as mod on besMod.modul = mod.modulid group by pers.personid;

SELECT * FROM ECTSFromStudents ORDER BY ECTSPunkte DESC;

-- 4.2 Updatable View: Einmal mit normaler Ausgabe des Nachnamen und einmal mit Uppercase
CREATE VIEW Students(Name, Nachname) AS select Name, Nachname from Person where PersonID in (select PersonID from Student);

SELECT * FROM Students;

UPDATE Students SET Name = upper(Name);

SELECT * FROM Students;