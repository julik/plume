explain query plan
  SELECT typeID, key, value FROM Records 
  WHERE typeID = 2 AND (key = 'x' COLLATE binary)
  ORDER BY key, value;
