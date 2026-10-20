SELECT a FROM t2
      WHERE ((a BETWEEN 41 AND 43) AND a!=42)
         OR f='nopqrstuv'
         OR (g='ponmlkj' AND f GLOB 'stuvw*')
         OR a=42
         OR b=729
         OR b=297
         OR a=77
         OR b=781
         OR ((a BETWEEN 36 AND 38) AND a!=37)
