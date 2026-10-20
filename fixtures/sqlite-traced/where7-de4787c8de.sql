SELECT a FROM t2
      WHERE b=616
         OR ((a BETWEEN 25 AND 27) AND a!=26)
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR a=96
