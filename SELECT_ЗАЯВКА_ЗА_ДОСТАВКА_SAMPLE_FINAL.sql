SELECT 
	obj.Name AS '�����',
	par.Company AS '��������',
	o.Date AS '����',
    o.Acct AS '��������',
    g.Code AS '���',
    g.Name AS '�������',
    g.Measure1 AS '�����',
	o.Qtty AS '�������� ����������',
    o.Qtty * o.PriceIn AS '�������� ����'
FROM Operations o
LEFT JOIN Goods g ON o.GoodID = g.ID
LEFT JOIN Objects as obj ON o.ObjectID = obj.ID
LEFT JOIN Partners as par ON o.PartnerID = par.ID
WHERE o.OperType = 12
  AND o.Qtty > 0
ORDER BY par.Company