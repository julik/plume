SELECT a FROM t2
      WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR (d>=14.0 AND d<15.0 AND d NOT NULL)
         OR (g='hgfedcb' AND f GLOB 'fghij*')
         OR b=297
         OR b=113
         OR b=176
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR a=67
         OR c=26026
