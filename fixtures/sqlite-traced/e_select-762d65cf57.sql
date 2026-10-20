SELECT count(*) FROM t1, t2 USING (a) ON (t1.a=t2.a)
