SELECT a FROM t2
      WHERE (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR a=1
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR b=278
         OR (g='xwvutsr' AND f GLOB 'defgh*')
         OR f='qrstuvwxy'
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR ((a BETWEEN 82 AND 84) AND a!=83)
         OR (g='edcbazy' AND f GLOB 'uvwxy*')
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR (d>=72.0 AND d<73.0 AND d NOT NULL)
