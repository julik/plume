SELECT a FROM t2
      WHERE b=1103
         OR b=638
         OR b=792
         OR b=1034
         OR b=308
         OR f='nopqrstuv'
         OR b=264
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR (d>=58.0 AND d<59.0 AND d NOT NULL)
