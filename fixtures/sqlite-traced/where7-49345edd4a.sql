SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
         OR (f GLOB '?xyza*' AND f GLOB 'wxyz*')
