WITH RECURSIVE c(n) AS (VALUES(1) UNION ALL SELECT n+1 FROM c WHERE n<7)
    INSERT INTO t1(a,b,c) SELECT char(p,p), char(q,q), n FROM
            (SELECT ((n-1)%4)+0x61 AS p, abs(n*2-9+(n>=5))+0x60 AS q, n FROM c);
