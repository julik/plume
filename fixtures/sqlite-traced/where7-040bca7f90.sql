SELECT a FROM t2
      WHERE (g='nmlkjih' AND f GLOB 'defgh*')
         OR b=674
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR c=3003
         OR a=19
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR ((a BETWEEN 20 AND 22) AND a!=21)
