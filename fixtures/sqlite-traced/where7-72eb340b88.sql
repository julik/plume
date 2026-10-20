SELECT a FROM t2
      WHERE b=1001
         OR b=168
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
