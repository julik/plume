SELECT a FROM t2
      WHERE ((a BETWEEN 22 AND 24) AND a!=23)
         OR b=542
         OR ((a BETWEEN 19 AND 21) AND a!=20)
         OR a=7
         OR f='klmnopqrs'
