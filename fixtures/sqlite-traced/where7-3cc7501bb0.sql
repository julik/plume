SELECT a FROM t2
      WHERE (g='jihgfed' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR b=212
         OR (g='nmlkjih' AND f GLOB 'bcdef*')
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR a=20
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR b=627
