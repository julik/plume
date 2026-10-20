SELECT a FROM t2
      WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
         OR b=927
         OR b=275
         OR b=396
         OR c=4004
         OR (g='vutsrqp' AND f GLOB 'opqrs*')
         OR b=319
         OR ((a BETWEEN 83 AND 85) AND a!=84)
         OR a=3
         OR ((a BETWEEN 73 AND 75) AND a!=74)
