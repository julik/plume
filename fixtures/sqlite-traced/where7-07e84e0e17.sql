SELECT a FROM t2
      WHERE ((a BETWEEN 60 AND 62) AND a!=61)
         OR f='pqrstuvwx'
         OR (g='nmlkjih' AND f GLOB 'efghi*')
         OR b=495
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR a=75
