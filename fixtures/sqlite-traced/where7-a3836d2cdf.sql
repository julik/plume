SELECT a FROM t2
      WHERE ((a BETWEEN 84 AND 86) AND a!=85)
         OR b=737
         OR b=201
         OR a=7
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR b=957
