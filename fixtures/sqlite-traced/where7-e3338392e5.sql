SELECT a FROM t2
      WHERE ((a BETWEEN 80 AND 82) AND a!=81)
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR (g='kjihgfe' AND f GLOB 'tuvwx*')
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR (g='gfedcba' AND f GLOB 'mnopq*')
