CREATE TRIGGER trg_Update_Operations
ON dbo.Operations
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Вмъкване на старите и новите данни в Operations_Log
    INSERT INTO dbo.Operations_Log (
        Operations_ID,
        OperType_Before, OperType_After,
        Acct_Before, Acct_After,
        GoodID_Before, GoodID_After,
        PartnerID_Before, PartnerID_After,
        ObjectID_Before, ObjectID_After,
        OperatorID_Before, OperatorID_After,
        Qtty_Before, Qtty_After,
        Sign_Before, Sign_After,
        PriceIn_Before, PriceIn_After,
        PriceOut_Before, PriceOut_After,
        VATIn_Before, VATIn_After,
        VATOut_Before, VATOut_After,
        Discount_Before, Discount_After,
        CurrencyID_Before, CurrencyID_After,
        CurrencyRate_Before, CurrencyRate_After,
        Date_Before, Date_After,
        Lot_Before, Lot_After,
        LotID_Before, LotID_After,
        Note_Before, Note_After,
        SrcDocID_Before, SrcDocID_After,
        UserID_Before, UserID_After,
        UserRealTime_Before, UserRealTime_After
    )
    SELECT
        d.ID AS Operations_ID,
        d.OperType AS OperType_Before, i.OperType AS OperType_After,
        d.Acct AS Acct_Before, i.Acct AS Acct_After,
        d.GoodID AS GoodID_Before, i.GoodID AS GoodID_After,
        d.PartnerID AS PartnerID_Before, i.PartnerID AS PartnerID_After,
        d.ObjectID AS ObjectID_Before, i.ObjectID AS ObjectID_After,
        d.OperatorID AS OperatorID_Before, i.OperatorID AS OperatorID_After,
        d.Qtty AS Qtty_Before, i.Qtty AS Qtty_After,
        d.Sign AS Sign_Before, i.Sign AS Sign_After,
        d.PriceIn AS PriceIn_Before, i.PriceIn AS PriceIn_After,
        d.PriceOut AS PriceOut_Before, i.PriceOut AS PriceOut_After,
        d.VATIn AS VATIn_Before, i.VATIn AS VATIn_After,
        d.VATOut AS VATOut_Before, i.VATOut AS VATOut_After,
        d.Discount AS Discount_Before, i.Discount AS Discount_After,
        d.CurrencyID AS CurrencyID_Before, i.CurrencyID AS CurrencyID_After,
        d.CurrencyRate AS CurrencyRate_Before, i.CurrencyRate AS CurrencyRate_After,
        d.Date AS Date_Before, i.Date AS Date_After,
        d.Lot AS Lot_Before, i.Lot AS Lot_After,
        d.LotID AS LotID_Before, i.LotID AS LotID_After,
        d.Note AS Note_Before, i.Note AS Note_After,
        d.SrcDocID AS SrcDocID_Before, i.SrcDocID AS SrcDocID_After,
        d.UserID AS UserID_Before, i.UserID AS UserID_After,
        d.UserRealTime AS UserRealTime_Before, GETDATE() AS UserRealTime_After
    FROM
        DELETED d
    INNER JOIN
        INSERTED i ON d.ID = i.ID;
END;
GO
