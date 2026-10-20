SELECT a FROM t2
      WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR b=36
         OR (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR ((a BETWEEN 46 AND 48) AND a!=47)
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (d>=91.0 AND d<92.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR ((a BETWEEN 26 AND 28) AND a!=27)
