SELECT a FROM t2
      WHERE ((a BETWEEN 74 AND 76) AND a!=75)
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR b=47
         OR ((a BETWEEN 44 AND 46) AND a!=45)
         OR a=92
         OR b=795
         OR b=25
         OR c=7007
         OR a=93
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
