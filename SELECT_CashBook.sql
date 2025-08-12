SELECT 
    [Date] AS '����', 
    [Desc] AS '��������', 
    [Objects].[Name] AS '�����',
    Users.[Name] AS '����������',
    StabiDi_Log.dbo.Operations.[Name] AS '��������', 

    -- ������ "������"
    CASE 
        WHEN ([Sign] * Profit) > 0 THEN [Sign] * Profit
        ELSE NULL
    END AS '������',

    -- ������ "������"
    CASE 
        WHEN ([Sign] * Profit) < 0 THEN ABS([Sign] * Profit)
        ELSE NULL
    END AS '������',

    -- ������ �� ��������� (������� � ������ ���� � ���� ������)
    CONVERT(VARCHAR(10), DATEADD(WK, DATEDIFF(WK, 0, [Date]), 0), 103) + ' �� ' + 
    CONVERT(VARCHAR(10), DATEADD(WK, DATEDIFF(WK, 0, [Date]), 6), 103) AS '������ �� �������'

FROM CashBook
JOIN StabiDi_Log.dbo.Operations ON StabiDi_Log.dbo.Operations.ID = CashBook.OperType
JOIN [Objects] ON Objects.ID = CashBook.ObjectID
JOIN Users ON Users.ID = CashBook.UserID
ORDER BY UserRealTime DESC
