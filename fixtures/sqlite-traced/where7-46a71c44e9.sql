SELECT a FROM t2
      WHERE (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR b=146
         OR 1000000<b
         OR b=99
         OR ((a BETWEEN 75 AND 77) AND a!=76)
