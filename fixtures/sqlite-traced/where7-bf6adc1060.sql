SELECT a FROM t2
      WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR b=905
         OR a=97
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR c=27027
         OR f='bcdefghij'
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
