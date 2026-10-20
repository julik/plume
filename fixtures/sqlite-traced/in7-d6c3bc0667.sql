SELECT vout,
         (vout IN (SELECT t0.c1 FROM t0)) AS A,
         (vout IN (SELECT t0.c0 FROM t0)) AS D,
         ((vout IN (SELECT t0.c1 FROM t0)) AND NOT (vout IN (SELECT t0.c0 FROM t0))) AS P
           FROM v74;
