SELECT a FROM t2
      WHERE (g='gfedcba' AND f GLOB 'klmno*')
         OR ((a BETWEEN 9 AND 11) AND a!=10)
         OR (g='rqponml' AND f GLOB 'hijkl*')
         OR a=48
         OR b=113
         OR ((a BETWEEN 20 AND 22) AND a!=21)
         OR b=880
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR (g='nmlkjih' AND f GLOB 'bcdef*')
