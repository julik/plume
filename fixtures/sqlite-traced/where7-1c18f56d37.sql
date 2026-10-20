SELECT a FROM t2
      WHERE b=33
         OR f='qrstuvwxy'
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR b=858
