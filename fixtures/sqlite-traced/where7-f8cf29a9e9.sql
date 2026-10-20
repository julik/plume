SELECT a FROM t2
      WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR f='opqrstuvw'
         OR a=83
         OR a=93
         OR b=858
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
