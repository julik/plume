SELECT a FROM t2
      WHERE a=64
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'cdefg*')
         OR c=14014
         OR b=586
         OR c=27027
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'wxyza*')
