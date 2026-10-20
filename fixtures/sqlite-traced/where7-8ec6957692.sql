SELECT a FROM t2
      WHERE (d>=67.0 AND d<68.0 AND d NOT NULL)
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR b=113
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
         OR ((a BETWEEN 3 AND 5) AND a!=4)
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR f='mnopqrstu'
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR b=902
