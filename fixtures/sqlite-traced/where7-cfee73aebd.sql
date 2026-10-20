SELECT a FROM t2
      WHERE b=935
         OR a=42
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR b=330
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
