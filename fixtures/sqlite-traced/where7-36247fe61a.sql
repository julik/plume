SELECT a FROM t2
      WHERE (f GLOB '?cdef*' AND f GLOB 'bcde*')
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR b=902
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR b=25
         OR ((a BETWEEN 16 AND 18) AND a!=17)
         OR f='zabcdefgh'
         OR b=385
