SELECT a FROM t2
      WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR (d>=35.0 AND d<36.0 AND d NOT NULL)
         OR c=26026
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR a=56
         OR b=506
         OR b=781
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
