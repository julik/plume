SELECT a FROM t2
      WHERE (g='xwvutsr' AND f GLOB 'efghi*')
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR b=748
         OR b=913
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR a=22
