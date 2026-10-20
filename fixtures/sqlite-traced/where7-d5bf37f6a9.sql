SELECT a FROM t2
      WHERE (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR ((a BETWEEN 79 AND 81) AND a!=80)
         OR b=715
         OR ((a BETWEEN 23 AND 25) AND a!=24)
