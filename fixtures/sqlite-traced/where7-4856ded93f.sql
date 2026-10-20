SELECT a FROM t2
      WHERE ((a BETWEEN 67 AND 69) AND a!=68)
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
