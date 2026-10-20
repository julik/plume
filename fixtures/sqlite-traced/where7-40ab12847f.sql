SELECT a FROM t2
      WHERE (g='gfedcba' AND f GLOB 'nopqr*')
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR b=649
         OR b=231
         OR (d>=48.0 AND d<49.0 AND d NOT NULL)
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR b=58
