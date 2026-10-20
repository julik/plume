SELECT a FROM t2
      WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR a=50
         OR a=46
         OR ((a BETWEEN 38 AND 40) AND a!=39)
