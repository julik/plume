SELECT x.a AS xa, y.a AS yz, z.a AS za, va
    FROM t1 AS x JOIN t1 AS y ON x.a+y.a=0
         RIGHT JOIN t1 AS z ON z.a+y.a=0
         CROSS JOIN (SELECT 2 AS va FROM t1 UNION ALL SELECT 3 FROM t1)
   ORDER BY +va;
