SELECT a FROM t2
      WHERE ((a BETWEEN 71 AND 73) AND a!=72)
         OR (g='yxwvuts' AND f GLOB 'bcdef*')
         OR ((a BETWEEN 80 AND 82) AND a!=81)
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR ((a BETWEEN 91 AND 93) AND a!=92)
         OR d>1e10
         OR b=22
         OR c=5005
         OR ((a BETWEEN 22 AND 24) AND a!=23)
