SELECT a FROM t2
      WHERE (g='onmlkji' AND f GLOB 'xyzab*')
         OR a=10
         OR b=190
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR b=385
         OR a=82
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR c=22022
