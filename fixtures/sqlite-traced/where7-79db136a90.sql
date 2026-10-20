SELECT a FROM t2
      WHERE b=762
         OR (d>=93.0 AND d<94.0 AND d NOT NULL)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
