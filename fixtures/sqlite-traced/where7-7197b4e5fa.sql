SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
         OR b=748
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR b=531
         OR b=1092
         OR b=418
