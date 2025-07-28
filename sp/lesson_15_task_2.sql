-- Добавляем столбцы
ALTER TABLE dbo.[Направления]
ADD [Всего мест] INT,
    [Набор окончен] BIT DEFAULT 0;

-- Заполняем поля
UPDATE dbo.[Направления]
SET [Всего мест] = CASE [Код направления]
    WHEN 1 THEN 2
    WHEN 2 THEN 2
    WHEN 3 THEN 1
END;

-- Триггер-функция
GO
CREATE OR ALTER TRIGGER trg
ON dbo.[Студенты]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @КодНаправления INT;

    DECLARE cur CURSOR FOR
    SELECT DISTINCT [Код направления] FROM inserted;

    OPEN cur;
    FETCH NEXT FROM cur INTO @КодНаправления;

    WHILE @@FETCH_STATUS = 0
    BEGIN
    
        DECLARE @Подходящие INT;
        SELECT @Подходящие = COUNT(*)
        FROM dbo.[Студенты] S
        JOIN dbo.[Направления] N ON S.[Код направления] = N.[Код направления]
        WHERE S.[Код направления] = @КодНаправления
          AND S.[Экзаменационный балл] >= N.[Минимальный балл];

        DECLARE @ВсегоМест INT;
        SELECT @ВсегоМест = [Всего мест]
        FROM dbo.[Направления]
        WHERE [Код направления] = @КодНаправления;

        UPDATE dbo.[Направления]
        SET [Набор окончен] = CASE
            WHEN @Подходящие >= @ВсегоМест THEN 1
            ELSE 0
        END
        WHERE [Код направления] = @КодНаправления;

        FETCH NEXT FROM cur INTO @КодНаправления;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO
