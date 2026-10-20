SELECT a FROM t2
      WHERE c=30030
         OR (d>=52.0 AND d<53.0 AND d NOT NULL)
         OR b=850
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
