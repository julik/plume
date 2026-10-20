SELECT a FROM t2
      WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=806
         OR a=47
         OR d<0.0
         OR b=982
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR (g='hgfedcb' AND f GLOB 'jklmn*')
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR e IS NULL
         OR c=32032
         OR b=795
