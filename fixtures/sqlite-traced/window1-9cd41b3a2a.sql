SELECT 
    sum(a),
    min(b) OVER (),
    count(c) OVER (ORDER BY b)
  FROM t1;
