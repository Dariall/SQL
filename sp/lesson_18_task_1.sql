--MS SQL
CREATE OR ALTER PROCEDURE Stub_CheckAccountSession
    @account_id INT,
    @session_id INT,
    @status INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @status = 1;
END;
GO

--PG
CREATE OR REPLACE FUNCTION stub_check_account_session(
    account_id INT,
    session_id INT
)
RETURNS INT AS $$
BEGIN
    RETURN 1;
END; $$
