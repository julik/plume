SELECT a FROM t2
      WHERE ((a BETWEEN 87 AND 89) AND a!=88)
         OR b=814
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
