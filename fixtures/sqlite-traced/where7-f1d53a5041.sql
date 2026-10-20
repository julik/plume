SELECT a FROM t2
      WHERE c>=34035
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR a=91
