SELECT max(b) OVER(
      ORDER BY SUM(
        (SELECT c FROM t2 UNION SELECT x ORDER BY c)
      )
  ) FROM t1;
