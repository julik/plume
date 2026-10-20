SELECT a FROM t2
      WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR c=34034
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR a=67
