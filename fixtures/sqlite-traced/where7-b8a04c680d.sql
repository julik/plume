SELECT a FROM t2
      WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR (g='gfedcba' AND f GLOB 'lmnop*')
         OR (d>=64.0 AND d<65.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'nopqr*')
         OR a=59
