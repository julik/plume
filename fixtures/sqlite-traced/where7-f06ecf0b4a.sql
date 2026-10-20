SELECT a FROM t2
      WHERE ((a BETWEEN 43 AND 45) AND a!=44)
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (g='nmlkjih' AND f GLOB 'bcdef*')
         OR a=43
         OR (d>=14.0 AND d<15.0 AND d NOT NULL)
         OR b=729
         OR (g='vutsrqp' AND f GLOB 'opqrs*')
