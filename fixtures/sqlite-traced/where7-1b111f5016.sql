SELECT a FROM t2
      WHERE (d>=34.0 AND d<35.0 AND d NOT NULL)
         OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR b=814
         OR a=20
         OR 1000000<b
         OR b=792
