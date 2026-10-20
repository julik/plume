UPDATE sqlite_schema 
      SET sql = strreplace(sql, 't1', 'json_each') 
      WHERE type='index';
