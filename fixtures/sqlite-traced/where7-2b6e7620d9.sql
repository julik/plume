SELECT a FROM t2
      WHERE (g='xwvutsr' AND f GLOB 'hijkl*')
         OR a=43
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR b=586
         OR c=17017
         OR (g='onmlkji' AND f GLOB 'yzabc*')
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR a=87
         OR b=968
