USE [StabiDi_Log]
GO

/****** Object:  Table [dbo].[Goods_Log_After]    Script Date: 17.12.2024 ã. 11:56:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Goods_Log_After](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Goods_ID] [int] NULL,
	[Code_After] [nvarchar](255) NULL,
	[Name_After] [nvarchar](255) NULL,
	[PriceIn_After] [float] NULL,
	[PriceOut1_After] [float] NULL,
	[PriceOut2_After] [float] NULL,
	[PriceOut3_After] [float] NULL,
	[PriceOut4_After] [float] NULL,
	[PriceOut10_After] [float] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_Goods_Log_After] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO


