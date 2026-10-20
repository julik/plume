SELECT a FROM t2
      WHERE a=75
         OR a=61
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR (g='gfedcba' AND f GLOB 'nopqr*')
