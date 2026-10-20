SELECT a FROM t2
      WHERE a=18
         OR b=1059
         OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
         OR (g='nmlkjih' AND f GLOB 'bcdef*')
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'uvwxy*')
         OR b=795
