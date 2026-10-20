SELECT a FROM t2
      WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'stuvw*')
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=737
