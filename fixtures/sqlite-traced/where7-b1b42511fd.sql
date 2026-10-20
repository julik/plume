SELECT a FROM t2
      WHERE ((a BETWEEN 18 AND 20) AND a!=19)
         OR (g='qponmlk' AND f GLOB 'mnopq*')
         OR b=597
         OR a=95
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR b=432
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
