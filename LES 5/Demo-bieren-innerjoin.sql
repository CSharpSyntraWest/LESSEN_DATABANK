use bieren;
SELECT r.BrouwerNr, BrNaam, BierNr, Naam, s.SoortNr,Soort
FROM brouwers r 
INNER JOIN bieren b ON r.BrouwerNr = b.BrouwerNr
INNER JOIN soorten s ON b.SoortNr = s.SoortNr
ORDER BY Soort, BrNaam,Naam;

use bieren;
select BierNr, Naam, brouwers.BrouwerNr,BrNaam
from bieren inner join brouwers
on bieren.BrouwerNr = brouwers.BrouwerNr;

select BierNr, Naam, b.BrouwerNr,BrNaam
from bieren b inner join brouwers r
on b.BrouwerNr = r.BrouwerNr;

