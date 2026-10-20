SELECT a FROM t2
      WHERE ((a BETWEEN 88 AND 90) AND a!=89)
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'klmno*')
