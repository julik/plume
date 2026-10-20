WITH RECURSIVE c(i) AS (VALUES(1) UNION ALL SELECT i+1 FROM c WHERE i<10)
    INSERT INTO t1(a,ax,b) SELECT printf('%02x',i+160), random(), i FROM c;
