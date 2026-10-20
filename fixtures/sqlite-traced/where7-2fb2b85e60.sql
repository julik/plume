SELECT a FROM t2
      WHERE (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR a=21
         OR b<0
         OR f='bcdefghij'
         OR ((a BETWEEN 14 AND 16) AND a!=15)
