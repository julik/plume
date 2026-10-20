SELECT a FROM t2
      WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
         OR (d>=90.0 AND d<91.0 AND d NOT NULL)
         OR a=34
         OR (g='rqponml' AND f GLOB 'ijklm*')
         OR (g='rqponml' AND f GLOB 'klmno*')
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR b=319
         OR b=330
         OR ((a BETWEEN 28 AND 30) AND a!=29)
