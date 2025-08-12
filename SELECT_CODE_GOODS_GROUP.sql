SELECT 
  CASE
    WHEN CHARINDEX('_', gr.Name) > 0 THEN LEFT(gr.Name, CHARINDEX('_', gr.Name) - 1)
    ELSE gr.Name
  END AS "������ �����",  
  gr.Name AS '�����', 
  g.Code AS '���',
  g.Name as '�������'
FROM Goods AS g
JOIN GoodsGroups AS gr ON gr.ID = g.GroupID
WHERE g.Deleted = 0
ORDER BY g.Code;