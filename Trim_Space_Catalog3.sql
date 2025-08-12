UPDATE Goods
SET Catalog3 = REPLACE(Catalog3, ' ', '')
WHERE Catalog3 !=''

SELECT Catalog3
FROM Goods
WHERE Catalog3 !=''