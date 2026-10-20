SELECT a FROM t2
      WHERE f='fghijklmn'
         OR a=16
         OR (g='xwvutsr' AND f GLOB 'defgh*')
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR ((a BETWEEN 90 AND 92) AND a!=91)
         OR ((a BETWEEN 9 AND 11) AND a!=10)
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR (g='kjihgfe' AND f GLOB 'tuvwx*')
         OR b=80
