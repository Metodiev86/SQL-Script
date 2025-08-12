/* Заявка за доставка, които имат количества по тях */

SELECT 
    obj.Name AS 'Обект',
    par.Company AS 'Партньор',
    r.Date AS 'Дата',
    r.Acct AS 'Документ',
    SUM((r.Qtty - ISNULL(tpr.UsedQtty, 0)) * r.PriceIn) AS 'Оставаща сума'
FROM (
    SELECT 
        oper.ID AS OperID,
        oper.Acct,
        oper.ObjectID,
        oper.PartnerID,
        oper.Date,
        oper.GoodID,
        oper.Qtty,
        oper.PriceIn
    FROM Operations oper
    WHERE oper.OperType = 12
) AS r
LEFT JOIN (
    SELECT 
        oper.ID AS OperID,
        SUM(oper.Qtty) AS UsedQtty
    FROM Transformations tr
    JOIN Operations oper 
        ON tr.RootAcct = oper.Acct AND tr.RootAcct = oper.OperType
    GROUP BY oper.ID
) AS tpr
    ON r.OperID = tpr.OperID
LEFT JOIN Objects obj ON r.ObjectID = obj.ID
LEFT JOIN Partners par ON r.PartnerID = par.ID
WHERE ISNULL(tpr.UsedQtty, 0) < r.Qtty
GROUP BY 
    obj.Name,
    par.Company,
    r.Date,
    r.Acct
	