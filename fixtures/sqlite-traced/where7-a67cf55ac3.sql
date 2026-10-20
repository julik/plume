SELECT a FROM t2
      WHERE ((a BETWEEN 79 AND 81) AND a!=80)
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
