SELECT a FROM t2
      WHERE ((a BETWEEN 99 AND 101) AND a!=100)
         OR (g='fedcbaz' AND f GLOB 'pqrst*')
         OR 1000000<b
         OR (g='jihgfed' AND f GLOB 'xyzab*')
         OR b=990
