SELECT a FROM t2
      WHERE f='defghijkl'
         OR b=465
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR c=9009
         OR b=990
         OR b=132
         OR a=35
         OR (d>=78.0 AND d<79.0 AND d NOT NULL)
         OR a=81
         OR ((a BETWEEN 71 AND 73) AND a!=72)
