SELECT a FROM t2
      WHERE (g='hgfedcb' AND f GLOB 'jklmn*')
         OR b=220
         OR b=443
         OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
         OR a=62
         OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
         OR b=1023
         OR a=100
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
