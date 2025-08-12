CREATE TABLE CashBook_Log_Before (
    ID int NOT NULL PRIMARY KEY,
    CashBookID int NOT NULL,
    Date_Before smalldatetime NULL,
    Desc_Before nvarchar(255) NULL,
    OperType_Before int NULL,
    Sign_Before int NULL,
    Profit_Before float NULL,
    UserID_Before int NULL,
    UserRealtime_Before datetime NULL,
    ObjectID_Before int NULL
);

CREATE TABLE CashBook_Log_After (
    ID int NOT NULL PRIMARY KEY,
    CashBookID int NOT NULL,
    Date_After smalldatetime NULL,
    Desc_After nvarchar(255) NULL,
    OperType_After int NULL,
    Sign_After int NULL,
    Profit_After float NULL,
    UserID_After int NULL,
    UserRealtime_After datetime NULL,
    ObjectID_After int NULL
);
