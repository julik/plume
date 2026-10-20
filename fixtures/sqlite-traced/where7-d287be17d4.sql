SELECT a FROM t2
      WHERE b=1059
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
         OR b=960
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR b=894
         OR c=2002
