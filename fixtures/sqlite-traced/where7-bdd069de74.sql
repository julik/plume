SELECT a FROM t2
      WHERE a=12
         OR a=50
         OR (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR ((a BETWEEN 66 AND 68) AND a!=67)
