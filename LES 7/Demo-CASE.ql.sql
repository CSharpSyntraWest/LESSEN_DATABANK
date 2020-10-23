USE [northwind]
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'hoeveelheid is groter dan 30'
    WHEN Quantity = 30 THEN 'hoeveelheid is gelijk aan 30'
    ELSE 'hoeveelheid is kleiner dan 30'
END AS QuantityText
FROM [Order Details];