SELECT a FROM t2
      WHERE b=220
         OR (g='nmlkjih' AND f GLOB 'cdefg*')
         OR b=363
         OR (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR ((a BETWEEN 10 AND 12) AND a!=11)
