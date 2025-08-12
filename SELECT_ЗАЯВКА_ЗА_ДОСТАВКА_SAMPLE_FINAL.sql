SELECT 
	obj.Name AS 'Обект',
	par.Company AS 'Партньор',
	o.Date AS 'Дата',
    o.Acct AS 'Документ',
    g.Code AS 'Код',
    g.Name AS 'Артикул',
    g.Measure1 AS 'Мярка',
	o.Qtty AS 'Оставащо количество',
    o.Qtty * o.PriceIn AS 'Оставаща сума'
FROM Operations o
LEFT JOIN Goods g ON o.GoodID = g.ID
LEFT JOIN Objects as obj ON o.ObjectID = obj.ID
LEFT JOIN Partners as par ON o.PartnerID = par.ID
WHERE o.OperType = 12
  AND o.Qtty > 0
ORDER BY par.Company