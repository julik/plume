SELECT a FROM t2
      WHERE a=87
         OR (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR b=487
         OR (g='gfedcba' AND f GLOB 'mnopq*')
