SELECT a FROM t2
      WHERE b=47
         OR c=31031
         OR a=38
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR (g='srqponm' AND f GLOB 'fghij*')
         OR b=242
         OR (d>=70.0 AND d<71.0 AND d NOT NULL)
         OR b=352
         OR a=49
         OR (g='nmlkjih' AND f GLOB 'fghij*')
