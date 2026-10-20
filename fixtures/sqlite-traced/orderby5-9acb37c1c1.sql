explain query plan
  SELECT typeID, key, value FROM Records 
  WHERE typeID = 2 AND key = 'x' 
  ORDER BY key, value;
