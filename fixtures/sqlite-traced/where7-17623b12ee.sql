SELECT a FROM t2
      WHERE a=32
         OR ((a BETWEEN 15 AND 17) AND a!=16)
         OR ((a BETWEEN 92 AND 94) AND a!=93)
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR c=7007
         OR b=968
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
