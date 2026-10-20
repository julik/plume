SELECT a FROM t2
      WHERE b=484
         OR ((a BETWEEN 10 AND 12) AND a!=11)
         OR f='lmnopqrst'
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR (d>=64.0 AND d<65.0 AND d NOT NULL)
         OR (d>=7.0 AND d<8.0 AND d NOT NULL)
         OR b<0
         OR b=231
         OR a=14
