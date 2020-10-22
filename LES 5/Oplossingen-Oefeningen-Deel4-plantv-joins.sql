--Oefening Deel 4
--1. Maak een overzicht van de bestellingen met het bestelnummer, de naam van
--de leverancier, de leverdatum en het bestelde bedrag.
--(resultaat : 15 rijen)
select bestelnr,lev_naam,L_datum,bedrag
from bestel inner join leveran on
bestel.Lev_Code = leveran.lev_code;
--2. Welke planten hebben een levertijd van maximum 10 dagen ? Plaats in het
--overzicht de gegevens : artikelcode, leveranciers-artikelcode, plantennaam en
--levertijd.
--(resultaat : 113 rijen)
select offertes.Art_Code, art_lev,plantennm, lev_tijd 
from Offertes inner join planten 
on offertes.Art_Code = planten.Art_Code where
lev_tijd <= 10;
--3. Geef een overzicht waaruit blijkt bij welke leverancier(s) de planten besteld
--kunnen worden. In het overzicht moeten de volgende gegevens staan :
--artikelcode, plantennaam, leverancierscode, naam van de leverancier,
--levertijd en offerteprijs. Sorteer het overzicht op plantennaam.
--(resultaat : 218 rijen)
select p.art_code, plantennm,lev.lev_code,
lev_naam, lev_tijd, off_prijs from 
 offertes o  
inner join planten p on p.Art_Code = o.art_code
inner join leveran lev on o.Lev_Code = lev.Lev_Code
order by plantennm;
--4. Maak een overzicht van die planten die een prijs hebben welke minstens 50%
--boven de offerteprijs ligt. Geef artikelcode, plantennaam, prijs van de plant,
--leverancierscode en offerteprijs.
--(resultaat : 212 rijen)
select planten.Art_Code, plantennm, prijs, lev_code,off_prijs
from planten inner join offertes 
on offertes.art_code = planten.art_code
where prijs >= (off_prijs *1.5);
--5.
-- Hoeveel verschillen de gehanteerde bestelprijzen met de huidige offerteprijzen . Presenteer in
--de lijst de gegevens bestelnummer, artikelcode van de leverancier en het positieve of negatieve
--verschil.
select bestreg.bestelnr, bestreg.art_lev,
best_pr - off_prijs as verschil 
from  bestel inner join bestreg 
on bestel.bestelnr = bestreg.bestelnr 
inner join offertes  on offertes.art_lev = bestreg.art_lev
					and offertes.Lev_Code = bestel.lev_code;
--6. In welke plaatsen kan het tuincentrum 
--vaste planten bestellen?
--(resultaat : 2 rijen, nl. Aalsmeer en Lisse)
select DISTINCT WoonPl from Leveran lev
inner join offertes o on lev.Lev_Code = o.Lev_Code
inner join planten p on o.Art_Code = p.Art_Code
where p.Soort='vast'


