SELECT a FROM t2
      WHERE f='fghijklmn'
         OR f='fghijklmn'
         OR (g='xwvutsr' AND f GLOB 'efghi*')
         OR b=465
         OR b=586
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
         OR b=88
         OR ((a BETWEEN 30 AND 32) AND a!=31)
         OR b=726
         OR ((a BETWEEN 51 AND 53) AND a!=52)
