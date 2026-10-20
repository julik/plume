SELECT min(x) OVER w1 FROM t1
    WINDOW w1 AS (PARTITION BY x_count(x) OVER w1);
