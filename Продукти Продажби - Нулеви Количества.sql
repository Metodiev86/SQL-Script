SELECT g.Code, g.Name, oper.Date
FROM Operations AS oper
INNER JOIN Goods AS g ON oper.GoodID = g.ID
INNER JOIN Store AS s ON s.GoodID = g.ID
INNER Join Objects as Obj ON Obj.ID = s.ObjectID
WHERE g.Deleted = 0 and s.Qtty = 0 and (oper.OperType = 2 or oper.OperType = 1)
