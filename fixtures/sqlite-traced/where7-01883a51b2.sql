SELECT a FROM t2
      WHERE b=473
         OR b=1100
         OR (d>=53.0 AND d<54.0 AND d NOT NULL)
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR a=20
         OR b=1089
         OR b=330
         OR b=124
         OR ((a BETWEEN 56 AND 58) AND a!=57)
