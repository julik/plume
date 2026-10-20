SELECT a FROM t2
      WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR c=12012
         OR a=16
         OR a=15
         OR ((a BETWEEN 70 AND 72) AND a!=71)
         OR a=69
         OR b=748
         OR a=61
         OR b=473
         OR ((a BETWEEN 69 AND 71) AND a!=70)
