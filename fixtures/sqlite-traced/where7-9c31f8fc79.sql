SELECT a FROM t2
      WHERE a=52
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
