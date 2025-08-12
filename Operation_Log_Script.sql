USE [StabiDi_Log]
GO

/****** Object:  Table [dbo].[Operations_Log]    Script Date: 29.11.2024 ã. 14:06:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Operations_Log](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Operations_ID] [int] NOT NULL,
	[OperType_Before] [int] NULL,
	[OperType_After] [int] NULL,
	[Acct_Before] [int] NULL,
	[Acct_After] [int] NULL,
	[GoodID_Before] [int] NULL,
	[GoodID_After] [int] NULL,
	[PartnerID_Before] [int] NULL,
	[PartnerID_After] [int] NULL,
	[ObjectID_Before] [int] NULL,
	[ObjectID_After] [int] NULL,
	[OperatorID_Before] [int] NULL,
	[OperatorID_After] [int] NULL,
	[Qtty_Before] [float] NULL,
	[Qtty_After] [float] NULL,
	[Sign_Before] [int] NULL,
	[Sign_After] [int] NULL,
	[PriceIn_Before] [float] NULL,
	[PriceIn_After] [float] NULL,
	[PriceOut_Before] [float] NULL,
	[PriceOut_After] [float] NULL,
	[VATIn_Before] [float] NULL,
	[VATIn_After] [float] NULL,
	[VATOut_Before] [float] NULL,
	[VATOut_After] [float] NULL,
	[Discount_Before] [float] NULL,
	[Discount_After] [float] NULL,
	[CurrencyID_Before] [int] NULL,
	[CurrencyID_After] [int] NULL,
	[CurrencyRate_Before] [float] NULL,
	[CurrencyRate_After] [float] NULL,
	[Date_Before] [smalldatetime] NULL,
	[Date_After] [smalldatetime] NULL,
	[LotID_Before] [int] NULL,
	[LotID_After] [int] NULL,
	[SrcDocID_Before] [int] NULL,
	[SrcDocID_After] [int] NULL,
	[UserID_Before] [int] NULL,
	[UserID_After] [int] NULL,
	[UserRealTime_Before] [datetime] NULL,
	[UserRealTime_After] [datetime] NULL,
 CONSTRAINT [PK_Operations_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


