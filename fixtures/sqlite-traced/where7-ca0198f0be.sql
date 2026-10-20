SELECT a FROM t2
      WHERE ((a BETWEEN 94 AND 96) AND a!=95)
         OR (d>=78.0 AND d<79.0 AND d NOT NULL)
         OR b=22
