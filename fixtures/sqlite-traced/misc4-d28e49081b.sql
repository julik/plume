SELECT ID, max(Value) FROM Table2 GROUP BY 1, 2
         UNION SELECT ID, Value FROM Table1
      ORDER BY 1, 2;
