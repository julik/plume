SELECT a FROM t2
      WHERE a=43
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR b=418
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR b=594
         OR a=21
         OR a=78
         OR a=91
         OR (d>=80.0 AND d<81.0 AND d NOT NULL)
