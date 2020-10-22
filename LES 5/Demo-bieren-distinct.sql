Use bieren;
SELECT distinct s.soortNr,soort#,Naam
FROM bieren b INNER JOIN Soorten s
ON b.SoortNr = s.SoortNr
ORDER BY soort;

SELECT distinct postCode from brouwers 
order by postcode;
