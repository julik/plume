SELECT a FROM t2
      WHERE f='ghijklmno'
         OR a=26
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR a=81
         OR (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR ((a BETWEEN 28 AND 30) AND a!=29)
         OR b=275
         OR (g='hgfedcb' AND f GLOB 'jklmn*')
         OR b=311
         OR b=894
         OR b=872
