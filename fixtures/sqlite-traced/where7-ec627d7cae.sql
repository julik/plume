SELECT a FROM t2
      WHERE f='tuvwxyzab'
         OR b=388
         OR ((a BETWEEN 84 AND 86) AND a!=85)
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR b=957
         OR b=663
         OR b=847
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
