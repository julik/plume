SELECT a FROM t2
      WHERE ((a BETWEEN 15 AND 17) AND a!=16)
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR b=33
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
