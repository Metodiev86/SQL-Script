CREATE VIEW Sales AS

SELECT op.ID, opt.BG as '��������', op.Acct AS '�������� No', g.Name AS '�������', p.Company as '��������', obj.Name AS '�����', op.Qtty AS '����������',
ROUND(op.PriceIn, 2) AS '�������� ����', ROUND(op.PriceOut, 2) AS '�������� ����', ROUND(op.VATIn, 2) AS '�������� ���', 
ROUND(op.VATOut, 2) AS '�������� ���', CONCAT(op.Discount, ' %') AS '��������', op.Note AS '���������', us.Name AS '��������', op.UserRealTime AS '����'

FROM Operations AS op

LEFT JOIN OperationType AS opT ON op.OperType = opT.ID
LEFT JOIN Goods as g ON op.GoodID = g.ID
LEFT JOIN Partners AS p ON op.PartnerID = p.ID 
LEFT JOIN Objects AS obj ON op.ObjectID = obj.ID
LEFT JOIN Users AS us ON op.UserID = us.ID

WHERE opT.ID = 2