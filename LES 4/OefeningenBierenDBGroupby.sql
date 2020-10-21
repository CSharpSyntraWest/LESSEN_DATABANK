/****** Script for SelectTopNRows command from SSMS  ******/
USE BierenDb;
--Geef de soorten en aantal bieren waarvoor er minstens
--2 bieren in de soort bestaan
SELECT SoortNr, Count(BierNr) as aantalbieren
from bieren
group by soortNr
having count(BierNr) >= 2
order by soortNr;
--Per soort het aantal bieren
SELECT SoortNr, Count(BierNr) as aantalbieren
from bieren
group by soortNr
order by soortNr;
--Per brouwer het aantal bieren
--met enkel de brouwers die minstens 3 bieren brouwen
Select BrouwerNr, Count(BierNr) as aantalbieren
from bieren
group by BrouwerNr
having Count(BierNr) >=3
order by BrouwerNr;
--Oefening: Geef uit de tabel Brouwers 
--Per gemeente de gemiddelde omzet
Select Gemeente, avg(omzet) as gemiddomzet
from brouwers 
group by gemeente
having avg(omzet) < 1000
order by gemeente;
--Oefening: Geef uit de tabel Brouwers 
--per postcode de som van alle omzetten waarvan de
--deze som > 10000;
SELECT PostCode, SUM(Omzet) as totaalomzet from Brouwers
group by Postcode
having sum(omzet) > 10000;
--Oefening: Geef uit de tabel Brouwers
--Per postcode het aantal Brouwers waarvan 
-- het aantal brouwers > 1:
Select Postcode, Count(BrouwerNr) as aantalbrouwers
from Brouwers
group by Postcode
having count(BrouwerNr) >  1;