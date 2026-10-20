SELECT a FROM t2
      WHERE b=234
         OR a=22
         OR b=289
         OR b=795
         OR (g='gfedcba' AND f GLOB 'nopqr*')
         OR b=242
         OR a=59
         OR b=1045
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
