SELECT a FROM t2
      WHERE (g='jihgfed' AND f GLOB 'zabcd*')
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR ((a BETWEEN 79 AND 81) AND a!=80)
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR f='vwxyzabcd'
         OR b=275
