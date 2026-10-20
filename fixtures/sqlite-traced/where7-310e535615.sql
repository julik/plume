SELECT a FROM t2
      WHERE ((a BETWEEN 40 AND 42) AND a!=41)
         OR (d>=62.0 AND d<63.0 AND d NOT NULL)
         OR c<=10
         OR (g='srqponm' AND f GLOB 'fghij*')
         OR a=35
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR b=1089
         OR a=73
         OR b=737
         OR c=18018
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
