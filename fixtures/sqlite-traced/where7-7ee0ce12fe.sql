SELECT a FROM t2
      WHERE b=1001
         OR b=1070
         OR ((a BETWEEN 72 AND 74) AND a!=73)
         OR b=14
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
         OR a=66
