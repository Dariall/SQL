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
