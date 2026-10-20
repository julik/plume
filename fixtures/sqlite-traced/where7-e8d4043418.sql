SELECT a FROM t2
      WHERE a=48
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR b=1015
         OR a=57
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR ((a BETWEEN 47 AND 49) AND a!=48)
         OR ((a BETWEEN 98 AND 100) AND a!=99)
         OR (g='onmlkji' AND f GLOB 'yzabc*')
         OR (d>=4.0 AND d<5.0 AND d NOT NULL)
         OR b=165
