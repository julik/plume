SELECT * FROM t1 WHERE EXISTS (
      SELECT 1 FROM t2
      WHERE EXISTS (
        SELECT 1 FROM t3 WHERE t3.p=t2.x AND t3.q=t1.b
      )
  )
