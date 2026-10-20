SELECT a FROM t2
      WHERE b=627
         OR ((a BETWEEN 75 AND 77) AND a!=76)
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR a=90
         OR (d>=33.0 AND d<34.0 AND d NOT NULL)
