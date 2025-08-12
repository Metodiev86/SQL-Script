BULK INSERT Operations
FROM 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Operations_Import.csv'
WITH (
    FIELDTERMINATOR = ';',  -- ���������� �� ��������
    ROWTERMINATOR = '\n',   -- ���������� �� ��������
    FIRSTROW = 2,            -- �������� ��������� ���
	CODEPAGE = '1251'      -- ������ Windows - 1251 ��������
);