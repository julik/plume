CREATE VIEW v2 AS
    WITH t4(Name) AS (VALUES ('A'), ('B'))
    SELECT Name Name FROM t4;
