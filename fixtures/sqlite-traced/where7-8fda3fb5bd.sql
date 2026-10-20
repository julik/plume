SELECT a FROM t2
      WHERE ((a BETWEEN 44 AND 46) AND a!=45)
         OR a=76
         OR b=154
         OR a=30
         OR c=3003
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
         OR b=564
         OR b=55
         OR a=38
