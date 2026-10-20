SELECT a FROM t2
      WHERE b=245
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR c=3003
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR ((a BETWEEN 71 AND 73) AND a!=72)
