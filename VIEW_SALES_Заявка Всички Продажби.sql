CREATE VIEW Sales AS

SELECT op.ID, opt.BG as 'Операция', op.Acct AS 'Документ No', g.Name AS 'Продукт', p.Company as 'Партньор', obj.Name AS 'Обект', op.Qtty AS 'Количество',
ROUND(op.PriceIn, 2) AS 'Доставна Цена', ROUND(op.PriceOut, 2) AS 'Продажна Цена', ROUND(op.VATIn, 2) AS 'Доставно ДДС', 
ROUND(op.VATOut, 2) AS 'Продажно ДДС', CONCAT(op.Discount, ' %') AS 'Отстъпка', op.Note AS 'Забележка', us.Name AS 'Оператор', op.UserRealTime AS 'Дата'

FROM Operations AS op

LEFT JOIN OperationType AS opT ON op.OperType = opT.ID
LEFT JOIN Goods as g ON op.GoodID = g.ID
LEFT JOIN Partners AS p ON op.PartnerID = p.ID 
LEFT JOIN Objects AS obj ON op.ObjectID = obj.ID
LEFT JOIN Users AS us ON op.UserID = us.ID

WHERE opT.ID = 2