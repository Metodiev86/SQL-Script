CREATE TRIGGER [dbo].[trg_AfterUpdate_Users]
ON [dbo].[Users]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(Name)
    BEGIN
        MERGE [StabiDi_Log].[dbo].[Users_Log] AS Target
        USING INSERTED AS Source
        ON Target.Users_ID = Source.ID 
        WHEN MATCHED THEN
            UPDATE SET 
                Name = Source.Name;
    END
END;

