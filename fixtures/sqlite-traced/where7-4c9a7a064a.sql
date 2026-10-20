SELECT a FROM t2
      WHERE b=561
         OR b=1070
         OR a=59
         OR b=715
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
