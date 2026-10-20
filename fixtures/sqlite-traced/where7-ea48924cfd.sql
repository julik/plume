SELECT a FROM t2
      WHERE a=29
         OR ((a BETWEEN 26 AND 28) AND a!=27)
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR (g='qponmlk' AND f GLOB 'qrstu*')
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR b=209
         OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
         OR b=146
