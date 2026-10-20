SELECT a FROM t2
      WHERE a=25
         OR b=792
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
