SELECT a FROM t2
      WHERE b=1070
         OR ((a BETWEEN 50 AND 52) AND a!=51)
         OR a=54
         OR (g='tsrqpon' AND f GLOB 'zabcd*')
         OR a=9
         OR (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
