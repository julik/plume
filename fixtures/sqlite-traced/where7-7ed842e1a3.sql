SELECT a FROM t2
      WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR (g='rqponml' AND f GLOB 'klmno*')
         OR f='lmnopqrst'
         OR (g='nmlkjih' AND f GLOB 'fghij*')
