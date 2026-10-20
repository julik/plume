SELECT a FROM t2
      WHERE (d>=81.0 AND d<82.0 AND d NOT NULL)
         OR a=56
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
