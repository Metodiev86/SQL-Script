CREATE TRIGGER trg_Update_Payments
ON dbo.Payments
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Вмъкване на старите и новите данни в Payments_Log
    INSERT INTO StabiDi_Log.dbo.Payments_Log (
        Payments_ID,
        Acct_Before, Acct_After,
        OperType_Before, OperType_After,
        PartnerID_Before, PartnerID_After,
        Qtty_Before, Qtty_After,
        Mode_Before, Mode_After,
        Sign_Before, Sign_After,
        Date_Before, Date_After,
        UserID_Before, UserID_After,
        ObjectID_Before, ObjectID_After,
        UserRealTime_Before, UserRealTime_After,
        Type_Before, Type_After,
        TransactionNumber_Before, TransactionNumber_After,
        EndDate_Before, EndDate_After
    )
    SELECT 
        d.ID AS Payments_ID,
        d.Acct AS Acct_Before, i.Acct AS Acct_After,
        d.OperType AS OperType_Before, i.OperType AS OperType_After,
        d.PartnerID AS PartnerID_Before, i.PartnerID AS PartnerID_After,
        d.Qtty AS Qtty_Before, i.Qtty AS Qtty_After,
        d.Mode AS Mode_Before, i.Mode AS Mode_After,
        d.Sign AS Sign_Before, i.Sign AS Sign_After,
        d.Date AS Date_Before, i.Date AS Date_After,
        d.UserID AS UserID_Before, i.UserID AS UserID_After,
        d.ObjectID AS ObjectID_Before, i.ObjectID AS ObjectID_After,
        d.UserRealTime AS UserRealTime_Before, GETDATE() AS UserRealTime_After,
        d.Type AS Type_Before, i.Type AS Type_After,
        d.TransactionNumber AS TransactionNumber_Before, i.TransactionNumber AS TransactionNumber_After,
        d.EndDate AS EndDate_Before, i.EndDate AS EndDate_After
    FROM 
        DELETED d
    INNER JOIN 
        INSERTED i ON d.ID = i.ID;
END;
GO
