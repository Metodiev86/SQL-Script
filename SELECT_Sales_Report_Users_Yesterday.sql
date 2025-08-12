/* ������ �������� �� ��������� ��� */

SELECT COUNT(DISTINCT oper.Acct) As '���� ��������', Us.Name As '��������', SUM(oper.qtty * oper.Sign * oper.PriceOut)*(-1) As '����',  obj.Name As '�����', Oper.Date, CONVERT(DATE, DATEADD(day, -1, GETDATE())) AS Yesterday 
FROM Operations as oper
Join Users as us ON Us.ID = Oper.operatorID
Join Objects as obj ON Obj.ID = Oper.ObjectID
WHERE Oper.OperType = 2 
Group By Us.Name, Obj.Name, Oper.Date

