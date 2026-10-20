SELECT a FROM t2
      WHERE ((a BETWEEN 93 AND 95) AND a!=94)
         OR a=79
         OR (d>=39.0 AND d<40.0 AND d NOT NULL)
         OR b=462
