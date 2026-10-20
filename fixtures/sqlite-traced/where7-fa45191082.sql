SELECT a FROM t2
      WHERE (d>=84.0 AND d<85.0 AND d NOT NULL)
         OR ((a BETWEEN 32 AND 34) AND a!=33)
         OR b=267
         OR c=19019
         OR a=42
         OR b=938
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
