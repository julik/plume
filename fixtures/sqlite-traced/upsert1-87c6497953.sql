INSERT INTO t2(x, y) SELECT x, y FROM t1
   WHERE true
   ON CONFLICT (x) DO UPDATE SET y = excluded.y;
