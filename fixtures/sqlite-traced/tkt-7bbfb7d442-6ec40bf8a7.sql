CREATE TRIGGER t3t AFTER INSERT ON t3 WHEN new.t3_d IS NULL BEGIN
    UPDATE t3 SET t3_d = (
      SELECT d FROM 
        (SELECT * FROM t2 WHERE (new.t3_a%2)=(rowid%2) LIMIT 10),
        (SELECT * FROM t1 WHERE (new.t3_a%2)=(rowid%2) LIMIT 10)
      WHERE a = new.t3_a AND b = c
    ) WHERE t3_a = new.t3_a;
  END;
