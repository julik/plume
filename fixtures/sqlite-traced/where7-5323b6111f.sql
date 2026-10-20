SELECT a FROM t2
      WHERE b=99
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
