SELECT a FROM t2
      WHERE b=451
         OR ((a BETWEEN 11 AND 13) AND a!=12)
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR b=539
         OR a=26
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR b=465
         OR (g='jihgfed' AND f GLOB 'wxyza*')
