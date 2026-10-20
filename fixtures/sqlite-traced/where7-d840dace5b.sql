SELECT a FROM t2
      WHERE b=693
         OR b=201
         OR ((a BETWEEN 36 AND 38) AND a!=37)
         OR b=520
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR b=407
         OR (d>=37.0 AND d<38.0 AND d NOT NULL)
         OR c>=34035
         OR b=135
