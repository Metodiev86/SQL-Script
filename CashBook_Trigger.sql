CREATE TRIGGER Trigger_InsertLog
ON CashBook
AFTER INSERT
AS
BEGIN
    -- Дефиниране на пътя за CSV файла
    DECLARE @FilePath NVARCHAR(255) = 'D:\Stoyan\SQLScript\SatbiDi\Stabil_Di_REAL\Cash_Book_Corection\Log_' + CONVERT(VARCHAR, GETDATE(), 112) + '.csv';
    
    -- Експортиране на новите записи в CSV файл с помощта на BCP
    DECLARE @BCPCommand NVARCHAR(MAX) = 
        'bcp "SELECT Code, Date, [Desc], OperType, Sign, Profit, UserID, UserRealtime, ObjectID ' +
        'FROM CashBook WHERE ID IN (SELECT ID FROM INSERTED)" ' +
        'queryout "' + @FilePath + '" -c -t, -T -S ' + @@SERVERNAME;

    -- Изпълнение на командата чрез xp_cmdshell
    EXEC xp_cmdshell @BCPCommand;
END
