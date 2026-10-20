SELECT a FROM t2
      WHERE ((a BETWEEN 67 AND 69) AND a!=68)
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR a=46
         OR b=187
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (g='onmlkji' AND f GLOB 'yzabc*')
