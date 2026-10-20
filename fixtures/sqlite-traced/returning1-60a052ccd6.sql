UPDATE t1 SET x=x+1 RETURNING x, affinity(x);
