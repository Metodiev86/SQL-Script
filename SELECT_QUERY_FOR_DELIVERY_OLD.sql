SELECT obj.[Name] AS "Обект", par.Company AS 'Партньор', oper.[Date] AS 'Дата', oper.Acct AS 'Документ', g.Code AS "Код", g.Name AS 'Продукт', oper.Qtty, SUM(oper.Qtty*oper.PriceIn) as 'Сума'
  FROM Operations AS oper
  LEFT JOIN [Objects] AS obj ON oper.ObjectID = obj.ID
  LEFT JOIN Partners AS par ON oper.PartnerID = par.ID
  LEFT JOIN Transformations AS tr ON oper.Acct = tr.FromAcct and oper.OperType = tr.FromOperType
  LEFT JOIN Goods as g ON oper.GoodID = g.ID
  WHERE                             oper.OperType = 12
                              AND
                                            tr.FromAcct IS NULL
GROUP BY oper.Acct, obj.Name, par.Company, oper.Date, g.Code, g.Name, oper.Qtty
HAVING SUM(oper.Qtty*oper.PriceIn) > 0
