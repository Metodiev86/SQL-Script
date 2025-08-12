CREATE VIEW Goods_QTTY_Objects AS 
	
	SELECT g.ID AS 'Продукт ID', g.Code AS 'Код на Стоката', 
	g.BarCode1 AS 'Баркод', g.Catalog1 AS 'Каталожен No', gr.Name AS 'Група Артикул', 
	g.Name AS 'Продукт', o.Name AS 'Обект', 
	s.Qtty AS 'Количество', CASE  
							WHEN g.Deleted  = 0 THEN 'Активен'
							WHEN g.Deleted = -1 THEN 'Изтрит'
							END AS 'Статус',
											CASE 
											WHEN s.qtty < 0  THEN 'На минус'
											WHEN g.Deleted = -1 THEN 'Неактивен'
											ELSE 'В наличност'
											END AS 'Статус Количество'

	FROM Goods AS g
	LEFT JOIN GoodsGroups as gr ON g.GroupID = gr.ID
	LEFT JOIN Store AS s ON  g.ID = s.GoodID
	LEFT JOIN Objects AS o ON s.ObjectID = o.ID


