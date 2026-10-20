SELECT a FROM t2
      WHERE b=990
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR ((a BETWEEN 41 AND 43) AND a!=42)
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR b=531
         OR (d>=67.0 AND d<68.0 AND d NOT NULL)
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR f='qrstuvwxy'
