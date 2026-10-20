SELECT a FROM t2
      WHERE a=42
         OR b=333
         OR (d>=35.0 AND d<36.0 AND d NOT NULL)
         OR b=1089
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR a=22
         OR b=594
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
