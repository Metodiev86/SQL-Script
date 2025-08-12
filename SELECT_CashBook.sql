SELECT 
    [Date] AS 'Дата', 
    [Desc] AS 'Описание', 
    [Objects].[Name] AS 'Обект',
    Users.[Name] AS 'Потребител',
    StabiDi_Log.dbo.Operations.[Name] AS 'Операция', 

    -- Колона "Приход"
    CASE 
        WHEN ([Sign] * Profit) > 0 THEN [Sign] * Profit
        ELSE NULL
    END AS 'Приход',

    -- Колона "Разход"
    CASE 
        WHEN ([Sign] * Profit) < 0 THEN ABS([Sign] * Profit)
        ELSE NULL
    END AS 'Разход',

    -- Колона за седмицата (начална и крайна дата в една колона)
    CONVERT(VARCHAR(10), DATEADD(WK, DATEDIFF(WK, 0, [Date]), 0), 103) + ' до ' + 
    CONVERT(VARCHAR(10), DATEADD(WK, DATEDIFF(WK, 0, [Date]), 6), 103) AS 'Период на седмица'

FROM CashBook
JOIN StabiDi_Log.dbo.Operations ON StabiDi_Log.dbo.Operations.ID = CashBook.OperType
JOIN [Objects] ON Objects.ID = CashBook.ObjectID
JOIN Users ON Users.ID = CashBook.UserID
ORDER BY UserRealTime DESC
