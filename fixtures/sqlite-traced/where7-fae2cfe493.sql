SELECT a FROM t2
      WHERE b=69
         OR a=11
         OR c=1001
         OR ((a BETWEEN 54 AND 56) AND a!=55)
         OR a=57
         OR ((a BETWEEN 48 AND 50) AND a!=49)
