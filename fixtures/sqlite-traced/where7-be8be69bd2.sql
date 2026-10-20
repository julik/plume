SELECT a FROM t2
      WHERE c>=34035
         OR a=29
         OR ((a BETWEEN 19 AND 21) AND a!=20)
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR f='abcdefghi'
         OR b=993
         OR ((a BETWEEN 52 AND 54) AND a!=53)
         OR ((a BETWEEN 45 AND 47) AND a!=46)
