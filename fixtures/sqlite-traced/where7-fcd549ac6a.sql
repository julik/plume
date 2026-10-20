SELECT a FROM t2
      WHERE (g='rqponml' AND f GLOB 'hijkl*')
         OR (g='ponmlkj' AND f GLOB 'stuvw*')
         OR a=8
         OR a=72
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
