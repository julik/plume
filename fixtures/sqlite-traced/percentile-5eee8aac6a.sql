SELECT round(percentile_cont(x,(15+0.000001*rowid)*0.01),1) FROM t1
