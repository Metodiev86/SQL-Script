SELECT DISTINCT g.Id AS 'ID �� ��������', g.Code AS '��� �� ��������', g.Name AS '�������', g.Measure1 AS '�����', g.Ratio AS '����������',

st.Qtty AS '���������� �� �����', g.PriceIn AS '�������� ����', gGroup.Code AS '��� �� �������', gGroup.ID AS 'ID �� �������',

gGroup.Name AS '�����', 

obj.Name AS '�����',

par.Company AS '���������', 


SUM(oper.Qtty) AS '���������� ��� ��������', oper.Date AS '����', 
 operTYPE.BG AS '��� �� ����������'
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