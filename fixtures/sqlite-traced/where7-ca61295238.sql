SELECT a FROM t2
      WHERE c=26026
         OR a=96
         OR a=22
         OR b=341
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR b=872
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR ((a BETWEEN 25 AND 27) AND a!=26)
