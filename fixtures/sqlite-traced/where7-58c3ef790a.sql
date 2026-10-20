SELECT a FROM t2
      WHERE ((a BETWEEN 32 AND 34) AND a!=33)
         OR b=1045
         OR c=27027
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
