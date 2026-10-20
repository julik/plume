SELECT a FROM t2
      WHERE ((a BETWEEN 34 AND 36) AND a!=35)
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR a=83
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR ((a BETWEEN 99 AND 101) AND a!=100)
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=1092
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR b=25
