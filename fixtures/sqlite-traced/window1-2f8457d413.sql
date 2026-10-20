EXPLAIN QUERY PLAN 
  SELECT 
    sum(c) OVER (ORDER BY b, a),
    sum(c) OVER (ORDER BY c, b)
  FROM t5
