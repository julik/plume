SELECT a FROM t2
      WHERE (d>=72.0 AND d<73.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR c=11011
         OR c=20020
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
