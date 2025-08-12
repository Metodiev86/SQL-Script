CREATE VIEW Goods_QTTY_Objects AS 
	
	SELECT g.ID AS '������� ID', g.Code AS '��� �� �������', 
	g.BarCode1 AS '������', g.Catalog1 AS '��������� No', gr.Name AS '����� �������', 
	g.Name AS '�������', o.Name AS '�����', 
	s.Qtty AS '����������', CASE  
							WHEN g.Deleted  = 0 THEN '�������'
							WHEN g.Deleted = -1 THEN '������'
							END AS '������',
											CASE 
											WHEN s.qtty < 0  THEN '�� �����'
											WHEN g.Deleted = -1 THEN '���������'
											ELSE '� ���������'
											END AS '������ ����������'

	FROM Goods AS g
	LEFT JOIN GoodsGroups as gr ON g.GroupID = gr.ID
	LEFT JOIN Store AS s ON  g.ID = s.GoodID
	LEFT JOIN Objects AS o ON s.ObjectID = o.ID


