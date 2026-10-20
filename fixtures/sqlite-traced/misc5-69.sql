SELECT * FROM logs WHERE logs.oid >= (SELECT head FROM logs_base) 
      UNION ALL 
      SELECT * FROM logs 
      LIMIT (SELECT lmt FROM logs_base) ;
