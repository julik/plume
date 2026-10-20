SELECT a FROM t2
      WHERE c=11011
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR b=630
         OR c=19019
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR a=24
         OR (d>=95.0 AND d<96.0 AND d NOT NULL)
         OR ((a BETWEEN 51 AND 53) AND a!=52)
