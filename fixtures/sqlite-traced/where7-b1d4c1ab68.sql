SELECT a FROM t2
      WHERE b=91
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR (d>=85.0 AND d<86.0 AND d NOT NULL)
         OR b=102
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR b=784
