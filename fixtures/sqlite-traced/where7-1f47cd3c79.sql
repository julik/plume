SELECT a FROM t2
      WHERE (d>=59.0 AND d<60.0 AND d NOT NULL)
         OR ((a BETWEEN 14 AND 16) AND a!=15)
         OR b=839
         OR f='defghijkl'
         OR (d>=95.0 AND d<96.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'ijklm*')
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR b=498
