SELECT a FROM t2
      WHERE (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR b=520
         OR ((a BETWEEN 47 AND 49) AND a!=48)
         OR f IS NULL
