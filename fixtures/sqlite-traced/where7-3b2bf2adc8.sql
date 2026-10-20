SELECT a FROM t2
      WHERE (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR b=520
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR (d>=50.0 AND d<51.0 AND d NOT NULL)
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (g='edcbazy' AND f GLOB 'wxyza*')
         OR a=21
