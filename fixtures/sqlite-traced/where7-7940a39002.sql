SELECT a FROM t2
      WHERE b=25
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR ((a BETWEEN 81 AND 83) AND a!=82)
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR ((a BETWEEN 3 AND 5) AND a!=4)
         OR b=289
         OR ((a BETWEEN 85 AND 87) AND a!=86)
