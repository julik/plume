SELECT a FROM t2
      WHERE a=82
         OR b=333
         OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
         OR b=99
         OR a=63
         OR a=35
         OR b=176
