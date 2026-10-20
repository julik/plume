SELECT a FROM t2
      WHERE ((a BETWEEN 51 AND 53) AND a!=52)
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR b=91
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR b=77
         OR (g='ponmlkj' AND f GLOB 'uvwxy*')
         OR (g='vutsrqp' AND f GLOB 'pqrst*')
