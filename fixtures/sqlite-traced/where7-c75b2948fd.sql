SELECT a FROM t2
      WHERE f='rstuvwxyz'
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR ((a BETWEEN 90 AND 92) AND a!=91)
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
