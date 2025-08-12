WITH BaseOper AS (
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
),
TransformedPerRow AS (
    SELECT 
        tr.RootAcct,
        tr.FromAcct,
        oper.ID AS OperID,
        SUM(oper.Qtty) AS UsedQtty
    FROM Transformations tr
    JOIN Operations oper 
          ON tr.RootAcct = oper.Acct AND tr.RootAcct = oper.OperType
    GROUP BY tr.RootAcct, tr.FromAcct, oper.ID
),
RemainingRows AS (
    SELECT 
        b.OperID,
        b.Acct,
        b.ObjectID,
        b.PartnerID,
        b.Date,
        b.GoodID,
        b.Qtty,
        b.PriceIn,
       (b.Qtty - ISNULL(tpr.UsedQtty, 0)) * b.PriceIn AS RemainingAmount
    FROM BaseOper b
    LEFT JOIN TransformedPerRow tpr ON b.OperID = tpr.OperID
    WHERE ISNULL(tpr.UsedQtty, 0) < b.Qtty
)
SELECT 
    obj.Name AS '�����',
    par.Company AS '��������',
    r.Date AS '����',
    r.Acct AS '��������',
	g.Code AS '���',
    g.Name AS '�������',
    r.Qtty AS '�������� ����������',
    r.RemainingAmount AS '�������� ����'
FROM RemainingRows r
LEFT JOIN Objects obj ON r.ObjectID = obj.ID
LEFT JOIN Partners par ON r.PartnerID = par.ID
LEFT JOIN Goods g ON r.GoodID = g.ID
WHERE r.Qtty > 0
ORDER BY obj.Name, par.Company, r.Date, r.Acct, g.Name
