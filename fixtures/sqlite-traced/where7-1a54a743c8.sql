SELECT a FROM t2
      WHERE b=1001
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR a=58
         OR b=333
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR b=572
         OR ((a BETWEEN 50 AND 52) AND a!=51)
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
