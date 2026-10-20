SELECT *, nth_value(15,2) OVER() FROM t2, t1 WHERE b=4;
