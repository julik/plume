CREATE TRIGGER tr1 AFTER INSERT ON t1 BEGIN
      INSERT INTO t2
        WITH xyz(x) AS (SELECT col1 FROM log_entry)
        SELECT x FROM xyz;
    END;
