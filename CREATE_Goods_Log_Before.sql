USE [StabiDi_Log]
GO

/****** Object:  Table [dbo].[Goods_Log_Before]    Script Date: 17.12.2024 ã. 11:49:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Goods_Log_Before](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Goods_ID] [int] NULL,
	[Code_Before] [nvarchar](255) NULL,
	[Name_Before] [nvarchar](255) NULL,
	[PriceIn_Before] [float] NULL,
	[PriceOut1_Before] [float] NULL,
	[PriceOut2_Before] [float] NULL,
	[PriceOut3_Before] [float] NULL,
	[PriceOut4_Before] [float] NULL,
	[PriceOut10_Before] [float] NULL,
 CONSTRAINT [PK_Goods_Log_Before] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO


