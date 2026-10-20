SELECT a FROM t2
      WHERE (g='edcbazy' AND f GLOB 'wxyza*')
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR b=113
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR ((a BETWEEN 53 AND 55) AND a!=54)
         OR ((a BETWEEN 59 AND 61) AND a!=60)
