SELECT [Desc] AS 'Събитие', (Sign * Profit) AS 'Сума', OperationType.BG AS 'Операция', UserRealtime, Objects.Name AS 'Oбект', Users.Name AS 'Oператор'
From CashBook
JOIN Objects ON Objects.ID = CashBook.ObjectID
JOIN Users ON Users.ID = CashBook.UserID
JOIN OperationType ON OperationType.ID = CashBook.OperType
