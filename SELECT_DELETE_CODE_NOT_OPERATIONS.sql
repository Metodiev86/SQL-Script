SELECT g.Code AS 'Код', g.Name AS 'Продут', CASE
    WHEN CHARINDEX('_', gr.Name) > 0 THEN LEFT(gr.Name, CHARINDEX('_', gr.Name) - 1)
    ELSE gr.Name
  END AS 'Главна Група',  gr.Name AS 'Група'
FROM Goods AS g
JOIN GoodsGroups AS gr ON gr.ID = g.GroupID 
LEFT JOIN Operations AS oper ON g.ID = oper.GoodID
WHERE oper.GoodID IS NULL AND g.Deleted = -1
ORDER BY gr.Name, g.Code
