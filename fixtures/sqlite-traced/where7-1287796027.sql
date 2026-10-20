SELECT a FROM t2
      WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR b=245
         OR b=528
         OR b=366
         OR a=73
         OR a=49
         OR b=421
         OR a=58
