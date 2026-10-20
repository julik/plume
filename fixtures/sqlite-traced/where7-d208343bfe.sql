SELECT a FROM t2
      WHERE a=19
         OR b=902
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR b=168
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR a=50
         OR f='uvwxyzabc'
         OR b=836
         OR ((a BETWEEN 77 AND 79) AND a!=78)
         OR a=50
