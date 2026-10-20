SELECT a FROM t2
      WHERE (g='xwvutsr' AND f GLOB 'ghijk*')
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR ((a BETWEEN 30 AND 32) AND a!=31)
