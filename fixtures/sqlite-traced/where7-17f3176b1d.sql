SELECT a FROM t2
      WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR a=14
         OR (g='hgfedcb' AND f GLOB 'hijkl*')
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR b=212
         OR (d>=78.0 AND d<79.0 AND d NOT NULL)
