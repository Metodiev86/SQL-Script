SELECT Us.Name As '��������', SUM(oper.qtty * oper.Sign * oper.PriceOut)*(-1) As '����', COUNT(oper.Acct) As '���� ��������', obj.Name As '�����', Oper.Date, CONVERT(DATE, DATEADD(day, -1, GETDATE())) AS Yesterday 
FROM Operations As oper
JOIN Users As Us ON us.ID = oper.OperatorID
JOIN Objects As obj ON obj.ID = oper.ObjectID
WHERE oper.OperType =2 
GROUP BY Us.Name, obj.Name, oper.Date


