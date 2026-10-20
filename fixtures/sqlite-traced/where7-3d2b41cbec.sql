SELECT a FROM t2
      WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR b=99
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
