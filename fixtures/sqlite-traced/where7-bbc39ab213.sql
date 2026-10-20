SELECT a FROM t2
      WHERE ((a BETWEEN 69 AND 71) AND a!=70)
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR a=72
         OR b=1100
         OR b=102
         OR b=135
