SELECT a FROM t2
      WHERE a=12
         OR b=935
         OR (d>=87.0 AND d<88.0 AND d NOT NULL)
         OR b=1070
         OR a=24
         OR a=95
         OR ((a BETWEEN 27 AND 29) AND a!=28)
         OR a=40
         OR b=935
         OR (d>=53.0 AND d<54.0 AND d NOT NULL)
