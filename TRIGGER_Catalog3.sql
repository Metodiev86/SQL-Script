CREATE TRIGGER tr_Catalog3
ON Goods
AFTER INSERT, UPDATE, DELETE
AS
UPDATE Goods
SET Catalog3 = REPLACE(Catalog3, ' ', '')
WHERE Catalog3 !='' AND Deleted=0