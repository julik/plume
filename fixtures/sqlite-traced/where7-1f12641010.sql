SELECT a FROM t2
      WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'opqrs*')
         OR b=1015
         OR c=16016
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR f='abcdefghi'
         OR b=605
         OR a=63
