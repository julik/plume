SELECT a FROM t2
      WHERE (d>=96.0 AND d<97.0 AND d NOT NULL)
         OR b=209
         OR b=399
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
