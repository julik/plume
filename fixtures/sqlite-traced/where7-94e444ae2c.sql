SELECT a FROM t2
      WHERE b=924
         OR a=92
         OR a=63
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR (g='fedcbaz' AND f GLOB 'tuvwx*')
