SELECT a FROM t2
      WHERE f IS NULL
         OR a=37
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR ((a BETWEEN 55 AND 57) AND a!=56)
         OR b=168
         OR b=22
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR b=506
