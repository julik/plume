SELECT a FROM t2
      WHERE (g='nmlkjih' AND f GLOB 'efghi*')
         OR a=34
         OR ((a BETWEEN 6 AND 8) AND a!=7)
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR a=67
         OR a=28
