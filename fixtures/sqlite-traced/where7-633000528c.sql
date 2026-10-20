SELECT a FROM t2
      WHERE ((a BETWEEN 99 AND 101) AND a!=100)
         OR ((a BETWEEN 72 AND 74) AND a!=73)
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR a=92
         OR b=1100
         OR ((a BETWEEN 98 AND 100) AND a!=99)
         OR ((a BETWEEN 30 AND 32) AND a!=31)
