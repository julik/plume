SELECT a FROM t2
      WHERE b=872
         OR b=209
         OR ((a BETWEEN 65 AND 67) AND a!=66)
         OR b=355
         OR b=729
         OR ((a BETWEEN 81 AND 83) AND a!=82)
         OR a=58
         OR (f GLOB '?pqrs*' AND f GLOB 'opqr*')
         OR b=608
