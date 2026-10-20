SELECT subq_1.c_0 as c_0 
  FROM ( SELECT 0 as c_0) as subq_1
  WHERE (subq_1.c_0) IN (
    SELECT subq_2.c_0 as c_0
    FROM (
      SELECT 0 as c_0
      FROM t1 as ref_1
      WHERE (ref_1.c1) = (2)
      ORDER BY c_0 desc
    ) as subq_2
    UNION ALL
    SELECT 0 as c_0
  );
