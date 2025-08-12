CREATE TRIGGER PreventDeleteDeliveryDocuments
ON [dbo].[Documents]
AFTER DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE OperType = 1)
    BEGIN
        RAISERROR ('Cannot delete delivery documents.', 16, 1)
        ROLLBACK TRANSACTION
    END
END
