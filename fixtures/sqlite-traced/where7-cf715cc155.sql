SELECT a FROM t2
      WHERE (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR (d>=76.0 AND d<77.0 AND d NOT NULL)
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR (d>=4.0 AND d<5.0 AND d NOT NULL)
