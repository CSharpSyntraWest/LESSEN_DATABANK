USE Plantv;


CREATE VIEW vw_Heesters AS
SELECT *
FROM planten
WHERE soort = 'Heester'


select * from vw_Heesters order by Prijs desc, PlantenNM;

drop VIEW vw_Heesters