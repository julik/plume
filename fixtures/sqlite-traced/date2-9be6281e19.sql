WITH RECURSIVE c(x) AS (VALUES(1) UNION ALL SELECT x+1 FROM c WHERE x<5)
    INSERT INTO t5(y,m) SELECT julianday('2017-07-01')+c.x, mods.x FROM c, mods;
