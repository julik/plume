SELECT a FROM t2
      WHERE b=88
         OR f='vwxyzabcd'
         OR f='fghijklmn'
         OR (g='gfedcba' AND f GLOB 'lmnop*')
