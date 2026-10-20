SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'qrstu*')
         OR ((a BETWEEN 29 AND 31) AND a!=30)
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR b=1015
         OR (g='qponmlk' AND f GLOB 'qrstu*')
         OR b=916
         OR (d>=31.0 AND d<32.0 AND d NOT NULL)
         OR b=69
         OR (g='hgfedcb' AND f GLOB 'fghij*')
