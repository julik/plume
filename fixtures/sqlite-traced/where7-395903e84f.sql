SELECT a FROM t2
      WHERE f='pqrstuvwx'
         OR ((a BETWEEN 6 AND 8) AND a!=7)
         OR ((a BETWEEN 76 AND 78) AND a!=77)
         OR b=704
         OR a=18
