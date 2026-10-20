SELECT a FROM t2
      WHERE b=938
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (d>=32.0 AND d<33.0 AND d NOT NULL)
         OR b=245
         OR (d>=35.0 AND d<36.0 AND d NOT NULL)
