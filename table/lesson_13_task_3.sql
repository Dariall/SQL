IF NOT EXISTS (
    SELECT 1 FROM sys.columns 
    WHERE Name = N'Код направления' AND Object_ID = Object_ID(N'dbo.Студенты')
)
BEGIN
    ALTER TABLE dbo.Студенты
    ADD [Код направления] INT NULL;
END

UPDATE S
SET S.[Код направления] = N.[Код направления]
FROM dbo.Студенты S
JOIN dbo.Направления N ON S.[Направление] = N.[Наименование];
