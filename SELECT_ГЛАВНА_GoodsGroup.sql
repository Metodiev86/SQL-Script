SELECT TOP (1000) [ID] AS 'ID ������ �����'
      ,[Name] AS '��� ������ �����'
      ,[Code] AS '��� ������ �����'
  FROM [StabiDi].[dbo].[GoodsGroups]
  WHERE Code LIKE '[A-Z][A-Z][A-Z]'
