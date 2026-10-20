SELECT a FROM t2
      WHERE b=242
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR (d>=99.0 AND d<100.0 AND d NOT NULL)
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR f='bcdefghij'
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
         OR a=38
         OR b=187
