BULK INSERT Operations
FROM 'D:\SQL2022\MSSQL16.MSSQLSERVER\MSSQL\DATA\Operations_Import.csv'
WITH (
    FIELDTERMINATOR = ';',  -- ���������� �� ��������
    ROWTERMINATOR = '\n',   -- ���������� �� ��������
    FIRSTROW = 2,            -- �������� ��������� ���
	CODEPAGE = '65001'      -- ������ UTF-8 ��������
);