SELECT a FROM t2
      WHERE (g='gfedcba' AND f GLOB 'lmnop*')
         OR a=41
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR b=825
