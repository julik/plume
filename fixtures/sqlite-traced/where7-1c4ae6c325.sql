SELECT a FROM t2
      WHERE c=31031
         OR b=737
         OR a=37
         OR ((a BETWEEN 98 AND 100) AND a!=99)
         OR (d>=94.0 AND d<95.0 AND d NOT NULL)
         OR ((a BETWEEN 65 AND 67) AND a!=66)
         OR a=91
         OR b=77
         OR (d>=94.0 AND d<95.0 AND d NOT NULL)
