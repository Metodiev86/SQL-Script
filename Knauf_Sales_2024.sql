/* Продажби за група Knauf разделена за тримесечия на 2024г., по цени и по количества */

SELECT
    GoodsGroups.Name As 'Група',
    Goods.Name As 'Стока',
    Goods.Measure1 As 'Мярка',
    SUM(CASE WHEN Operations.Date >= '2024-01-01' AND Operations.Date <= '2024-03-31' THEN op.TotalPice ELSE 0 END) As Q1_Продажби,
    SUM(CASE WHEN Operations.Date >= '2024-04-01' AND Operations.Date <= '2024-06-30' THEN op.TotalPice ELSE 0 END) As Q2_Продажби,
    SUM(CASE WHEN Operations.Date >= '2024-07-01' AND Operations.Date <= '2024-09-30' THEN op.TotalPice ELSE 0 END) As Q3_Продажби,
    SUM(CASE WHEN Operations.Date >= '2024-10-01' AND Operations.Date <= '2024-12-31' THEN op.TotalPice ELSE 0 END) As Q4_Продажби,
    SUM(CASE WHEN Operations.Date >= '2024-01-01' AND Operations.Date <= '2024-03-31' THEN Operations.QTTY ELSE 0 END) As Q1_Количества,
    SUM(CASE WHEN Operations.Date >= '2024-04-01' AND Operations.Date <= '2024-06-30' THEN Operations.QTTY ELSE 0 END) As Q2_Количества,
    SUM(CASE WHEN Operations.Date >= '2024-07-01' AND Operations.Date <= '2024-09-30' THEN Operations.QTTY ELSE 0 END) As Q3_Количества,
    SUM(CASE WHEN Operations.Date >= '2024-10-01' AND Operations.Date <= '2024-12-31' THEN Operations.QTTY ELSE 0 END) As Q4_Количества
FROM
    operations
JOIN
    Goods ON Operations.GoodID = Goods.ID
JOIN
    GoodsGroups ON Goods.GroupID = GoodsGroups.ID
CROSS APPLY (
    SELECT ((Operations.Qtty * Operations.PriceOut * Operations.Sign) * (-1)) AS TotalPice
) AS op
WHERE
    Operations.OperType = 2
    AND GoodsGroups.ID IN (93, 94, 95, 96, 5254, 5255, 5529, 5650)
    AND Operations.Date >= '2024-01-01' AND Operations.Date <= '2024-12-31'
GROUP BY 
    GoodsGroups.Name,
    Goods.Name,
    Goods.Measure1
ORDER BY
	GoodsGroups.Name,
	Goods.Name,
	Goods.Measure1