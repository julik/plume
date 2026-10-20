SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'pqrst*')
         OR ((a BETWEEN 93 AND 95) AND a!=94)
