SELECT a FROM t2
      WHERE b=828
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR ((a BETWEEN 8 AND 10) AND a!=9)
