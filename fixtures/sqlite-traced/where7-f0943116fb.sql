SELECT a FROM t2
      WHERE a=99
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
         OR a=73
         OR a=56
         OR b=253
         OR b=880
