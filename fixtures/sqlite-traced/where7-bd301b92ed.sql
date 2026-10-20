SELECT a FROM t2
      WHERE b=223
         OR b=267
         OR a=40
         OR ((a BETWEEN 55 AND 57) AND a!=56)
         OR c<=10
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR b=528
