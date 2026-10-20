SELECT a FROM t2
      WHERE (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR a=46
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR a=73
         OR c=20020
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR b=267
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
