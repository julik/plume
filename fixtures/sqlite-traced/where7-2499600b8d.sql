SELECT a FROM t2
      WHERE a=85
         OR b=718
         OR (g='fedcbaz' AND f GLOB 'pqrst*')
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
