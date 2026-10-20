SELECT a FROM t2
      WHERE b=861
         OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR b=682
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR b=286
