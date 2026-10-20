SELECT a FROM t2
      WHERE (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR b=451
         OR b=363
         OR b=330
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR ((a BETWEEN 52 AND 54) AND a!=53)
         OR (g='xwvutsr' AND f GLOB 'defgh*')
         OR ((a BETWEEN 81 AND 83) AND a!=82)
         OR (g='gfedcba' AND f GLOB 'lmnop*')
