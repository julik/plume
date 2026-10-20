SELECT * FROM (SELECT * FROM t1, t3), (
    SELECT group_concat(a) OVER (ORDER BY a), 
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a),
           group_concat(a) OVER (ORDER BY a)
    FROM t1
  )
  ORDER BY k;
