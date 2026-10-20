SELECT a FROM t2
      WHERE f='uvwxyzabc'
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR a=5
         OR b=33
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
         OR a=59
         OR b=44
         OR (d>=14.0 AND d<15.0 AND d NOT NULL)
         OR (d>=59.0 AND d<60.0 AND d NOT NULL)
