SELECT a FROM t2
      WHERE c=26026
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
         OR (g='mlkjihg' AND f GLOB 'ijklm*')
         OR c=17017
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR (g='jihgfed' AND f GLOB 'zabcd*')
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
