SELECT a FROM t2
      WHERE f='yzabcdefg'
         OR ((a BETWEEN 48 AND 50) AND a!=49)
         OR a=100
         OR (g='rqponml' AND f GLOB 'ijklm*')
         OR a=62
         OR a=67
         OR b=605
         OR c=23023
         OR a=26
         OR b=982
         OR ((a BETWEEN 3 AND 5) AND a!=4)
