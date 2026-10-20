SELECT a FROM t2
      WHERE ((a BETWEEN 0 AND 2) AND a!=1)
         OR (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR (g='fedcbaz' AND f GLOB 'rstuv*')
         OR b=762
         OR ((a BETWEEN 39 AND 41) AND a!=40)
         OR a=80
