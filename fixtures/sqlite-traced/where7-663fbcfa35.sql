SELECT a FROM t2
      WHERE (d>=85.0 AND d<86.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR ((a BETWEEN 30 AND 32) AND a!=31)
         OR b=1089
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
