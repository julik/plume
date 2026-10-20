SELECT a FROM t2
      WHERE (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR b=399
         OR b=1004
         OR c=16016
         OR (d>=31.0 AND d<32.0 AND d NOT NULL)
         OR b=671
         OR a=25
         OR a=30
         OR a=8
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
