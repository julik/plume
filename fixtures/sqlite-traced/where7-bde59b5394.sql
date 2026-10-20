SELECT a FROM t2
      WHERE ((a BETWEEN 52 AND 54) AND a!=53)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR a=27
         OR a=48
         OR b=927
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR f='abcdefghi'
         OR b=91
         OR b=55
