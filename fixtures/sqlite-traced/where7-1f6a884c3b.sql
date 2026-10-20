SELECT a FROM t2
      WHERE c=5005
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'stuvw*')
         OR b=143
         OR a=68
         OR a=77
         OR b=80
