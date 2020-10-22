--Oefening Deel 5 - subqueries
--1. Welke planten zijn hoger dan de gemiddelde hoogte van alle planten
--tezamen? Druk alle gegevens af.
select * from planten where hoogte > (select avg(hoogte) from planten);
--2. Welke planten zijn duurder dan de gemiddelde prijs van de bomen? 
--Druk alle gegevens ervan af.
select * from planten where prijs > (select avg(prijs)
from planten where soort = 'boom');

--3. Maak een overzicht van de leveranciers (alle gegevens) waar nog
--bestellingen uitstaan met een leverdatum die v篌r 1 april 1999 ligt. (In
-- gebruik je #1999񪣁# als getalnotatie)
select * from leveran where lev_code in 
(select lev_code from bestel where l_datum < '1999-04-01')
--Met INNER JOIN:
select DISTINCT leveran.* from leveran inner join bestel 
on leveran.Lev_Code = bestel.Lev_Code where l_datum < '1999-04-01'
--4. Welke rijen hebben, de laagste offerteprijs van alle offertes in de tabel
--OFFERTES? Geef alle gegevens.
select * from offertes where off_prijs = (select
min(off_prijs) from offertes)
--5. Welke planten zijn lager dan de laagste vaste plant? (alle gegevens geven)
--Planten waar de hoogte = 0 worden niet meegerekendselect * from planten where hoogte > 0 and hoogte <(select min(hoogte) from planten where soort = 'vast'and hoogte > 0);