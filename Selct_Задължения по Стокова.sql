SELECT  [ID]
      ,[Acct]
      ,[OperType]
      ,[PartnerID]
      ,[Qtty]
      ,[Mode]
      ,[Sign]
      ,[Date]
      ,[UserID]
      ,[ObjectID]
      ,[UserRealTime]
      ,[Type]
      ,[TransactionNumber]
      ,[EndDate]
  FROM [StabiDi].[dbo].[Payments]
	  where acct = 20002812







	  SELECT SUM(qtty * mode) from Payments
	  where acct = 20002812



