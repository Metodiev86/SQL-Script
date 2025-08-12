CREATE TRIGGER [dbo].[trg_AfterInsert_Users]
ON [dbo].[Users]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [StabiDi_Log].[dbo].[Users_Log](Users_ID, Name)
    SELECT ID, Name
    FROM INSERTED;
END;