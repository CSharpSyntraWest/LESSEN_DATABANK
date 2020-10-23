
--1.Open SSMS en open een nieuw Query window op de database xtreme5
USE xtreme5;
GO

--2.	Maak een stored procedure met naam GetAllProductClasses die productClassID en ProductClassName van alle product klassen ophaalt, gesorteerd op productClassNaam 
ALTER PROCEDURE GetAllProductClasses
AS
BEGIN
	SELECT * from ProductClass

END
GO
--3.	Test deze stored procedure door hem uit te voeren via:
   EXEC GetAllProductClasses

--Oefeningen creëren van Stored Procedure: database xtreme5
--1.	Maak een stored procedure met naam GetOrdersForCustomer 
--die alle orders van een op te geven klant (tabel Orders) 
--ophaalt via de CustomerID. 	
--  Test deze stored procedure via EXEC GetOrdersForCustomer 64
CREATE PROCEDURE GetOrdersForCustomer
@CustomerID int
AS
BEGIN
	Select * from Orders where CustomerID = @CustomerID;
END
GO
EXEC GetOrdersForCustomer 64

--2.	Maak een stored procedure met naam NewPoductClass voor het toevoegen van een productClass. De naam van de nieuwe Productclass is een input parameter
--Retourneer de gegenereerde nieuwe waarde van ProductClassID (auto-increment kolom). Test deze stored procedure en kijk na of de returnwaarde juist wordt teruggegeven
USE xtreme5;
GO
CREATE PROCEDURE NewPoductClass
@prodClassName nvarchar(50)
AS
BEGIN
INSERT INTO ProductClass (ProductClassName)
           VALUES(@prodClassName)
select @@IDENTITY as newProductClassID
END
GO
EXEC NewPoductClass 'nieuwe product class'
GO
--3.	Pas NewProductClass aan zodat @@IDENTITY 
--met RETURN Instructie wordt teruggegeven

ALTER PROCEDURE NewPoductClass
@prodClassName nvarchar(50)
AS
INSERT INTO ProductClass (ProductClassName)
           VALUES(@prodClassName)
  RETURN @@IDENTITY
GO
DECLARE @ProdClassID INT
EXEC @newProdClassID = NewPoductClass '2e product class'
PRINT @ProdClassID

--4.	 Pas NewProductClass aan zodat @@IDENTITY wordt teruggegeven in een OUTPUT parameter
USE xtreme5
GO
ALTER PROCEDURE NewPoductClass
@prodClassName nvarchar(50),
@newProdClassID INT OUTPUT
AS
INSERT INTO ProductClass (ProductClassName)
           VALUES(@prodClassName)
SET @newProdClassID = @@IDENTITY 
GO
DECLARE @ProdClassID INT
EXEC NewPoductClass '3e product class', @ProdClassID OUTPUT

PRINT @ProdClassID
--Oefeningen aanpassen van Stored Procedure en optionele parameter:

--1.	Pas de stored procedure met naam GetOrdersForCustomer aan, zodat input paramer CustomerID optioneel is en default waarde 1 is	
--     Test deze stored procedure via 
--	 EXEC GetOrdersForCustomer 

USE xtreme5
GO
ALTER PROCEDURE GetOrdersForCustomer
@CustomerID INT = 1 --optionele parameter
AS
SELECT * from Orders 
WHERE CustomerID = @CustomerID;
GO
EXEC GetOrdersForCustomer
GO

--Oefening verwijderen van Stored Procedure

--Verwijder de stored procedure met naam GetOrdersForCustomer 

DROP PROCEDURE GetOrdersForCustomer

--Extra oefening bierendb
-------------------------------------------------------
Use BierenDb;
GO
--Maak een stored procedure sp_topBieren die de bieren van de
--10 brouwers met de grootste omzet in        een gegeven gemeente teruggeeft
-- maak een output parameter die eveneens de totaalomzet van deze 10 brouwers 
--teruggeeft
CREATE procedure sp_topBieren
@gemeente varchar(50),
@totaalomzet float OUTPUT
AS
BEGIN
select top 10 b.* from bieren b inner join brouwers br
on b.BrouwerNr = br.BrouwerNr where br.Gemeente = @gemeente
order by br.omzet desc
select @totaalomzet = sum(omzet) from brouwers 
where brouwerNr IN (select top 10 BrouwerNr from brouwers 
where Gemeente = @gemeente
order by omzet desc)
END
GO
DECLARE @TotOmzet float
EXEC sp_topBieren 'Brugge', @TotOmzet OUTPUT
print @TotOmzet

