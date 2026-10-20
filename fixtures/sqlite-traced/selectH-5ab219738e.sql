SELECT DISTINCT name COLLATE rtrim FROM sqlite_schema 
    UNION ALL 
  SELECT a FROM t1
