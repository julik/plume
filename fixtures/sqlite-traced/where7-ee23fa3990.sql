SELECT a FROM t2
      WHERE a=99
         OR a=36
         OR b=297
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR b=1004
         OR b=872
         OR a=95
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR b=176
         OR b=300
