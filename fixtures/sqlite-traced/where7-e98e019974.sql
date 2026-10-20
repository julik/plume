SELECT a FROM t2
      WHERE b=355
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR b=806
         OR b=462
         OR b=531
         OR (g='lkjihgf' AND f GLOB 'lmnop*')
         OR f='mnopqrstu'
