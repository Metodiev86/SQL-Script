CREATE VIEW Good_Price_Is_Zero AS

SELECT gr.Name AS 'Група', g.Code AS 'Код', g.BarCode1 AS 'Баркод', g.Catalog1 AS 'Каталожен No', g.Name AS 'Продукт' FROM goods AS g

LEFT JOIN GoodsGroups AS gr ON g.GroupID = gr.ID

WHERE PriceOut1 = 0 AND
PriceOut2 = 0 AND
PriceOut3 = 0 AND
Deleted = 0