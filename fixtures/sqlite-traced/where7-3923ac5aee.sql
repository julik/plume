SELECT a FROM t2
      WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR b=850
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR ((a BETWEEN 15 AND 17) AND a!=16)
         OR b=88
         OR f='hijklmnop'
         OR b=806
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR b=88
