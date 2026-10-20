SELECT a FROM t2
      WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
         OR a=13
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR a=9
         OR a=27
         OR ((a BETWEEN 88 AND 90) AND a!=89)
         OR (d>=37.0 AND d<38.0 AND d NOT NULL)
         OR b=484
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR b=594
