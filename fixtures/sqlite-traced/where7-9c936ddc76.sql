SELECT a FROM t2
      WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR a=67
         OR b=135
         OR f='bcdefghij'
         OR b=924
         OR (d>=22.0 AND d<23.0 AND d NOT NULL)
