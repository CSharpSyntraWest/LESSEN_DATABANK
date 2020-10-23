USE [BierenDb];

CREATE VIEW Vw_BrouwersBeperkt
AS
SELECT B.BrouwerNr, B.BrNaam, B.Adres, B.PostCode, B.Gemeente
FROM Brouwers B

Select * from Vw_BrouwersBeperkt order by BrNaam;

CREATE VIEW vw_toptien
AS
SELECT TOP 10 brouwernr, brnaam, omzet FROM Brouwers
ORDER BY omzet DESC




