SELECT a FROM t2
      WHERE b=891
         OR b=806
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR ((a BETWEEN 85 AND 87) AND a!=86)
         OR b=861
         OR ((a BETWEEN 82 AND 84) AND a!=83)
         OR (d>=34.0 AND d<35.0 AND d NOT NULL)
