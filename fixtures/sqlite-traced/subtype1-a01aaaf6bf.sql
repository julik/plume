CREATE VIEW v0(c0) AS SELECT CASE WHEN 1 THEN json_patch('1', '1') END 
                        FROM t0 GROUP BY t0.c0;
