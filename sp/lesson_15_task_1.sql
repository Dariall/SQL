CREATE OR ALTER PROCEDURE dbo.func
    @КодНаправления INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (
        SELECT 1 FROM dbo.[Направления]
        WHERE [Код направления] = @КодНаправления
    )
    BEGIN
        RAISERROR(N'Некорректный код направления', 16, 1);
        RETURN;
    END
  
    SELECT 
        N.[Наименование] AS [Направление],
        STRING_AGG(S.[Фамилия], ', ') AS [Фамилии зачисленных студентов]
    FROM dbo.[Направления] N
    LEFT JOIN dbo.[Студенты] S
        ON S.[Код направления] = N.[Код направления]
        AND S.[Экзаменационный балл] >= N.[Минимальный балл]
    WHERE N.[Код направления] = @КодНаправления
    GROUP BY N.[Наименование];
END;
