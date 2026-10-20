SELECT a FROM t2
      WHERE a=59
         OR ((a BETWEEN 5 AND 7) AND a!=6)
         OR b=1081
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
