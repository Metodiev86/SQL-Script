SELECT TOP (1000) [ID] AS 'ID Главна Група'
      ,[Name] AS 'име главна група'
      ,[Code] AS 'код главна група'
  FROM [StabiDi].[dbo].[GoodsGroups]
  WHERE Code LIKE '[A-Z][A-Z][A-Z]'
