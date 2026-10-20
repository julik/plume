SELECT a FROM t2
      WHERE a=33
         OR b=1045
         OR (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR c=13013
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR b=124
         OR (g='gfedcba' AND f GLOB 'klmno*')
