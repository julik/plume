SELECT a FROM t2
      WHERE b=781
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR (d>=99.0 AND d<100.0 AND d NOT NULL)
         OR (g='yxwvuts' AND f GLOB 'bcdef*')
         OR (g='nmlkjih' AND f GLOB 'cdefg*')
         OR f='lmnopqrst'
         OR a=39
         OR a=100
         OR ((a BETWEEN 56 AND 58) AND a!=57)
