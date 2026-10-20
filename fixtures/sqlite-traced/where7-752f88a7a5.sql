SELECT a FROM t2
      WHERE (g='gfedcba' AND f GLOB 'nopqr*')
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR (g='mlkjihg' AND f GLOB 'ijklm*')
         OR b=231
         OR a=87
