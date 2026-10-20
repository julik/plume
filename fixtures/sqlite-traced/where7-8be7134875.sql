SELECT a FROM t2
      WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 10 AND 12) AND a!=11)
         OR ((a BETWEEN 79 AND 81) AND a!=80)
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR (g='qponmlk' AND f GLOB 'pqrst*')
         OR b=1100
         OR c=6006
         OR c=4004
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR c=33033
