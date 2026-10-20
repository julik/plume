SELECT a FROM t2
      WHERE a=59
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR (g='xwvutsr' AND f GLOB 'fghij*')
         OR f='wxyzabcde'
         OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
         OR a=70
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR ((a BETWEEN 14 AND 16) AND a!=15)
