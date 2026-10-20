SELECT a FROM t2
      WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR ((a BETWEEN 90 AND 92) AND a!=91)
         OR b=319
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR ((a BETWEEN 9 AND 11) AND a!=10)
         OR a=21
         OR (d>=72.0 AND d<73.0 AND d NOT NULL)
