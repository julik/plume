SELECT a FROM t2
      WHERE (d>=76.0 AND d<77.0 AND d NOT NULL)
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR b=11
         OR ((a BETWEEN 21 AND 23) AND a!=22)
