USE [StabiDi]
GO
/****** Object:  Trigger [dbo].[trg_AfterUpdate_Objects]    Script Date: 17.12.2024 г. 8:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_AfterUpdate_Objects] 
ON [dbo].[Objects]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Проверка дали полето Name е било актуализирано
    IF UPDATE(Name)
    BEGIN
        MERGE [StabiDi_Log].[dbo].[Objects_Log] AS Target
        USING INSERTED AS Source
        ON Target.Objects_ID = Source.ID 
        WHEN MATCHED THEN
            UPDATE SET 
                Name = Source.Name;
    END
END;
