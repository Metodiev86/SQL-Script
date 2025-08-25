--Как да ги ползваш:

--Отвори SQL Server Management Studio.

--Свържи се с Windows Authentication.

--Отвори нов Query прозорец.

--Постави кода и го изпълни (F5).

--Рестартирай SQL Server услугата:

--В SSMS десен бутон на сървъра Restart.


-- 1. Включваме Mixed Mode Authentication
EXEC xp_instance_regwrite 
    N'HKEY_LOCAL_MACHINE',
    N'Software\Microsoft\MSSQLServer\MSSQLServer',
    N'LoginMode',
    REG_DWORD,
    2;   -- 2 = Mixed Mode, 1 = само Windows

-- 2. Активираме sa акаунта
ALTER LOGIN sa ENABLE;

-- 3. Задаваме нова парола за sa (сложи твоя парола вместо MyStrongPassword123!)
ALTER LOGIN sa WITH PASSWORD = 'MyStrongPassword123';

-- 4. Даваме sysadmin роля на sa (по принцип вече я има, но за всеки случай)
ALTER SERVER ROLE sysadmin ADD MEMBER sa;
