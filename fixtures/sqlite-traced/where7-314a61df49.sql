SELECT a FROM t2
      WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR c=12012
         OR a=18
         OR (g='jihgfed' AND f GLOB 'yzabc*')
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
