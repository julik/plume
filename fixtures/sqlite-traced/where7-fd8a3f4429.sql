SELECT a FROM t2
      WHERE a=65
         OR (g='nmlkjih' AND f GLOB 'fghij*')
         OR c=22022
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
         OR b=671
         OR (g='onmlkji' AND f GLOB 'zabcd*')
         OR a=91
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
         OR ((a BETWEEN 47 AND 49) AND a!=48)
         OR b=1004
         OR b=960
