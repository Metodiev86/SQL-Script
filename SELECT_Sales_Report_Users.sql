SELECT COUNT(DISTINCT oper.Acct) As 'Брой продажби' , Us.Name As 'Оператор', SUM(oper.qtty * oper.Sign * oper.PriceOut)*(-1) As 'Сума', obj.Name As 'Обект'
FROM Operations As oper
JOIN Users As Us ON us.ID = oper.OperatorID
JOIN Objects As obj ON obj.ID = oper.ObjectID
WHERE oper.OperType =2 and oper.date >= '2025-05-01' and oper.Date <= '2025-05-31'
GROUP BY Us.Name, obj.Name