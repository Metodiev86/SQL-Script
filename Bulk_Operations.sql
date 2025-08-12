BULK INSERT Operations
FROM 'D:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\Operations_Import.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Разделител на полетата
    ROWTERMINATOR = '\n',   -- Разделител на редовете
    FIRSTROW = 2,            -- Пропуска заглавния ред
	CODEPAGE = '65001'      -- Указва UTF-8 кодиране
);