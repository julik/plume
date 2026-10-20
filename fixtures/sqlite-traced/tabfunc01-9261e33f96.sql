SELECT t1.value, t2.value
    FROM t1 RIGHT JOIN generate_series(1,3,1) AS t2 USING(value);
