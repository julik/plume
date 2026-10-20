CREATE TEMP TRIGGER x BEFORE INSERT ON t1 BEGIN
    UPDATE t1
       SET b=randomblob(10)
     WHERE b >= 'E'
       AND a < (SELECT a FROM t1 WHERE a<22 GROUP BY b);
  END;
