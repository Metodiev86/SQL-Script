/* �������� �� ����� Knauf ��������� �� ���������� �� 2024�., �� ���� � �� ���������� */

SELECT
    GoodsGroups.Name As '�����',
    Goods.Name As '�����',
    Goods.Measure1 As '�����',
    SUM(CASE WHEN Operations.Date >= '2024-01-01' AND Operations.Date <= '2024-03-31' THEN op.TotalPice ELSE 0 END) As Q1_��������,
    SUM(CASE WHEN Operations.Date >= '2024-04-01' AND Operations.Date <= '2024-06-30' THEN op.TotalPice ELSE 0 END) As Q2_��������,
    SUM(CASE WHEN Operations.Date >= '2024-07-01' AND Operations.Date <= '2024-09-30' THEN op.TotalPice ELSE 0 END) As Q3_��������,
    SUM(CASE WHEN Operations.Date >= '2024-10-01' AND Operations.Date <= '2024-12-31' THEN op.TotalPice ELSE 0 END) As Q4_��������,
    SUM(CASE WHEN Operations.Date >= '2024-01-01' AND Operations.Date <= '2024-03-31' THEN Operations.QTTY ELSE 0 END) As Q1_����������,
    SUM(CASE WHEN Operations.Date >= '2024-04-01' AND Operations.Date <= '2024-06-30' THEN Operations.QTTY ELSE 0 END) As Q2_����������,
    SUM(CASE WHEN Operations.Date >= '2024-07-01' AND Operations.Date <= '2024-09-30' THEN Operations.QTTY ELSE 0 END) As Q3_����������,
    SUM(CASE WHEN Operations.Date >= '2024-10-01' AND Operations.Date <= '2024-12-31' THEN Operations.QTTY ELSE 0 END) As Q4_����������
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