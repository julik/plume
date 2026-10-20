SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'rstuv*')
         OR a=31
         OR (f GLOB '?jklm*' AND f GLOB 'ijkl*')
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR a=76
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
         OR b=176
