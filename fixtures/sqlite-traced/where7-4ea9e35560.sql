SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'fghij*')
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR f IS NULL
