SELECT a FROM t2
      WHERE b=179
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR a=46
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
         OR ((a BETWEEN 53 AND 55) AND a!=54)
         OR a=25
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
         OR f='opqrstuvw'
         OR (d>=53.0 AND d<54.0 AND d NOT NULL)
         OR b=938
