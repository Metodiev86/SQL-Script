SELECT DISTINCT g.Id AS 'ID на Артикула', g.Code AS 'Код на артикула', g.Name AS 'Артикул', g.Measure1 AS 'Мярка', g.Ratio AS 'Разфасовка',

st.Qtty AS 'Количество на Склад', g.PriceIn AS 'Доставна цена', gGroup.Code AS 'Код на групата', gGroup.ID AS 'ID на Групата',

gGroup.Name AS 'Група', 

obj.Name AS 'Обект',

par.Company AS 'Партньнор', 


SUM(oper.Qtty) AS 'Количество при Операция', oper.Date AS 'Дата', 
 operTYPE.BG AS 'Вид на операцията'
FROM Goods AS g	
INNER JOIN Operations AS oper ON oper.GoodID = g.ID
INNER JOIN OperationType AS operTYPE ON operTYPE.ID = oper.OperType 
INNER JOIN Partners AS par ON oper.PartnerID = par.ID
INNER JOIN Objects AS obj ON oper.ObjectID = obj.ID
RIGHT JOIN GoodsGroups AS gGroup ON g.GroupID = gGroup.ID
INNER JOIN Store AS st ON g.ID = st.GoodID AND obj.ID = st.ObjectID

 
GROUP BY  oper.Qtty, oper.Date, g.ID, g.Code, g.Name, g.Measure1, 
st.Qtty, g.PriceIn, gGroup.Name, obj.Name, obj.ID,
par.Company, operTYPE.BG, g.Ratio, gGroup.Code, gGroup.ID