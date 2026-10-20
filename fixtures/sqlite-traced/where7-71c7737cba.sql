SELECT a FROM t2
      WHERE b=979
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR a=13
         OR a=15
         OR ((a BETWEEN 6 AND 8) AND a!=7)
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR a=27
         OR ((a BETWEEN 98 AND 100) AND a!=99)
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR a=32
         OR a=39
