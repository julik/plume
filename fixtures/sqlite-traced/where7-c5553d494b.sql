SELECT a FROM t2
      WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR b=795
         OR b=1103
         OR b=583
