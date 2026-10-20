UPDATE t1 SET vkey = 100 WHERE NOT (-10*(select min(vkey) from t1) >= c5);
