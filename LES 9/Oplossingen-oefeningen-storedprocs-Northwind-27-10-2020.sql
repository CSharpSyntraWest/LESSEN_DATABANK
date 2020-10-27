USE [northwind]
GO
--Opdracht 1 - Maak een stored procedure die alle producten print bij het uitvoeren van fn_PrintAllProducts
CREATE PROCEDURE fn_PrintAllProducts
AS
BEGIN
SELECT * FROM Products;
END
--Testen van stored procedure:
EXEC fn_PrintAllProducts;--Opdracht 2 - Maak een stored procedure die alle producten van een bepaalde categorie --(gebruik CategoryID) print bij het uitvoeren van PrintAllProductsByCatIdCREATE PROCEDURE fn_PrintAllProductsByCatId
@cat_id int
AS
BEGIN
SELECT * FROM Products
WHERE Products.CategoryID = @cat_id;
END
GO
--Testen van stored procedure
exec fn_PrintAllProductsByCatId 2;
--Opdracht 3 - Maak een stored procedure die alle producten print die een customer ooit bestelde, 
--customer kiezen we op basis van zijn/haar CustomerId
ALTER PROCEDURE fn_PrintAllProductsOrderedByCustomerId
@CustomerId varchar(255)
AS
BEGIN
SELECT Orders.OrderID, Products.ProductID, Products.ProductName
FROM Orders INNER JOIN [Order Details] ON Orders.OrderId = [Order Details].OrderId
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
--INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.CustomerID = @CustomerId;
END
GO
--Test stored procedure
exec fn_PrintAllProductsOrderedByCustomerId 'ANTON';
--Opdracht 4 - Maak een stored procedure die alle employees print die aangeworven zijn tussen 2 datums die je meegeeft als parameters. Zet als default begindatum '1993-01-01' en als default einddatum '1995-01-01'
CREATE PROCEDURE fn_PrintEmployeesHiredBetween
@beginDatum datetime,-- = '1993-01-01',
@eindDatum datetime,-- = '1995-01-01',
@aantal int OUTPUT
AS
BEGIN
SELECT FirstName, lastName, Title, HireDate
FROM employees
WHERE employees.HireDate BETWEEN @beginDatum AND @eindDatum; 
--of  WHERE employees.HireDate >= @beginDatum AND employees.HireDate <=@eindDatum

set @aantal = @@ROWCOUNT
END
GO
declare @aantalAangeworven int
exec fn_PrintEmployeesHiredBetween '1993-01-01','1993-12-31',@aantalAangeworven OUTPUTPrint @aantalAangeworven