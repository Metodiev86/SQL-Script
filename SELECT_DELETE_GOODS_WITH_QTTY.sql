/* Всички продукти които са изтрити, но имат количества */

SELECT g.Code AS 'Код', g.Name AS 'Име', obj.Name AS 'Обект', st.Qtty AS 'Количество'
FROM Store as st
JOIN Goods AS g ON g.ID = st.GoodID
JOIN Objects AS obj ON obj.ID = st.ObjectID
WHERE st.Qtty <> 0 and g.Deleted = -1
