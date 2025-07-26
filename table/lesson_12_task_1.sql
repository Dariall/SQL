IF NOT EXISTS (
    SELECT * FROM sysobjects WHERE name = N'Студенты' AND xtype = 'U'
)
BEGIN
    CREATE TABLE Студенты (
        Идентификатор INT PRIMARY KEY,
        Имя NVARCHAR(100) NOT NULL,
        Фамилия NVARCHAR(100) NOT NULL
    );
END

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = N'Студенты' AND COLUMN_NAME = N'Балл'
)
BEGIN
    ALTER TABLE Студенты
    ADD [Экзаменационный балл] INT;
END

IF NOT EXISTS (
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = N'Студенты' AND COLUMN_NAME = N'Направление'
)
BEGIN
    ALTER TABLE Студенты
    ADD [Направление] NVARCHAR(100);
END
