SELECT a FROM t2
      WHERE (g='vutsrqp' AND f GLOB 'opqrs*')
         OR (g='gfedcba' AND f GLOB 'nopqr*')
         OR b=990
         OR a=52
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
