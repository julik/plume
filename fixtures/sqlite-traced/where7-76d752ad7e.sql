SELECT a FROM t2
      WHERE (d>=99.0 AND d<100.0 AND d NOT NULL)
         OR b=135
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR b=209
         OR b=363
         OR c=27027
         OR b=1026
         OR c=6006
         OR (g='ponmlkj' AND f GLOB 'uvwxy*')
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
