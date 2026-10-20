CREATE TRIGGER t1tr UPDATE ON t1 BEGIN
    UPDATE t1 SET b=x'2222' FROM t2;
    UPDATE t1
       SET b = (SELECT a IN (SELECT a
                               FROM t1
                              WHERE (b,a) IN (SELECT rowid, d
                                                FROM t3
                                             )
                            )
                  FROM t1 NATURAL RIGHT JOIN t1
               );
  END;
