SELECT a FROM t2
      WHERE (g='lkjihgf' AND f GLOB 'pqrst*')
         OR b=748
         OR b=696
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
