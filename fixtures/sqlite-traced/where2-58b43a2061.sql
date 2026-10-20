SELECT b.* FROM t1 a, t1 b
     WHERE a.w=1 AND (a.y=b.z OR b.z=10)
     ORDER BY +b.w
