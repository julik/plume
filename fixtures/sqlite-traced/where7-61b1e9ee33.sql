SELECT a FROM t2
      WHERE (d>=69.0 AND d<70.0 AND d NOT NULL)
         OR b=256
         OR c=7007
         OR c=26026
         OR ((a BETWEEN 80 AND 82) AND a!=81)
         OR (d>=74.0 AND d<75.0 AND d NOT NULL)
         OR a=66
