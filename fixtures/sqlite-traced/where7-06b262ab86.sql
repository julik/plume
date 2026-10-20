SELECT a FROM t2
      WHERE b=957
         OR b=242
         OR b=113
         OR b=957
         OR b=311
         OR b=143
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
