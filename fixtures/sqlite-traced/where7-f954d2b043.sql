SELECT a FROM t2
      WHERE b=22
         OR c=31031
         OR b=894
         OR a=31
         OR ((a BETWEEN 84 AND 86) AND a!=85)
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR a=94
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR a=21
         OR b=1001
