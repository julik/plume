SELECT a FROM t2
      WHERE (g='edcbazy' AND f GLOB 'wxyza*')
         OR b=410
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR b=418
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR (d>=65.0 AND d<66.0 AND d NOT NULL)
