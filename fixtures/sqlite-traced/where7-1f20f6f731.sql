SELECT a FROM t2
      WHERE a=25
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR (g='gfedcba' AND f GLOB 'mnopq*')
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR b=443
         OR b=564
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR b=531
         OR b=1081
         OR a=96
