SELECT a FROM t2
      WHERE a=5
         OR a=95
         OR a=56
         OR a=46
         OR (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR (d>=41.0 AND d<42.0 AND d NOT NULL)
