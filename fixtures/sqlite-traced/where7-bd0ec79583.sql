SELECT a FROM t2
      WHERE b=242
         OR b=905
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR (d>=96.0 AND d<97.0 AND d NOT NULL)
         OR a=24
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR b=1100
         OR b=850
         OR ((a BETWEEN 55 AND 57) AND a!=56)
