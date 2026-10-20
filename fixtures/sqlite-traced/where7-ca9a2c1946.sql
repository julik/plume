SELECT a FROM t2
      WHERE ((a BETWEEN 84 AND 86) AND a!=85)
         OR b=572
         OR c=10010
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR a=29
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
