SELECT a FROM t2
      WHERE (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR b=564
         OR b=784
         OR b=418
         OR b=275
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR a=58
         OR c=11011
         OR b=660
