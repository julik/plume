SELECT a FROM t2
      WHERE b=47
         OR b=187
         OR a=56
         OR ((a BETWEEN 30 AND 32) AND a!=31)
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR ((a BETWEEN 89 AND 91) AND a!=90)
