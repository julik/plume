SELECT a FROM t2
      WHERE d<0.0
         OR a=78
         OR b=539
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR ((a BETWEEN 25 AND 27) AND a!=26)
         OR e IS NULL
         OR a=48
         OR (g='nmlkjih' AND f GLOB 'fghij*')
