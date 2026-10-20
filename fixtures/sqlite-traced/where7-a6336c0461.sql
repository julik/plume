SELECT a FROM t2
      WHERE b=308
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR (g='nmlkjih' AND f GLOB 'bcdef*')
         OR a=83
         OR c=23023
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR a=58
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR c=4004
