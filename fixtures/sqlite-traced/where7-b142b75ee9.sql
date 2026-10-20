SELECT a FROM t2
      WHERE c=26026
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR f='lmnopqrst'
         OR a=6
         OR ((a BETWEEN 59 AND 61) AND a!=60)
