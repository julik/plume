SELECT a FROM t2
      WHERE b=1078
         OR c=19019
         OR a=38
         OR a=59
         OR ((a BETWEEN 30 AND 32) AND a!=31)
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR c=25025
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR (d>=76.0 AND d<77.0 AND d NOT NULL)
