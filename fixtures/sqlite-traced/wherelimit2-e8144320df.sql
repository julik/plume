UPDATE ft SET x='hello' WHERE ft MATCH 'a' 
          ORDER BY rowid DESC LIMIT 2 OFFSET 2;
