SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'tuvwx*')
         OR b=421
         OR b=429
         OR b=498
         OR b=33
         OR b=198
         OR c=14014
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
