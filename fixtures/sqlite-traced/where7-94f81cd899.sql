SELECT a FROM t2
      WHERE f='abcdefghi'
         OR a=5
         OR b=124
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR b=432
         OR 1000000<b
         OR a=58
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR b=77
         OR b=605
