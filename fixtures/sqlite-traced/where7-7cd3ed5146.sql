SELECT a FROM t2
      WHERE (g='edcbazy' AND f GLOB 'wxyza*')
         OR b=957
         OR ((a BETWEEN 48 AND 50) AND a!=49)
