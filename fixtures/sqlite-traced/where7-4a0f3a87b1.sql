SELECT a FROM t2
      WHERE (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR ((a BETWEEN 54 AND 56) AND a!=55)
         OR f='lmnopqrst'
         OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR a=23
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
