SELECT 
  CASE
    WHEN CHARINDEX('_', gr.Name) > 0 THEN LEFT(gr.Name, CHARINDEX('_', gr.Name) - 1)
    ELSE gr.Name
  END AS "Главна Група",  
  gr.Name AS 'Група', 
  g.Code AS 'Код',
  g.Name as 'Продукт'
FROM Goods AS g
JOIN GoodsGroups AS gr ON gr.ID = g.GroupID
WHERE g.Deleted = 0
ORDER BY g.Code;