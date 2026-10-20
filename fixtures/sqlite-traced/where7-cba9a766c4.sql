SELECT a FROM t2
      WHERE b=245
         OR b=638
         OR (d>=62.0 AND d<63.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR f='opqrstuvw'
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR b=817
         OR a=85
         OR (g='lkjihgf' AND f GLOB 'mnopq*')
