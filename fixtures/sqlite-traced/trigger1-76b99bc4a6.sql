SELECT a, CASE WHEN typeof(b)='text' THEN quote(b) ELSE '<blob>' END, '|' FROM t1;
