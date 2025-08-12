/* Заявка за доставка, които имат количества по тях  със стоките към тях*/

SELECT 
    r.Acct AS 'Документ',
    g.Code AS 'Код',
    g.Measure1 AS 'Мярка',     
    g.Name AS 'Артикул',
    r.Qtty AS 'Оставащо количество',
    r.RemainingAmount AS 'Оставаща сума'
FROM (
    SELECT 
        b.OperID,
        b.Acct,
        b.ObjectID,
        b.PartnerID,
        b.Date,
        b.GoodID,
        b.Qtty,
        SUM((b.Qtty - ISNULL(tpr.UsedQtty, 0)) * b.PriceIn) AS RemainingAmount
    FROM (
        SELECT 
            oper.ID AS OperID,
            oper.Acct,
            oper.ObjectID,
            oper.PartnerID,
            oper.Date,
            oper.GoodID,
            oper.Qtty,
            oper.PriceIn,
            oper.Qtty * oper.PriceIn AS Amount
        FROM Operations oper
        WHERE oper.OperType = 12
    ) AS b
    LEFT JOIN (
        SELECT 
            tr.RootAcct,
            tr.FromAcct,
            oper.ID AS OperID,
            SUM(oper.Qtty) AS UsedQtty
        FROM Transformations tr
        JOIN Operations oper 
            ON tr.RootAcct = oper.Acct AND tr.RootAcct = oper.OperType
        GROUP BY tr.RootAcct, tr.FromAcct, oper.ID
    ) AS tpr
    ON b.OperID = tpr.OperID
    WHERE ISNULL(tpr.UsedQtty, 0) < b.Qtty
	GROUP BY 
    b.OperID,
    b.Acct,
    b.ObjectID,
    b.PartnerID,
    b.Date,
    b.GoodID,
    b.Qtty
) AS r
LEFT JOIN Objects obj ON r.ObjectID = obj.ID
LEFT JOIN Partners par ON r.PartnerID = par.ID
LEFT JOIN Goods g ON r.GoodID = g.ID
WHERE r.Qtty > 0
