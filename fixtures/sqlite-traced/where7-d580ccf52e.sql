SELECT a FROM t2
      WHERE a=62
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR (g='edcbazy' AND f GLOB 'vwxyz*')
