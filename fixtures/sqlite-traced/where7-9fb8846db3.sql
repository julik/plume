SELECT a FROM t2
      WHERE ((a BETWEEN 5 AND 7) AND a!=6)
         OR b=1070
         OR a=91
         OR b=1015
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR ((a BETWEEN 91 AND 93) AND a!=92)
