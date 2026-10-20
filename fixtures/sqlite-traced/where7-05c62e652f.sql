SELECT a FROM t2
      WHERE b=1092
         OR a=23
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR d<0.0
         OR (d>=22.0 AND d<23.0 AND d NOT NULL)
         OR a=91
