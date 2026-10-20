DELETE FROM t1
    RETURNING a,
              (SELECT min(t2.a)+t1.a*100 FROM t1 AS t2),
              (SELECT max(t2.a)+t1.a*100 FROM t1 AS t2),
              (SELECT round(avg(t2.a),2)+t1.a*100 FROM t1 AS t2);
