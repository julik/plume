SELECT a FROM t2
      WHERE ((a BETWEEN 34 AND 36) AND a!=35)
         OR (d>=50.0 AND d<51.0 AND d NOT NULL)
         OR ((a BETWEEN 35 AND 37) AND a!=36)
         OR a=49
         OR a=38
         OR b=157
         OR a=4
         OR b=311
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR (g='tsrqpon' AND f GLOB 'bcdef*')
         OR b=396
