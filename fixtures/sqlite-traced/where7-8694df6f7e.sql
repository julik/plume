SELECT a FROM t2
      WHERE b=924
         OR ((a BETWEEN 35 AND 37) AND a!=36)
         OR c=15015
         OR (d>=84.0 AND d<85.0 AND d NOT NULL)
         OR ((a BETWEEN 3 AND 5) AND a!=4)
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR b=803
