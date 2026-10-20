SELECT a FROM t2
      WHERE a=77
         OR ((a BETWEEN 48 AND 50) AND a!=49)
         OR c<=10
         OR ((a BETWEEN 5 AND 7) AND a!=6)
