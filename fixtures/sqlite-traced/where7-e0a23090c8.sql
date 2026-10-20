SELECT a FROM t2
      WHERE b=836
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR b=605
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR b=759
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR a=40
         OR f='ghijklmno'
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
