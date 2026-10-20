SELECT a, quote(b), cd FROM (
    SELECT v1.a, v1.b, t0.c0 AS cd FROM t0 LEFT JOIN v0 ON v0.c0!=0, v1
  ) WHERE a=2 AND b='0' AND cd=0;
