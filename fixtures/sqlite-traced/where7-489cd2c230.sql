SELECT a FROM t2
      WHERE (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'lmnop*')
