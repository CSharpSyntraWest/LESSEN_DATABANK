USE [northwind]
--Geeft de lijst van
--leveranciers op met een productprijs lager dan 20:
SELECT *
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products 
WHERE Products.SupplierID = Suppliers.supplierID 
AND Products.UnitPrice < 20);

--ANY
--De operator ANY geeft TRUE terug als 1 van de subquerywaarden 
--aan de voorwaarde voldoet.

--De volgende SQL-instructie retourneert TRUE en geeft een lijst van de productnamen als er ELKE records in de tabel Order Details 
--worden gevonden die hoeveelheid = 10:
SELECT ProductName
FROM Products
WHERE ProductID = ANY 
(SELECT ProductID FROM [Order Details]
WHERE Quantity = 10);

--ALL
--De operator ALL geeft true terug als alle subquerywaarden aan de voorwaarde voldoen.

--De volgende SQL geeft TRUE en geeft de productnamen 
--weer als ALLE records in de tabel OrderDetails hoeveelheid = 10 hebben 
--(dit voorbeeld geeft dus FALSE terug, omdat niet ALLE records in de tabel Order Details hoeveelheid = 10 hebben):
SELECT ProductName
FROM Products
WHERE ProductID = 
ALL (SELECT ProductID FROM [Order Details] WHERE Quantity = 10);