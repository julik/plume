SELECT a FROM t2
      WHERE b=825
         OR b=1004
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
