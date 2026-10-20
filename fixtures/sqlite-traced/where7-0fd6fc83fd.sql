SELECT a FROM t2
      WHERE ((a BETWEEN 65 AND 67) AND a!=66)
         OR b=14
         OR ((a BETWEEN 3 AND 5) AND a!=4)
         OR a=49
         OR b=333
