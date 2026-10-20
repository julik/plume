SELECT a FROM t2
      WHERE a=69
         OR b=1103
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR f='wxyzabcde'
         OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR f='pqrstuvwx'
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
         OR a=59
         OR b=946
