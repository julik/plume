SELECT a FROM t2
      WHERE b=190
         OR a=72
         OR b=377
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR (d>=93.0 AND d<94.0 AND d NOT NULL)
         OR b=476
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
