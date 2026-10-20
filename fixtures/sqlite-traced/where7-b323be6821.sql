SELECT a FROM t2
      WHERE b=487
         OR b=355
         OR c=9009
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR ((a BETWEEN 32 AND 34) AND a!=33)
         OR b=113
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR a=90
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR (g='hgfedcb' AND f GLOB 'jklmn*')
         OR f='nopqrstuv'
