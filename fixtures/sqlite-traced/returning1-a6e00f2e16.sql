DELETE FROM t1
    RETURNING a,
              (SELECT min(a) FROM t1),
              (SELECT max(a) FROM t1),
              (SELECT round(avg(a),2) FROM t1);
