SELECT a FROM t2
      WHERE ((a BETWEEN 71 AND 73) AND a!=72)
         OR ((a BETWEEN 96 AND 98) AND a!=97)
         OR a=92
