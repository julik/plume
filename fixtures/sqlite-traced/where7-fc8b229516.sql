SELECT a FROM t2
      WHERE b=1037
         OR (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR ((a BETWEEN 75 AND 77) AND a!=76)
