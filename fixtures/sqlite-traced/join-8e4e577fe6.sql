CREATE VIEW vchain AS
    SELECT a1, b1, b2, b3, b4
      FROM t1 LEFT JOIN t2 ON a1=a2
              LEFT JOIN t3 ON a2=a3
              LEFT JOIN t4 ON a3=a4;
