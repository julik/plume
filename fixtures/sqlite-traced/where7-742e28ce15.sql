SELECT a FROM t2
      WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
         OR b=762
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR a=25
         OR ((a BETWEEN 65 AND 67) AND a!=66)
