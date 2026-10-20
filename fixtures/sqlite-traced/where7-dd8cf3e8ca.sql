SELECT a FROM t2
      WHERE b=795
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR f='jklmnopqr'
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR b=1056
