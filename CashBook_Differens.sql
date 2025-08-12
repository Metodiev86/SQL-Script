SELECT Date AS '����', [Desc] AS '�������', (Sign * Profit) AS '����', OperationType.BG AS '��������', UserRealtime, Objects.Name AS 'O����', Users.Name AS 'O�������'
From CashBook
JOIN Objects ON Objects.ID = CashBook.ObjectID
JOIN Users ON Users.ID = CashBook.UserID
JOIN OperationType ON OperationType.ID = CashBook.OperType
WHERE FORMAT(UserRealtime, 'yy-MM-dd') != FORMAT(CashBook.Date, 'yy-MM-dd')
ORDER BY Date
