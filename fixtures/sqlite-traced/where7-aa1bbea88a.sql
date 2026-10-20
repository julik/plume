SELECT a FROM t2
      WHERE c=31031
         OR (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR a=49
         OR (d>=56.0 AND d<57.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'klmno*')
