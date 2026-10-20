SELECT a FROM t2
      WHERE a=48
         OR a=92
         OR a=1
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
         OR (d>=7.0 AND d<8.0 AND d NOT NULL)
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR b=905
         OR ((a BETWEEN 51 AND 53) AND a!=52)
