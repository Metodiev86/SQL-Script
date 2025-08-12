USE [StabiDi]
GO

CREATE TRIGGER [dbo].[trg_UpdateEmail_Partners]
ON [dbo].[Partners]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- ������������� �� eMail ���� ��� ��� �������� � �� ������� 'invoice@stabil-di.com'
    UPDATE p
    SET p.eMail = 
        CASE 
            WHEN CHARINDEX('invoice@stabil-di.com', p.eMail) = 0 
            THEN RTRIM(p.eMail) + ', invoice@stabil-di.com'
            ELSE p.eMail -- ��� ���� �������, ������ ����������
        END
    FROM [dbo].[Partners] p
    INNER JOIN INSERTED i ON p.ID = i.ID
    WHERE (UPDATE(eMail) OR i.eMail IS NOT NULL)
      AND ISNULL(RTRIM(i.eMail), '') <> ''; -- ������� ��, �� ������ �� � ������
END;
GO
