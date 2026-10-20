SELECT a FROM t2
      WHERE (g='lkjihgf' AND f GLOB 'lmnop*')
         OR (g='srqponm' AND f GLOB 'fghij*')
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
