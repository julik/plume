SELECT a FROM t2
      WHERE ((a BETWEEN 3 AND 5) AND a!=4)
         OR b=1012
         OR a=7
         OR b=773
         OR a=1
         OR b=726
         OR (d>=99.0 AND d<100.0 AND d NOT NULL)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR b=110
