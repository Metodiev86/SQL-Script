SELECT Acct AS 'Стокова',  Users.Name AS 'Оператор',  DATEADD(day, -1, CONVERT(date, GETDATE())) AS YesterdayDateOnly
FROM Operations
JOIN Users ON Operations.UserID = Users.ID
WHERE Date = DATEADD(day, -1, CONVERT(date, GETDATE()))  and OperType = 2
GROUP BY Acct, Users.Name