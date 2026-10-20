SELECT a FROM t2
      WHERE b=682
         OR b=99
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR b=531
