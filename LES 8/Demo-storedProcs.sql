USE bierenDb;
GO

CREATE PROCEDURE  sp_BierInfoByBierNr
	@BierNr int
AS
BEGIN
	Select * from bieren where BierNr = @BierNr
END
GO

EXEC sp_BierInfoByBierNr 4

ALTER PROCEDURE sp_BierenGrootsteBrouwersVoorPostCode
	@postcode int = 1000,
	@omzet float = 1000
AS
SELECT b.*,brnaam,omzet from bieren b inner join Brouwers br
on b.BierNr = br.brouwerNr
where br.postcode = @postcode
and omzet >=@omzet

EXEC sp_BierenGrootsteBrouwersVoorPostCode 9000,100