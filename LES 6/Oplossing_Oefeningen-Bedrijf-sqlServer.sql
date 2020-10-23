--#Creatie van nieuwe database Bedrijf
CREATE DATABASE Bedrijf ;
USE Bedrijf;

--#Creëer een tabel taak in database Bedrijf
CREATE TABLE Taak(
Nr INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Omschrijving VARCHAR(45) NULL,
teamgrootte INT  NULL)


INSERT INTO Taak (omschrijving, teamgrootte)
VALUES('TAAK1',10),
('TAAK2',3),
('TAAK3',5);

--DROP TABLE IF EXISTS Taak;
CREATE TABLE klanten (
klantnr INT NOT NULL PRIMARY KEY,
naam VARCHAR(50) NOT NULL,
adres VARCHAR(50) NOT NULL,
postcode CHAR(4) NOT NULL,
woonplaats VARCHAR(50) NOT NULL
);

--DROP TABLE IF EXISTS bestellingen;

CREATE TABLE Bestellingen
(
 bestelnr INT NOT NULL PRIMARY KEY,
 klantnr INT NOT NULL,
 besteldatum datetime NOT NULL,
   CONSTRAINT fk_klantnr FOREIGN KEY (klantnr)
   REFERENCES klanten(klantnr)
   ON DELETE CASCADE
   ON UPDATE CASCADE
) ;
/*Opdracht: UITTESTEN CASCADE DELETE:
Voeg een klant toe en 1 of 2 bestellingen voor deze klant
Delete daarna de klant en controleer of zijn bestellingen ook verwijderd worden*/
INSERT INTO Klanten(klantNr,naam,adres,postcode,woonplaats)
VALUES(1,'Klant1','Straat 10','1000','Brussel');
INSERT INTO bestellingen(bestelnr,klantnr,besteldatum)
VALUES(1,1,'2020-10-22'),(2,1,'2020-10-22');
DELETE FROM Klanten WHERE KlantNr=1;

 --Volgende moet 0 teruggeven als cascade delete heeft gewerkt
select count(*) from bestellingen;