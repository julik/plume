SELECT a FROM t2
      WHERE c=32032
         OR f IS NULL
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR b=825
