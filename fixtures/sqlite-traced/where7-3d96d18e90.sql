SELECT a FROM t2
      WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
         OR a=46
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
