/* ������ �������� ����� �� �������, �� ���� ���������� */

SELECT g.Code AS '���', g.Name AS '���', obj.Name AS '�����', st.Qtty AS '����������'
FROM Store as st
JOIN Goods AS g ON g.ID = st.GoodID
JOIN Objects AS obj ON obj.ID = st.ObjectID
WHERE st.Qtty <> 0 and g.Deleted = -1
