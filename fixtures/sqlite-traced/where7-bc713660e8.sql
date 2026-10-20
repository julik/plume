SELECT a FROM t2
      WHERE c=9009
         OR (d>=85.0 AND d<86.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
