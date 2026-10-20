SELECT a FROM t2
      WHERE ((a BETWEEN 56 AND 58) AND a!=57)
         OR (g='kjihgfe' AND f GLOB 'stuvw*')
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR b=726
         OR a=79
         OR a=47
         OR b=212
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR c=8008
