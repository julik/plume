SELECT a FROM t2
      WHERE (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR b=462
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR a=22
         OR b=594
         OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
