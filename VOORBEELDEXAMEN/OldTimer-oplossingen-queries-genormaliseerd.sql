--3.	Maak een stored procedure met naam sp_GeefTop5LedenVoorSoort die de gegevens van de alfabetisch op naam eerste 5 leden van een gegeven soort teruggeeft. 
ALTER procedure sp_GeefTop5LedenVoorSoort
@Soort varchar(50)
AS
SELECT top 5 Lidnr,Lidnaam, adres,loc.plaats,s.soort
FROM 
locaties loc inner join leden l on loc.locatieID = l.Plaats
inner join SoortenLeden  s on l.soort=s.SoortID
WHERE s.soort = @Soort--'junior'
ORDER BY lidnaam

exec sp_GeefTop5LedenVoorSoort 'Junior'
--Vraag  4.	Geef de evenementen uit de maand augustus die als toerrit of show worden aangeduid. Sorteer op evenementnummer.
SELECT e.*
FROM evenementen e
inner join soortenevenementen s on e.soortID = s.SoortID
WHERE s.SoortNaam IN( 'Toerrit' ,'Show')
AND MONTH(evenementdatum) = 8
ORDER BY evenementnr

--Vraag 5.	Geef het autonummer en de typenaam van de auto’s die toebehoren aan een junior-lid en een waarde hebben van meer dan 2500. Sorteer volgens autonummer.
SELECT autonr, typenaam
FROM autos
WHERE waarde > 2500 AND 
      lidnr IN (SELECT lidnr
                FROM leden
                WHERE soort = 1)
ORDER BY autonr

--
--6.	Geef een overzicht van de evenementen, die als toerrit worden aangeduid, en de auto’s die eraan deelnemen. Toon het evenementnummer, de evenementnaam, het autonummer, de typenaam en de naam van de eigenaar van de auto. Sorteer volgens evenementnummer en daarbinnen volgens autonummer.
SELECT e.evenementnr, e.evenementnaam, 
       a.autonr, a.typenaam,
       l.lidnaam
FROM evenementen e
JOIN deelnames d ON e.evenementnr = d.evenementnr
JOIN autos a ON d.autonr = a.autonr
JOIN leden l ON a.lidnr = l.lidnr
WHERE e.soortID = 1--'Toerrit'
ORDER BY e.evenementnr, a.autonr


--7.	Wat is het totaal aantal passagiersplaatsen in de auto’s die deelnemen aan het evenement met nummer 201502?
SELECT SUM(passagiers) AS passagierstotaal
FROM deelnames d
JOIN autos a ON d.autonr = a.autonr
WHERE evenementnr = 201502

--8.	Geef van alle evenementen het evenementnummer, het aantal auto’s dat aan dit evenement deelneemt en de totale waarde van de deelnemende auto’s.
SELECT e.evenementnr, 
       COUNT(a.autonr) AS aantalautos, 
       SUM(waarde) AS waardetotaal
FROM evenementen e
LEFT JOIN deelnames d ON e.evenementnr = d.evenementnr
LEFT JOIN autos a ON d.autonr = a.autonr
GROUP BY e.evenementnr


--9.	Geef van alle leden de naam en het aantal auto’s dat ze bezitten. Sorteer volgens lidnummer.
SELECT l.lidnaam, 
       (SELECT COUNT(*)
        FROM autos a
        WHERE a.lidnr = l.lidnr) AS aantalAutos
FROM leden l
ORDER BY l.lidnr
--10.	Geef van de leden die deelgenomen hebben aan evenementen, het nummer en de som van de prijs van de evenementen waaraan ze deelnamen. Sorteer op lidnummer.

SELECT l.lidnr, SUM(prijs) AS somPrijs
FROM leden l
JOIN autos a ON l.lidnr = a.lidnr
JOIN deelnames d ON a.autonr = d.autonr
JOIN evenementen e ON d.evenementnr = e.evenementnr
GROUP BY l.lidnr
--11.	Geef de gegevens van de auto’s die aan geen enkel evenement deelnamen. Sorteer volgens dalende waarde.

SELECT *
FROM autos
WHERE autonr NOT IN
    (SELECT autonr
     FROM deelnames)
ORDER BY waarde DESC
--12.	Geef de naam van de leden, 
--die niet met één van hun auto’s aan het evenement 201501 deelnamen.
-- Sorteer  op lidnaam.

SELECT l.lidnaam
FROM leden l
WHERE l.lidnr NOT IN
      (SELECT lidnr
       FROM autos a
       JOIN deelnames d ON a.autonr = d.autonr
       WHERE evenementnr = 201501 AND lidnr IS NOT NULL)
ORDER BY lidnaam
 
--13.	Geef de gegevens van de auto’s die wel hebben deelgenomen aan evenement 201502, maar niet aan evenement 201505. Sorteer volgens autonummer.

SELECT *
FROM autos
WHERE autonr IN (SELECT autonr
                 FROM deelnames
                 WHERE evenementnr = 201502)
AND autonr NOT IN (SELECT autonr
                   FROM deelnames
                   WHERE evenementnr = 201505)
ORDER BY autonr

--14.	Geef de lidgegevens en de autogegevens van de leden die een auto hebben waarvan de waarde meer bedraagt dan de helft van de totale waarde van alle auto’s van andere leden uit de plaats waar dit lid woont. Sorteer op lidnummer en autonummer.

SELECT l1.*, a.*
FROM leden l1
JOIN autos a ON l1.lidnr = a.lidnr
WHERE waarde >
      (SELECT SUM(waarde) / 2
       FROM leden
       JOIN autos ON leden.lidnr = autos.lidnr
       WHERE leden.plaats = l1.plaats
       AND leden.lidnr <> l1.lidnr) 
ORDER BY l1.lidnr, autonr

 
--15.	Geef lidnummer en naam van leden die aan alle evenementen hebben deelgenomen. Sorteer op lidnummer.
select l.lidnr,lidnaam from leden l inner join autos a on l.lidnr = a.lidnr
inner join deelnames d on a.autonr = d.autonr
inner join evenementen e on d.evenementnr = e.evenementnr
group by l.lidnr,lidnaam
having count(e.evenementnr) = (select count(*) from evenementen)
order by l.lidnr
--of
SELECT *
FROM leden
WHERE NOT EXISTS
    /*hierna staat een lijst van de evenementen
      waaraan het betreffende lid NIET heeft deelgenomen*/ 
    (SELECT *
     FROM evenementen
     WHERE evenementnr NOT IN 
        /*hierna staat een lijst van de evenementen
          waaraan het betreffende lid heeft deelgenomen*/ 
        (SELECT evenementnr
         FROM deelnames
         JOIN autos ON deelnames.autonr = autos.autonr
         WHERE autos.lidnr = leden.lidnr)
    )
ORDER BY lidnr
--16.	Geef een nieuw lid in: Jansen, SENIOR, Kerstraat 1, Gent. Dit lid is eigenaar van de auto 'Audi MODEL TT', bouwjaar 1968, waarde 25000 en heeft 4 passagiersplaatsen.

INSERT INTO leden(lidnaam, soort, adres, plaats)
VALUES ('Jansen', 2, 'Kerstraat 1', 4);

INSERT INTO autos(typenaam, bouwjaar, waarde, passagiers, lidnr)
VALUES ('Audi MODEL TT', 1968, 25000, 4, @@identity);

--17.	Verwijder de leden die geen auto bezitten.

DELETE FROM leden
WHERE lidnr NOT IN (SELECT DISTINCT lidnr FROM autos WHERE lidnr IS NOT NULL)

--18.	Voeg een kolom ‘land’ toe aan de tabel leden.
ALTER TABLE leden
ADD landcode char(2)




--19.	Vul de nieuwe kolom met ‘België’ voor lidnr 15 en met ‘Nederland’ voor de andere leden.

UPDATE leden
SET landcode = 'BE'
WHERE lidnr = 15;

UPDATE leden
SET landcode = 'NL'
WHERE lidnr <> 15;

--20.	Breid de databank uit. Zorg dat van elk lid meerdere e-mailadressen kunnen bijgehouden worden. Vergeet niet de nodige constraints te definiëren.

CREATE TABLE emails (
lidnr INT,
email VARCHAR(100),
PRIMARY KEY(lidnr, email),
CONSTRAINT fk_emails FOREIGN KEY (lidnr) REFERENCES leden(lidnr)
) 

--21.	Geef 2 e-mailadressen in voor lidnummer 1. Kies zelf de e-mailadressen.

INSERT INTO emails(lidnr, email)
VALUES(1,'jj@gmail.com');

INSERT INTO emails(lidnr, email)
VALUES(1,'jj@syntrawest.be');



--22.	Geef alle leden met hun eventuele e-mailadressen. Sorteer op lidnummer.

SELECT l.*, e.email
FROM leden l
LEFT JOIN emails e ON l.lidnr = e.lidnr
ORDER BY l.lidnr
