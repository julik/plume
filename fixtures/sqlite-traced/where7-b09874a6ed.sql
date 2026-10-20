SELECT a FROM t2
      WHERE (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR b=751
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR a=67
         OR b=102
