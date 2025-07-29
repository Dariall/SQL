--MS SQL
CREATE OR ALTER PROCEDURE GetUsersByProduct
    @account_id INT,
    @session_id INT,
    @product_name VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CAST(1001 AS INT) AS user_id,
        CAST('type_1' AS VARCHAR(50)) AS product_type,
        CAST('admin' AS VARCHAR(50)) AS user_type,
        @session_id AS session_id,
        CAST(1 AS INT) AS status

    UNION ALL

    SELECT 
        1002,
        'type_2',
        'user',
        @session_id,
        1;
END;
GO

--PG

CREATE OR REPLACE FUNCTION get_users_by_product(
    account_id INT,
    session_id INT,
    product_name VARCHAR
)
RETURNS TABLE (
    user_id INT,
    product_type TEXT,
    user_type TEXT,
    session_id INT,
    status INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        1001,
        'type_1',
        'admin',
        session_id,
        1
    UNION ALL
    SELECT 
        1002,
        'type_2',
        'user',
        session_id,
        1;
END;
$$ 

