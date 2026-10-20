SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'hijkl*')
         OR b=311
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR a=48
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR c=32032
         OR f='opqrstuvw'
         OR b=300
         OR b=1001
         OR ((a BETWEEN 94 AND 96) AND a!=95)
