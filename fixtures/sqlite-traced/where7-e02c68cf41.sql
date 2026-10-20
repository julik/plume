SELECT a FROM t2
      WHERE b=179
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
         OR ((a BETWEEN 72 AND 74) AND a!=73)
