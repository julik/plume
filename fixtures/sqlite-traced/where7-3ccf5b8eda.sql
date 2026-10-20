SELECT a FROM t2
      WHERE (f GLOB '?xyza*' AND f GLOB 'wxyz*')
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR (g='kjihgfe' AND f GLOB 'tuvwx*')
         OR (g='edcbazy' AND f GLOB 'vwxyz*')
         OR b=663
         OR f='ghijklmno'
         OR ((a BETWEEN 14 AND 16) AND a!=15)
         OR f='ghijklmno'
         OR (d>=64.0 AND d<65.0 AND d NOT NULL)
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR b=1081
