SELECT a FROM t2
      WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR b=619
         OR ((a BETWEEN 91 AND 93) AND a!=92)
         OR c=11011
         OR b=550
         OR b=1059
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR (d>=78.0 AND d<79.0 AND d NOT NULL)
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR b=737
