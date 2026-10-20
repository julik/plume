SELECT a FROM t2
      WHERE c>=34035
         OR b=168
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
