SELECT a FROM t2
      WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
         OR a=85
         OR f IS NULL
         OR ((a BETWEEN 49 AND 51) AND a!=50)
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR b=154
         OR ((a BETWEEN 40 AND 42) AND a!=41)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
