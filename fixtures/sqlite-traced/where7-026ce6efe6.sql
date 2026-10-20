SELECT a FROM t2
      WHERE b=190
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR (g='rqponml' AND f GLOB 'hijkl*')
         OR b=407
