SELECT a FROM t2
      WHERE a=93
         OR f='ijklmnopq'
         OR f='mnopqrstu'
         OR ((a BETWEEN 67 AND 69) AND a!=68)
