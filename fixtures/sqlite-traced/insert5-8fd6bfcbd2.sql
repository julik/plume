EXPLAIN  
    INSERT INTO b 
      SELECT * FROM main WHERE id = (SELECT id1 FROM b WHERE main.id = b.id)
