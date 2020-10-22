USE BierenDb;

CREATE Table Klanten(
	KlantNr int NOT NULL PRIMARY KEY,
	RijksRegNr char(11) NOT NULL UNIQUE,
	Voornaam  varchar(20) NOT NULL,
	FamilieNaam varchar(20) NOT NULL,
	FavorietBierNr int FOREIGN KEY 
	REFERENCES Bieren(BierNr),
	Leeftijd tinyint,
	CONSTRAINT CHK_Leeftijd CHECK(Leeftijd >=18)
);


ALTER TABLE Klanten
ADD CONSTRAINT DF_FavorietBierNr  DEFAULT (4) FOR FavorietBierNr

ALTER TABLE Klanten
DROP CONSTRAINT DF_FavorietBierNr
