CREATE VIEW v5(a, B) AS
        SELECT 'a', ('B' COLLATE NOCASE) || '' FROM t0;
