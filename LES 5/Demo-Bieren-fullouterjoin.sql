USE [BierenDb];
--Voorbeeld full outer join
select * from bieren 
full outer join brouwers 
on bieren.BrouwerNr = brouwers.brouwernr;
/*Enkel de bieren zonder brouwers en brouwers
en brouwers zonder bieren*/
select * from bieren 
full outer join brouwers 
on bieren.BrouwerNr = brouwers.brouwernr
WHERE bieren.brouwerNr is null 
OR Brouwers.BrouwerNr is null;
