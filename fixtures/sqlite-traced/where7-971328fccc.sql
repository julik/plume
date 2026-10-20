SELECT a FROM t2
      WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'xyzab*')
         OR a=68
         OR ((a BETWEEN 14 AND 16) AND a!=15)
