SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
         OR (g='rqponml' AND f GLOB 'jklmn*')
         OR (g='lkjihgf' AND f GLOB 'mnopq*')
         OR b=726
         OR ((a BETWEEN 73 AND 75) AND a!=74)
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR c=2002
         OR c=15015
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR b=201
