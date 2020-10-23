WHILE ( SELECT AVG(ListPrice) FROM dbo.DimProduct) < 300  
BEGIN  
    UPDATE dbo.DimProduct  
        SET ListPrice = ListPrice * 2;  
    SELECT MAX(ListPrice) FROM dbo.DimProduct  
    IF ( SELECT MAX(ListPrice) FROM dbo.DimProduct) > 500  
        BREAK;  
END ;