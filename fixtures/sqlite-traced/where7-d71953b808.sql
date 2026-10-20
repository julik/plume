SELECT a FROM t2
      WHERE (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR b=231
         OR a=81
         OR a=72
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR b=396
