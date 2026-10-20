SELECT a FROM t2
      WHERE (d>=78.0 AND d<79.0 AND d NOT NULL)
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR a=83
         OR b=44
         OR b=1023
         OR ((a BETWEEN 11 AND 13) AND a!=12)
         OR b=1023
         OR f='ijklmnopq'
