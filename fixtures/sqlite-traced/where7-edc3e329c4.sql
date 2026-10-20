SELECT a FROM t2
      WHERE ((a BETWEEN 95 AND 97) AND a!=96)
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR b=993
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
         OR b=663
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR b=869
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR b=121
