BULK INSERT Operations
FROM 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Operations_Import.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Разделител на полетата
    ROWTERMINATOR = '\n',   -- Разделител на редовете
    FIRSTROW = 2,            -- Пропуска заглавния ред
	CODEPAGE = '1251'      -- Указва Windows - 1251 кодиране
);