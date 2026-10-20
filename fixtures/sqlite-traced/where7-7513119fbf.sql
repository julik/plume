SELECT a FROM t2
      WHERE a=20
         OR a=67
         OR b=58
         OR ((a BETWEEN 19 AND 21) AND a!=20)
