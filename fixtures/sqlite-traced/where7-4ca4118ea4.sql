SELECT a FROM t2
      WHERE a=83
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR a=1
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR b=245
