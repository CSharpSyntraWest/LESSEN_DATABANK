USE BierenDb;
select * from bieren
Select * from brouwers
--INNER JOIN
select Naam as biernaam, BrNaam as brouwerNaam
from Bieren INNER JOIN brouwers
ON Bieren.BrouwerNr = brouwers.BrouwerNr;
--Geef de namen van de bieren en hun soortnaam
Select Naam as bierNaam, Soort as soortNaam
from Bieren INNER JOIN Soorten
ON Bieren.SoortNr = Soorten.SoortNr
Order by SoortNaam, BierNaam;
--Geef biernaam, brouwernaam en soortnaam van alle bieren
--INNER JOIN TUSSEN 3 tabellen
Select Naam as BierNaam, BrNaam as BrouwerNaam,Soort
from Brouwers INNER JOIN Bieren 
on Brouwers.BrouwerNr = Bieren.BrouwerNr
INNER JOIN Soorten on Bieren.SoortNr = Soorten.SoortNr;

USE BierenDb;
--Geef biernaam, soortnaam en alcohol terug
-- van alle bieren
Select Naam as BierNaam, Soort, Alcohol
from bieren INNER JOIN soorten
on bieren.SoortNr = soorten.SoortNr;