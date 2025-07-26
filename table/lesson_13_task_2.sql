IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Направления]') AND type = N'U')
BEGIN
    CREATE TABLE [dbo].[Направления] (
        [Код направления] INT PRIMARY KEY,
        [Наименование] NVARCHAR(100) NOT NULL,
        [Минимальный балл] INT NOT NULL
    );
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[Направления] WHERE [Код направления] = 1)
    INSERT INTO [dbo].[Направления] ([Код направления], [Наименование], [Минимальный балл])
    VALUES (1, N'История', 160);

IF NOT EXISTS (SELECT 1 FROM [dbo].[Направления] WHERE [Код направления] = 2)
    INSERT INTO [dbo].[Направления] ([Код направления], [Наименование], [Минимальный балл])
    VALUES (2, N'Право', 180);

IF NOT EXISTS (SELECT 1 FROM [dbo].[Направления] WHERE [Код направления] = 3)
    INSERT INTO [dbo].[Направления] ([Код направления], [Наименование], [Минимальный балл])
    VALUES (3, N'Физика', 200);
