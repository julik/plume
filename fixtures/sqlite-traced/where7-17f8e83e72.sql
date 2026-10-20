SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
         OR ((a BETWEEN 76 AND 78) AND a!=77)
         OR a=47
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR (g='lkjihgf' AND f GLOB 'lmnop*')
         OR (d>=84.0 AND d<85.0 AND d NOT NULL)
         OR f='lmnopqrst'
