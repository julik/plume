SELECT a FROM t2
      WHERE (d>=22.0 AND d<23.0 AND d NOT NULL)
         OR b=377
         OR b=363
         OR ((a BETWEEN 55 AND 57) AND a!=56)
         OR b=737
         OR (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR b=506
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR a=16
