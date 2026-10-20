SELECT a FROM t2
      WHERE b=960
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
