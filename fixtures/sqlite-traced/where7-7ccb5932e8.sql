SELECT a FROM t2
      WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
         OR ((a BETWEEN 5 AND 7) AND a!=6)
         OR b=99
         OR a=54
