CREATE VIEW Good_Price_Is_Zero AS

SELECT gr.Name AS '�����', g.Code AS '���', g.BarCode1 AS '������', g.Catalog1 AS '��������� No', g.Name AS '�������' FROM goods AS g

LEFT JOIN GoodsGroups AS gr ON g.GroupID = gr.ID

WHERE PriceOut1 = 0 AND
PriceOut2 = 0 AND
PriceOut3 = 0 AND
Deleted = 0