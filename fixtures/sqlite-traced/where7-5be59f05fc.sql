SELECT a FROM t2
      WHERE c=7007
         OR b=91
         OR b=212
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR c=28028
         OR (d>=83.0 AND d<84.0 AND d NOT NULL)
