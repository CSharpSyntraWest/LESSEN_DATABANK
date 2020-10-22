

/* SELECTEER ALLE BIEREN BierNr, Naam 
MET HUN BROUWERS BrouwerNr, BrNaam
OOK DE BIEREN ZONDER BROUWER */

SELECT BierNr, Naam, br.BrouwerNr,BrNaam
FROM bieren b LEFT JOIN brouwers br
ON b.BrouwerNr = br.BrouwerNr
ORDER BY BrNaam,Naam;

--Enkel de bieren die geen brouwer hebben:
SELECT BierNr, Naam, br.BrouwerNr,BrNaam
FROM bieren b LEFT JOIN brouwers br
ON b.BrouwerNr = br.BrouwerNr
where br.BrouwerNr is NULL;

/*Geef alle bieren en hun soorten,
ook de bieren die geen soortnr hebben*/
Select BierNr,Naam,s.SoortNr,Soort
FROM bieren b left join soorten s
on b.SoortNr = s.SoortNr
order by soortnr;
--ENkel de bieren zonder soort(nr)
Select BierNr,Naam,s.SoortNr,Soort
FROM bieren b left join soorten s
on b.SoortNr = s.SoortNr WHERE s.SoortNr is null;
/* SELECTEER ALLE BROUWERS met hun bieren
   ook de brouwers die nog geen bier hebben */
SELECT BierNr, Naam, br.BrouwerNr,BrNaam
FROM bieren b RIGHT JOIN brouwers br
ON b.BrouwerNr = br.BrouwerNr
ORDER BY BrNaam,Naam;