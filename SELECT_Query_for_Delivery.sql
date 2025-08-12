WITH BaseOper AS (
    SELECT 
        oper.ID AS OperID,
        oper.Acct,
        oper.ObjectID,
        oper.PartnerID,
        oper.Date,
        oper.Qtty,
        oper.PriceIn,
        oper.Qtty * oper.PriceIn AS Amount
    FROM Operations oper
    WHERE oper.OperType = 12
),
TransformedPerRow AS (
    SELECT 
        tr.RootAcct,
        tr.FromAcct,
        oper.ID AS OperID,
        SUM(oper.Qtty) AS UsedQtty
    FROM Transformations tr
    JOIN Operations oper ON tr.RootAcct = oper.Acct AND tr.RootAcct = oper.OperType
    GROUP BY tr.RootAcct, tr.FromAcct, oper.ID
),
Remaining AS (
    SELECT 
        b.Acct,
        b.ObjectID,
        b.PartnerID,
        b.Date,
        SUM(b.Amount) AS TotalAmount
    FROM BaseOper b
    LEFT JOIN TransformedPerRow tpr ON b.OperID = tpr.OperID
    WHERE tpr.UsedQtty IS NULL OR tpr.UsedQtty < b.Qtty
    GROUP BY b.Acct, b.ObjectID, b.PartnerID, b.Date
)
SELECT 
    obj.Name AS 'Обект',
    par.Company AS 'Партньор',
    r.Date AS 'Дата',
    r.Acct AS 'Документ',
    r.TotalAmount AS 'Сума'
FROM Remaining r
LEFT JOIN Objects obj ON r.ObjectID = obj.ID
LEFT JOIN Partners par ON r.PartnerID = par.ID
WHERE r.TotalAmount > 0
ORDER BY obj.Name, par.Company, r.Date, r.Acct
