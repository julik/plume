SELECT a FROM t2
      WHERE a=15
         OR b=388
         OR ((a BETWEEN 82 AND 84) AND a!=83)
         OR a=36
         OR b=737
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR a=75
