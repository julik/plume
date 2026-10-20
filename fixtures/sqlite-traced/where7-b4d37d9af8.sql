SELECT a FROM t2
      WHERE b=858
         OR a=82
         OR b=209
         OR b=374
         OR ((a BETWEEN 76 AND 78) AND a!=77)
         OR (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR c=22022
