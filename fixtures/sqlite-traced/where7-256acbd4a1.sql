SELECT a FROM t2
      WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR b=264
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR b=1048
         OR a=15
