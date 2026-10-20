SELECT a FROM t2
      WHERE ((a BETWEEN 51 AND 53) AND a!=52)
         OR (d>=30.0 AND d<31.0 AND d NOT NULL)
         OR b=14
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR ((a BETWEEN 15 AND 17) AND a!=16)
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR b=121
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
