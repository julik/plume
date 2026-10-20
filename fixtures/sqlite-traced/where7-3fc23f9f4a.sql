SELECT a FROM t2
      WHERE b=751
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR (d>=71.0 AND d<72.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR a=89
         OR ((a BETWEEN 36 AND 38) AND a!=37)
