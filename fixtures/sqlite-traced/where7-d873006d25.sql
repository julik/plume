SELECT a FROM t2
      WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR b=726
         OR f='abcdefghi'
         OR b=179
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR b=539
         OR b=66
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
