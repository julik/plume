SELECT a FROM t2
      WHERE b=487
         OR ((a BETWEEN 77 AND 79) AND a!=78)
         OR a=11
         OR ((a BETWEEN 12 AND 14) AND a!=13)
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR a=13
         OR a=15
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR a=36
