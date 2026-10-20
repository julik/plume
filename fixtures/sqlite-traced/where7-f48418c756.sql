SELECT a FROM t2
      WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 26 AND 28) AND a!=27)
         OR b=421
         OR (g='xwvutsr' AND f GLOB 'fghij*')
         OR f='ijklmnopq'
         OR b=891
         OR b=1056
