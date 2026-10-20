SELECT a FROM t2
      WHERE (d>=71.0 AND d<72.0 AND d NOT NULL)
         OR 1000000<b
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR (d>=50.0 AND d<51.0 AND d NOT NULL)
         OR a=24
