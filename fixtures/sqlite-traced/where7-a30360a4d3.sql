SELECT a FROM t2
      WHERE a=55
         OR a=62
         OR a=63
         OR (g='onmlkji' AND f GLOB 'yzabc*')
         OR (g='rqponml' AND f GLOB 'ijklm*')
         OR ((a BETWEEN 99 AND 101) AND a!=100)
