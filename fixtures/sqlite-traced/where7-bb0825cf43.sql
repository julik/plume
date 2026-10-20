SELECT a FROM t2
      WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'xyzab*')
         OR c=32032
         OR b=289
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR ((a BETWEEN 14 AND 16) AND a!=15)
