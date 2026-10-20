SELECT a FROM t2
      WHERE b=113
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR b=113
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR ((a BETWEEN 62 AND 64) AND a!=63)
         OR c=6006
         OR (d>=14.0 AND d<15.0 AND d NOT NULL)
         OR b=946
         OR a=86
