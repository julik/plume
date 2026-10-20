SELECT a FROM t2
      WHERE ((a BETWEEN 9 AND 11) AND a!=10)
         OR a=55
         OR (g='jihgfed' AND f GLOB 'xyzab*')
