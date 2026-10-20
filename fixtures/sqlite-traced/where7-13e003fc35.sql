SELECT a FROM t2
      WHERE ((a BETWEEN 18 AND 20) AND a!=19)
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR (d>=72.0 AND d<73.0 AND d NOT NULL)
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR f='zabcdefgh'
         OR b=861
         OR (g='vutsrqp' AND f GLOB 'pqrst*')
         OR a=28
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR b=311
