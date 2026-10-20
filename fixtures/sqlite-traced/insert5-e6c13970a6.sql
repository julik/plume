EXPLAIN  
    INSERT INTO b 
    SELECT * FROM main WHERE id > 10 AND max(id1, (SELECT id FROM b)) > 10;
