SELECT a FROM t2
      WHERE (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR b=363
         OR (g='srqponm' AND f GLOB 'fghij*')
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR b=619
         OR (g='vutsrqp' AND f GLOB 'opqrs*')
         OR a=73
