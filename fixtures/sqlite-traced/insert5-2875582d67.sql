INSERT INTO b 
    SELECT * FROM main 
    WHERE id > 10 AND (SELECT count(*) FROM v2 GROUP BY main.id)
