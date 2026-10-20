SELECT a FROM t2
      WHERE (d>=74.0 AND d<75.0 AND d NOT NULL)
         OR a=63
         OR ((a BETWEEN 70 AND 72) AND a!=71)
         OR a=71
         OR b=22
         OR ((a BETWEEN 76 AND 78) AND a!=77)
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR a=53
