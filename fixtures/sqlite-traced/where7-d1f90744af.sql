SELECT a FROM t2
      WHERE (g='yxwvuts' AND f GLOB 'bcdef*')
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR b=641
         OR b=795
