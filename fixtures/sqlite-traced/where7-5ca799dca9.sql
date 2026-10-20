SELECT a FROM t2
      WHERE f='efghijklm'
         OR a=70
         OR b=278
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR c=8008
         OR f='opqrstuvw'
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR (g='xwvutsr' AND f GLOB 'fghij*')
