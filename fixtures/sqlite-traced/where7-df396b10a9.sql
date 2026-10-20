SELECT a FROM t2
      WHERE ((a BETWEEN 62 AND 64) AND a!=63)
         OR f='abcdefghi'
         OR (g='wvutsrq' AND f GLOB 'ijklm*')
