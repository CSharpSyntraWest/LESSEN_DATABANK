USE Plantv;
/*Oefening Create Table simple*/

/*Oefening 1*/
CREATE TABLE klachten(
	klachtnr INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    art_code char(3),
    datum Datetime,
    klacht varchar(100),
    status char(2));

INSERT INTO Klachten
(art_code,datum,klacht,status)
VALUES
('316','2020-10-22'
,'Planten(LEV_CODE 019) vertoonden bruine plekken na ca 2 maanden'
,'GL');
/*Oefening aanbiedingen*/
SELECT p.art_code, plantennm,Lev_code, off_prijs 
INTO aanbiedingen from 
Planten p inner join offertes o1 On p.art_code = o1.art_code
where Off_prijs = ( select min(off_prijs) from offertes o2 
where o1.art_code = o2.art_code); 
--ofwel
CREATE TABLE aanbiedingen
(
	ART_CODE char(3),
    PLANTENNM varchar(16),
    LEV_CODE varchar(3),
    OFF_PRIJS float
);
INSERT INTO aanbiedingen
(ART_CODE,PLANTENNM,LEV_CODE,OFF_PRIJS)
Select p.art_code, plantennm,Lev_code, off_prijs
from Planten p inner join offertes o1 On p.art_code = o1.art_code
where Off_prijs = ( select min(off_prijs) from offertes o2 
where o1.art_code = o2.art_code); 
--(131 rows affected)
/*Oefening 3 nieuwe tabel Oudebestellingen*/
SELECT * into OudeBestellingen FROM Bestel WHERE 1=2;
