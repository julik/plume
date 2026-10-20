SELECT a FROM t2
      WHERE ((a BETWEEN 50 AND 52) AND a!=51)
         OR c=9009
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR b=539
         OR b=297
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR (g='vutsrqp' AND f GLOB 'pqrst*')
         OR b=957
         OR f='xyzabcdef'
         OR b=619
