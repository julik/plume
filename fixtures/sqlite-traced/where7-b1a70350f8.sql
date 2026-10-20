SELECT a FROM t2
      WHERE ((a BETWEEN 47 AND 49) AND a!=48)
         OR a=5
         OR b=179
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR a=69
