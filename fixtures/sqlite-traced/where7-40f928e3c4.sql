SELECT a FROM t2
      WHERE b=495
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR b=924
         OR c=11011
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR b=231
         OR b=872
         OR (g='jihgfed' AND f GLOB 'yzabc*')
