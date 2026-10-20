SELECT a FROM t2
      WHERE a=20
         OR b=421
         OR (g='xwvutsr' AND f GLOB 'fghij*')
         OR a=50
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR (d>=53.0 AND d<54.0 AND d NOT NULL)
