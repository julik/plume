SELECT a FROM t2
      WHERE (d>=93.0 AND d<94.0 AND d NOT NULL)
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR b=363
         OR (g='xwvutsr' AND f GLOB 'fghij*')
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
