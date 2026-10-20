SELECT a FROM t2
      WHERE (g='jihgfed' AND f GLOB 'zabcd*')
         OR b=102
         OR b=212
         OR (d>=37.0 AND d<38.0 AND d NOT NULL)
         OR b=487
         OR (g='ihgfedc' AND f GLOB 'efghi*')
