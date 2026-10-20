SELECT a FROM t2
      WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR ((a BETWEEN 19 AND 21) AND a!=20)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
