SELECT a FROM t2
      WHERE b=1045
         OR ((a BETWEEN 36 AND 38) AND a!=37)
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR c=12012
