SELECT a FROM t2
      WHERE b=1070
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
